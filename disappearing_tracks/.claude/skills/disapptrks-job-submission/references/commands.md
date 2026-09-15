# Job submission command matrix

Status legend (see `SKILL.md` for the full definition of each):
**CONFIRMED** — actually run and confirmed working. **REFERENCE** — a real
example, not confirmed run-to-completion in a session with Claude.
**INFERRED** — constructed from `config.py`/pattern-matching a sibling mode,
not verified at all.

All commands below assume you're already inside `./shell` (the container),
in the `pocket_coffea/` directory of the checkout -- see
`disapptrks-lpc-execution` for getting there.

## `DISAPPTRKS_CATEGORY_MODE` reference

| Mode | Dataset flavor | Purpose | Physics skill |
| --- | --- | --- | --- |
| `muon_pveto` | `DATA_Muon` | Muon `Pveto` tag-probe pairs and categories | `disapptrks-lepton-backgrounds` |
| `electron_pveto` | `DATA_EGamma` | Electron `Pveto` tag-probe pairs and categories | `disapptrks-lepton-backgrounds` |
| `tau_mu_pveto` | `DATA_Muon` | Tau `Pveto` using muon low-MT tags | `disapptrks-lepton-backgrounds` |
| `tau_ele_pveto` | `DATA_EGamma` | Tau `Pveto` using electron low-MT tags | `disapptrks-lepton-backgrounds` |
| `muon_pmiss_poffline` | `DATA_Muon` | Muon `Poffline`/`Pmiss` control categories only | `disapptrks-lepton-backgrounds` |
| `electron_pmiss_poffline` | `DATA_EGamma` | Electron `Poffline`/`Pmiss` control categories only | `disapptrks-lepton-backgrounds` |
| `tau_mu_pmiss_poffline` | `DATA_Muon` | Single-muon-triggered tau control (`N_ctrl`, `Poffline`, `Pmiss`) | `disapptrks-lepton-backgrounds` |
| `tau_ele_pmiss_poffline` | `DATA_EGamma` | Compatibility/diagnostic only; excluded from final tau normalization | `disapptrks-lepton-backgrounds` |
| `tau_pmiss_poffline` | `DATA_Muon` | AN-style tau normalization via muon+tau cross-trigger | `disapptrks-lepton-backgrounds` |
| `tau_trigger_probability` | `DATA_Tau`/tau-trigger dataset | Legacy/AN muon+tau-trigger normalization diagnostic; not used by current tau control regions | `disapptrks-lepton-backgrounds` |
| `fake_tracks` | `DATA_JetMET`/`DATA_MET`/`DATA_Muon`/`DATA_EGamma` (per `DISAPPTRKS_FAKE_TRACK_CONTROL`) | Fake-track background control regions | `disapptrks-fake-track-background`/`disapptrks-track-diagnostics` |
| `fiducial_maps` | `DATA_Muon` or `DATA_EGamma` | Before/after eta-phi histograms for the electron/muon fiducial-map JSONs | `disapptrks-lepton-backgrounds` |
| `signal_acceptance` | signal MC | Signal efficiency cost of the `highPurity` requirement, per layer bin | `disapptrks-signal-acceptance` |
| `high_purity_study` | data (`DISAPPTRKS_FAKE_TRACK_CONTROL=zmumu`/`zee`) | Z-sideband high-purity/dE/dx discrimination study | `disapptrks-track-diagnostics` |
| `z_sideband_skim` | data | Writes a skimmed ROOT file for the Z-sideband selection; no categories/histograms | `disapptrks-track-diagnostics` |
| `muon_backgrounds` / `egamma_backgrounds` / `all` | — | Combine multiple modes into one pass. **Avoid for production** -- known to exceed the 64-mask `PackedSelection` cap (confirmed by direct count: 89/64 and 81/64 unique cuts respectively). Debugging only. | — |

## Pveto

### `electron_pveto` — REFERENCE (2023C EGamma, shown by mjoyce, 2026-09-09 -- submission shown, completion not confirmed)

```bash
cd pocket_coffea/
DISAPPTRKS_CATEGORY_MODE=electron_pveto \
DISAPPTRKS_ENABLE_PVETO_DIAGNOSTICS=0 \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
DISAPPTRKS_DATASET_JSON=datasets/eos_2023C_EGamma_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_EGamma \
DISAPPTRKS_DATASET_YEAR=2023_preBPix \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/2023C/electron_pveto_dedx \
  --executor dask@lpc --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 200 --queue workday
```

Note the `2023C` filename label vs. `2023_preBPix` year value -- read the
year from the dataset JSON's own metadata for a new period, don't assume the
filename label is the year value.

### `muon_pveto` / `tau_mu_pveto` / `tau_ele_pveto` — CONFIRMED

Same shape as `electron_pveto` above:

- `muon_pveto`: swap `DISAPPTRKS_CATEGORY_MODE=muon_pveto`,
  `DISAPPTRKS_DATASET_JSON` to a `DATA_Muon` dataset,
  `DISAPPTRKS_DATASET_SAMPLE=DATA_Muon`.
- `tau_mu_pveto`: same dataset as `muon_pveto` (`DATA_Muon`), just
  `DISAPPTRKS_CATEGORY_MODE=tau_mu_pveto`.
- `tau_ele_pveto`: same dataset as `electron_pveto` (`DATA_EGamma`), just
  `DISAPPTRKS_CATEGORY_MODE=tau_ele_pveto`.

Confirmed by Matt Joyce, 2026-09-13: `muon_pveto` full run completed
successfully for 2025 (`eos_2025_Muon_OSUv2.json`, full `--scaleout 200
--queue workday` run, `output_all.coffea` produced). `tau_mu_pveto` and
`tau_ele_pveto` each passed a smoke test for 2025
(`--executor iterative --limit-files 1 --limit-chunks 1`, fiducial maps
auto-resolved correctly for each flavor) before being submitted as full
`--scaleout 200 --queue workday` runs.

**P_veto category bug, fixed 2026-09-15 (`MattDev` commit `7c331f5`):**
`disapptrks estimate-lepton-background`/`estimate-tau-background` (the CLI
commands that turn these Pveto job outputs into a P_veto value, not this job
submission itself) previously read the OS/SS pair-count histograms at the
wrong PocketCoffea category (`variable_count_sum`'s `"inclusive"` default)
for every one of `muon_pveto`/`electron_pveto`/`tau_mu_pveto`/`tau_ele_pveto`,
silently zeroing P_veto's numerator/denominator regardless of the job's real
data. Any `estimate-lepton-background`/`estimate-tau-background` output
produced **before** this commit should be treated as unreliable and
re-derived once the checkout is updated past `7c331f5`.

## Poffline/Pmiss (`*_pmiss_poffline`)

Same shape as the matching Pveto command, but `DISAPPTRKS_CATEGORY_MODE=<flavor>_pmiss_poffline`,
no `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS`/`DISAPPTRKS_ENABLE_PVETO_DIAGNOSTICS`
(Poffline/Pmiss doesn't use fiducial maps or the Pveto diagnostic cutflow),
and `--outputdir analysis_output/<period>/<flavor>_pmiss_poffline`.
`muon_pmiss_poffline`/`electron_pmiss_poffline` CONFIRMED (multiple full runs
by Matt Joyce, e.g. 2022CD/2022EFG/2025 muon). `tau_pmiss_poffline` CONFIRMED
by Matt Joyce, 2026-09-13 — smoke-tested (`DATA_Muon`,
`--executor iterative --limit-files 1 --limit-chunks 1`) then submitted as a
full `--scaleout 200 --queue workday` run for 2025.

## Fake-track background (`fake_tracks`)

`basic`/`zmumu`/`zee` all **CONFIRMED** by Matt Joyce, 2026-09-13/2026-09-14:
each smoke-tested (`--executor iterative --limit-files 1 --limit-chunks 1`,
both electron and muon fiducial maps loaded correctly for every control) then
submitted as full `--scaleout 200 --queue workday` runs -- `zmumu`/`zee` for
2024 on 2026-09-13, `basic`/`zmumu`/`zee` for 2026 on 2026-09-13, and 2024
`basic` on 2026-09-14 once `eos_2024_JetMET_OSUv2.json` was published (2024
`basic` was skipped on 2026-09-13 because that dataset JSON didn't exist yet).
2024 now has its full three-control set.

### `fake_tracks` (basic control, 2025 JetMET) — REFERENCE (shown by user, not run this session)

```bash
DISAPPTRKS_CATEGORY_MODE=fake_tracks \
DISAPPTRKS_FAKE_TRACK_CONTROL=basic \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
DISAPPTRKS_ENABLE_FAKE_SIDEBAND_HISTOGRAMS=0 \
DISAPPTRKS_FAKE_TRACK_REQUIRE_DEDX_CUT=1 \
DISAPPTRKS_DATASET_JSON=datasets/eos_2025_JetMET_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_JetMET \
DISAPPTRKS_DATASET_YEAR=2025 \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/2025/fake_tracks/basic_dedx \
  --executor dask@lpc \
  --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 60 --queue workday
```

### `fake_tracks` with `zmumu`/`zee` control — INFERRED

Swap `DISAPPTRKS_FAKE_TRACK_CONTROL=zmumu` (with a `DATA_Muon` dataset) or
`zee` (with a `DATA_EGamma` dataset); everything else follows the pattern
above. Not confirmed by an actual run.

## Signal acceptance (`signal_acceptance`)

REFERENCE — from `docs/pocket_coffea_workflows.md` in the checkout, not
confirmed run by Claude this session, but a documented working example (uses
the `iterative` executor, not Dask, since it targets a small local signal
MC file):

```bash
DISAPPTRKS_CATEGORY_MODE=signal_acceptance \
DISAPPTRKS_ENABLE_SIGNAL_DEDX_HISTOGRAMS=1 \
DISAPPTRKS_OUTPUT_VARIANT=chargino700_high_purity \
DISAPPTRKS_DATASET_JSON=datasets/local_chargino_700.json \
DISAPPTRKS_DATASET_SAMPLE=SIGNAL_Chargino \
DISAPPTRKS_DATASET_YEAR=2022_postEE \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON=data/fiducial_maps/electron_fiducial_map_2022EFG_v2.json \
DISAPPTRKS_MUON_FIDUCIAL_MAP_JSON=data/fiducial_maps/muon_fiducial_map_2022EFG_v2.json \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/2022EFG/signal_acceptance/chargino700_high_purity \
  --executor iterative
```

For a Dask-scale signal sample instead of a small local file, swap in the
usual `--executor dask@lpc ...` block; not confirmed.

## Fiducial maps, high-purity study, Z-sideband skim, tau trigger probability

- `fiducial_maps`: `DISAPPTRKS_CATEGORY_MODE=fiducial_maps`, a `DATA_Muon` or
  `DATA_EGamma` dataset JSON, matching `DISAPPTRKS_DATASET_SAMPLE`/`YEAR`.
  INFERRED, no confirmed run yet.
- `high_purity_study`: `DISAPPTRKS_CATEGORY_MODE=high_purity_study` plus
  `DISAPPTRKS_FAKE_TRACK_CONTROL=zmumu` or `zee` (required -- the mode
  raises otherwise); optionally `DISAPPTRKS_HIGH_PURITY_STUDY_LAYERS`.
  INFERRED, no confirmed run yet.
- `z_sideband_skim`: `DISAPPTRKS_CATEGORY_MODE=z_sideband_skim` plus
  `DISAPPTRKS_SKIM_OUTPUT` (required output directory/XRootD URL for the
  skimmed ROOT file) and a `DISAPPTRKS_FAKE_TRACK_CONTROL` choosing the
  skim's sideband definition. INFERRED, no confirmed run yet.
- `tau_trigger_probability` — **CONFIRMED**, `DATA_Muon` (not a separate
  tau-trigger dataset — corrected 2026-09-13; the prior "rarely
  used"/"not used by the current tau estimate" note here and in
  `disapptrks-lepton-backgrounds/references/workflow.md` was stale.
  `disapptrks-lepton-backgrounds/SKILL.md` is explicit that the tau estimate
  *always* supplies `--tau-probability-files` from this job — it's the
  standard production path, not a legacy/AN-only comparison). Smoke-tested
  by Matt Joyce, 2026-09-13 (`--executor iterative --limit-files 1
  --limit-chunks 1`), then submitted as a full `--scaleout 200 --queue
  workday` run for 2025 with `DISAPPTRKS_CATEGORY_MODE=tau_trigger_probability`,
  same dataset JSON/sample/year as `tau_pmiss_poffline`.

Fill in `fiducial_maps`/`high_purity_study`/`z_sideband_skim` with real
commands (and update their status) the first time each is actually run and
confirmed.
