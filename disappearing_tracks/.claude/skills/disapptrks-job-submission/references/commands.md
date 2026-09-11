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

### `muon_pveto` / `tau_mu_pveto` / `tau_ele_pveto` — INFERRED

Same shape as `electron_pveto` above:

- `muon_pveto`: swap `DISAPPTRKS_CATEGORY_MODE=muon_pveto`,
  `DISAPPTRKS_DATASET_JSON` to a `DATA_Muon` dataset,
  `DISAPPTRKS_DATASET_SAMPLE=DATA_Muon`.
- `tau_mu_pveto`: same dataset as `muon_pveto` (`DATA_Muon`), just
  `DISAPPTRKS_CATEGORY_MODE=tau_mu_pveto`.
- `tau_ele_pveto`: same dataset as `electron_pveto` (`DATA_EGamma`), just
  `DISAPPTRKS_CATEGORY_MODE=tau_ele_pveto`.

Not yet confirmed by an actual run -- smoke-test first
(`--executor iterative --limit-files 1 --limit-chunks 1`, dropping the
Dask/Condor flags) and update this entry to CONFIRMED once one succeeds.

## Poffline/Pmiss (`*_pmiss_poffline`)

INFERRED, per the lepton-backgrounds skill's documented pattern: same shape
as the matching Pveto command, but `DISAPPTRKS_CATEGORY_MODE=<flavor>_pmiss_poffline`,
no `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS`/`DISAPPTRKS_ENABLE_PVETO_DIAGNOSTICS`
(Poffline/Pmiss doesn't use fiducial maps or the Pveto diagnostic cutflow),
and `--outputdir analysis_output/<period>/<flavor>_pmiss_poffline`. Not
confirmed by an actual run yet.

## Fake-track background (`fake_tracks`)

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

INFERRED only — no confirmed or reference example captured yet for any of
these four. `config.py` requires, at minimum:

- `fiducial_maps`: `DISAPPTRKS_CATEGORY_MODE=fiducial_maps`, a `DATA_Muon` or
  `DATA_EGamma` dataset JSON, matching `DISAPPTRKS_DATASET_SAMPLE`/`YEAR`.
- `high_purity_study`: `DISAPPTRKS_CATEGORY_MODE=high_purity_study` plus
  `DISAPPTRKS_FAKE_TRACK_CONTROL=zmumu` or `zee` (required -- the mode
  raises otherwise); optionally `DISAPPTRKS_HIGH_PURITY_STUDY_LAYERS`.
- `z_sideband_skim`: `DISAPPTRKS_CATEGORY_MODE=z_sideband_skim` plus
  `DISAPPTRKS_SKIM_OUTPUT` (required output directory/XRootD URL for the
  skimmed ROOT file) and a `DISAPPTRKS_FAKE_TRACK_CONTROL` choosing the
  skim's sideband definition.
- `tau_trigger_probability`: `DISAPPTRKS_CATEGORY_MODE=tau_trigger_probability`
  with a tau-trigger dataset. Rarely used -- confirm with
  `disapptrks-lepton-backgrounds` whether it's actually needed before running
  it (the current tau estimate doesn't use it).

Fill these in with real commands (and update their status) the first time
each one is actually run and confirmed.
