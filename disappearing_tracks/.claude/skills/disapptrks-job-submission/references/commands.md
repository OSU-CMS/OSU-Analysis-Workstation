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
| `tau_pmiss_poffline` | `DATA_Muon` | Tau normalization control (`N_ctrl`, `Poffline`, `Pmiss`) on the IsoMu24 baseline; the muon+tau cross-trigger enters only as a diagnostic stage | `disapptrks-lepton-backgrounds` |
| `tau_trigger_probability` | `DATA_Muon` | P(tau) = N(cross)/N(IsoMu24) factor that `estimate-tau-background` multiplies into `N_ctrl`; cross-trigger per `triggers.py` (HPS27 2022-2023, PNet26 2024+) | `disapptrks-lepton-backgrounds` |
| `fake_tracks` | `DATA_JetMET`/`DATA_MET`/`DATA_Muon`/`DATA_EGamma` (per `DISAPPTRKS_FAKE_TRACK_CONTROL`) | Fake-track background control regions | `disapptrks-fake-track-background`/`disapptrks-track-diagnostics` |
| `fiducial_maps` | `DATA_Muon` or `DATA_EGamma` | Before/after eta-phi histograms for the electron/muon fiducial-map JSONs | `disapptrks-lepton-backgrounds` |
| `signal_acceptance` | signal MC | Signal efficiency cost of the `highPurity` requirement, per layer bin | `disapptrks-signal-acceptance` |
| `missing_hits_control` | `DATA_JetMET` + background MC | Muon control regions (legacy `MuonCtrlSelection`/`HitsSystematicsCtrlSelection`) for the missing-hits correction fits and hit systematics | `disapptrks-systematics` |
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

CONFIRMED (single file, iterative) -- run by Claude for Matt Joyce, 2026-10-09, on `cmslpc341`,
inside `./shell` in tmux, on the privately produced 2024 wino M700 ctau100 file (280 events,
~10 s). Fiducial maps auto-resolved by era from EOS (`*_fiducial_map_2024_v2.json`: 91 electron /
129 muon hot spots), so no `*_FIDUCIAL_MAP_JSON` overrides needed. **Inside `./shell` the grid proxy
is not found by default** (the container sources `/srv/.bashrc`, not your profile), and
PocketCoffea's iterative executor still checks it -- export it first:

```bash
export X509_USER_PROXY=/uscms/home/$USER/x509up_u$(id -u)
cd /srv/pocket_coffea
DISAPPTRKS_CATEGORY_MODE=signal_acceptance \
DISAPPTRKS_OUTPUT_VARIANT=private_wino700_ctau100_hscp \
DISAPPTRKS_DATASET_JSON=datasets/private_2024_wino700_ctau100_hscp_test.json \
DISAPPTRKS_DATASET_SAMPLE=SIGNAL_Chargino \
DISAPPTRKS_DATASET_YEAR=2024 \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/2024/signal_acceptance/private_wino700_ctau100_hscp \
  --executor iterative
disapptrks summarize-signal-high-purity \
  analysis_output/2024/signal_acceptance/private_wino700_ctau100_hscp/output_all.coffea \
  --sample SIGNAL_Chargino --full-cutflow
```

Files under `/uscms_data/...` aren't visible inside `./shell` (only the checkout as `/srv` and
`/uscms/home/$USER` are bound) -- put a local test file on EOS and reference it by `root://` URL.

## Signal search region with lifetime-reweighting columns (`search_region`)

CONFIRMED -- run by Claude for Matt Joyce, 2026-09-30, on `cmslpc339`, inside `./shell`
(3.1 min, 597k events, 12 masses). `DISAPPTRKS_SEARCH_LIFETIME_COLUMNS=1` is an opt-in
block in `config.py` (committed on `MattDev` as `a1fda7d`, 2026-10-12) that stores `GenChargino` `ctau`/`isDecayed` (+ `_N`)
and the event `weight` as `ColOut`s in each `disappearing_track_<layer>` category, for
Run 2-style offline lifetime reweighting. Without the flag this is the ordinary
`search_region` signal job; histogram yields were byte-identical to the earlier
`search_region_ctau1000` output. The `weight` column is *not* rescaled by
`sum_genweights` -- divide by it by hand.

```bash
DISAPPTRKS_CATEGORY_MODE=search_region \
DISAPPTRKS_SEARCH_LIFETIME_COLUMNS=1 \
DISAPPTRKS_DATASET_JSON=datasets/eos_signal_ctau1000_2022EFG_OSUv3.json \
DISAPPTRKS_DATASET_SAMPLE=SIGNAL_Chargino \
DISAPPTRKS_DATASET_YEAR=2022_postEE \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON=data/fiducial_maps/electron_fiducial_map_2022EFG_v2.json \
DISAPPTRKS_MUON_FIDUCIAL_MAP_JSON=data/fiducial_maps/muon_fiducial_map_2022EFG_v2.json \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/2022EFG/search_region_ctau1000_lifetimecols \
  --executor iterative
```

### With signal pileup reweighting (`DISAPPTRKS_SIGNAL_PILEUP=1`)

CONFIRMED -- run by Claude for Matt Joyce, 2026-10-08, on `cmslpc366`, inside `./shell`: all 16
(era x generated ctau 10/100/1000/10000 cm) jobs via `pocket_coffea/run_pileup_all.sh` (2-20 min each,
1h45 total, iterative). Opt-in block in `config.py` (committed on `MattDev` as `a1fda7d`, 2026-10-12): adds PocketCoffea's built-in `pileup` weight (nominal) and its
`pileupUp/Down` weight variation, `bysample`-scoped to `SIGNAL_Chargino`. Histograms gain
`pileupUp/Down` on the `variation` axis; the lifetime columns gain `weight_variation_pileupUp/Down`.
Add the flag to the command above; outputs go to `search_region_ctau<X>_lifetimecols_pu_v1`.
Needs `/cvmfs/cms-griddata.cern.ch` (LUM pileup files), present on the LPC login nodes -- the
Condor-worker fallback in `config.py` only covers the jet-veto maps, so a worker without that mount fails.
Validated against the `_v2` outputs: same `sum_genweights`, raw counts and events; only the weight differs.

## Missing-hits correction control regions (`missing_hits_control`)

### Smoke test, 2022EFG JetMET — CONFIRMED (run by Claude for mjoyce, 2026-10-15; smoke test only)

```bash
DISAPPTRKS_CATEGORY_MODE=missing_hits_control \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
DISAPPTRKS_DATASET_JSON=datasets/eos_2022EFG_JetMET_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_JetMET \
DISAPPTRKS_DATASET_YEAR=2022_postEE \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/2022EFG/missing_hits_control/smoke \
  --executor iterative \
  --limit-files 1 --limit-chunks 1
```

Ran to completion in ~16 s (156329 events read, 11615 preselected, 1196
basic_selection, 130 `missing_hits_muon_ctrl`, 140
`missing_hits_ctrl_no_inner_middle`). Use the `*_JetMET_OSUv2.json` files (not
OSUv3, which is the signal-MC-only lifetime-branch production). MET-trigger
skim (`met_hlt`); MC gets `genWeight`/`lumi`/`XS` plus `pileup` in this mode.
The highPurity and dE/dx terms are on (dE/dx follows
`DISAPPTRKS_SEARCH_REQUIRE_DEDX_CUT`, default on). Histograms:
`missingHitsMuonCtrl_missingOuter_TOBLayers_stripLayers`,
`missingHitsNoInnerMiddle_missingMiddle_stripLayers`,
`missingHitsNoInnerMiddle_missingMiddle_missingInner`.

**Running non-interactively:** `./shell` takes no command, so a scripted run
uses the same `apptainer exec` (binds from `./shell`) with a script that
sources `/srv/.bashrc` **and exports `X509_USER_PROXY`** -- mjoyce's proxy is
`/uscms/home/mjoyce/x509up_u51387` (exported only by his login profile; without
it the iterative executor fails with "VOMS proxy expirend or non-existing").

Full data production (dask@lpc, `--queue workday`, scaleout ~60-200 by file
count, output `analysis_output/<era>/missing_hits_control/data_v1`) ran
2026-10-15/16 for 2022CD-2023D (all 100% of events) and 2024-2026. Background
MC (`DISAPPTRKS_DATASET_JSON=datasets/eos_<era>_BkgMC_OSUv3.json`,
`DISAPPTRKS_DATASET_YEAR=<MC year>`, no `DISAPPTRKS_DATASET_SAMPLE` -- the JSON has
one sample per process group; output `bkgmc_v1`, plus `bkgmc_v1_pu<year>` for
2023D with a pileup target) ran 2026-10-20/21 -- CONFIRMED. Running six MC jobs
at once caused xrootd read failures: ~0.7 % of chunks were silently dropped by
`skip-bad-files`, and two runs hung at 99 % with lost Dask workers and had to be
stopped and resubmitted alone. Submit MC runs one or two at a time.

**2024-2026 fits use 2023D (Summer23BPix) MC** (Matt, 2026-10-15/16): add
`DISAPPTRKS_PILEUP_TARGET_YEAR=2024|2025|2026` to the 2023D MC run, which swaps
`pileup` for `pileup_target` (`pocket_coffea/pileup_weights.py`): Summer23BPix
MC reweighted to that year's data pileup profile, from
`data/pileup/puWeights_Summer23BPix_to_target.json.gz` (built by
`scripts/make_target_pileup_weights.py`; **2026 = 2025 profile as a labelled
stand-in** until LUM publishes a 2026 profile). It raises on any MC sample whose
year is not `2023_postBPix`. The same switch with `DISAPPTRKS_SIGNAL_PILEUP=1`
reweights the 2023D signal for 2024-26 yields (variation name
`pileup_target`, not `pileup`). Smoke-tested on 2023D signal 2026-10-16.

**Signal production run -- CONFIRMED** (run by Claude for Matt Joyce, 2026-10-21, `cmslpc354`): all four
2023D sources (10/100/1000/10000 cm) x targets 2024/2025/2026 via
`limits/lifetime_reweighted_run3/scripts/run_pileup_target_all.sh` (copy in the checkout's `pocket_coffea/`),
one tmux session per target (`TARGET=<year> apptainer exec ... /srv/pocket_coffea/run_pileup_target_all.sh`
with `./shell`'s binds), ~20 min per target, iterative. `DISAPPTRKS_DATASET_YEAR` stays `2023_postBPix`,
so the `lumi` weight is the 2023D lumi (the card builder scales to the target lumi). Outputs
`analysis_output/2023D/search_region_ctau<X>_lifetimecols_pu<year>_v1`; same `sum_genweights` and cutflow
as `_pu_v1`, columns carry `weight_variation_pileup_targetUp/Down`; 2025 and 2026 are identical (same
payload arrays). **Stagger parallel container launches**: `/srv/.bashrc` runs `pip install -e .` on
every start, and three simultaneous starts raced on the shared `.env` (`Could not install packages ...
/srv/.env/bin/disapptrks`, a transient `~isapptrks-nano` dist). The last install won and the jobs ran,
but start sessions ~30 s apart.

### Applying the missing-hits (hit-drop) correction to MC — CONFIRMED (Claude for mjoyce, 2026-10-22)

Add `DISAPPTRKS_MISSING_HITS_CORRECTION=1` to any MC job (any mode; data is never
touched). Each MC track's `missingMiddleHits`/`missingOuterHits` are randomly increased
before any selection (legacy `TrackBase.cc` algorithm; draws seeded from run/lumi/event/
track index, so reproducible); the raw counts stay as `missingMiddleHitsRaw`/
`missingOuterHitsRaw`. Probabilities: `data/missing_hits_corrections/hit_drop_probabilities_v1.json`
(v1 fits, accepted by Matt 2026-10-22), embedded in the job parameters. The period follows
the MC year (2022_preEE→2022CD, 2022_postEE→2022EFG, 2023_preBPix→2023C,
2023_postBPix→2023D); for 2023D MC standing in for 2024-26 it follows
`DISAPPTRKS_PILEUP_TARGET_YEAR` automatically (override: `DISAPPTRKS_MISSING_HITS_CORRECTION_PERIOD`;
refused on non-2023D samples). Confirmed by a 2023D signal `search_region` smoke test and a
full 2023D background-MC `missing_hits_control` run (`bkgmc_v1_hitdrop`) reproducing the
fit's analytic corrected distributions. **The 2026-10-21 signal production above predates
this switch -- its outputs are uncorrected.** Corrected signal production: `pocket_coffea/run_hitdrop_signal_all.sh`
(`ERAS="..."` / `TARGETS="..."`, 28 jobs, outputs `*_hitdrop_v1`), CONFIRMED 2026-10-22 (cmslpc330, all exit 0).

### Missing-outer-hits systematic inputs (`DISAPPTRKS_SEARCH_MISSING_OUTER_COLUMNS=1`) — CONFIRMED (Claude for mjoyce, 2026-10-23)

`search_region` only: adds `disappearing_track_noMissOuter_<layer>` categories (search selection minus only the
>= 3 missing-outer cut, legacy `DisTrkNoNMissOut`) with GenChargino lifetime columns and per-track `missingOuterHits`
(hit-drop corrected when that switch is on). Existing categories/histograms unchanged (verified). Production:
`pocket_coffea/run_missing_outer_signal_all.sh` (same jobs as `run_hitdrop_signal_all.sh` plus this flag, outputs
`*_hitdrop_mo_v1`), 28 jobs, ~1 h in three sessions, all exit 0. Consumed by the limits dir's
`scripts/compute_missing_outer_systematic.py` (SYST-08).

## MET-no-mu fix: PF muons only (default since 2026-10-27)

The stored OSUNano `MetNoMu` adds back **every** muon to the PF MET; Run 2 (OSUT3Analysis `Met.cc`) added back
only PF muons. Since 2026-10-27 the LPC checkout's `DisappTrksProcessor.process_extra_after_skim` replaces
`events.MetNoMu` with `selections.met_no_mu_pf_only()` (stored value minus the non-PF NanoAOD muons) for
**every mode**, before anything reads it (backups `*.bak-pre-metnomufix-20261027`, uncommitted). Skimmed files
keep the raw branch. `DISAPPTRKS_METNOMU_ALL_MUONS=1` restores the old value. Validated: unchanged where an event
has no non-PF muon, exact elsewhere; basic selection +1.8 % on 2022EFG JetMET (1-2 files), +0.4 % on 2023D
signal. **Outputs made before 2026-10-27 (all signal/background estimates so far) used the old definition** --
expect ~1 % shifts when they are rerun.

## ISR scale-factor control sample (`isr_zmumu`) and signal ISR weight

Opt-in mode (uncommitted LPC checkout, 2026-10-23/26; backups `*.bak-pre-isr-20261023`,
`*.bak-pre-isrmusf-20261026`): the legacy `ZtoMuMu` selection (IsoMu24 skim; exactly two muons with
pT > 26, |eta| < 2.1, tight ID, pfRelIso04 < 0.15, opposite charge, |m - mZ| < 10) for the ISR scale
factor (SIG-06), histograms `isrZMuMu_pt` (2 GeV bins), `isrZMuMu_mass`, `isrZMuMu_METNoMu`. MC gets
genWeight/lumi/XS/pileup plus the Run 2 `weightsWithMuonSF` equivalents: `sf_mu_id`, `sf_mu_iso`
(key switched to `NUM_TightPFIso_DEN_TightID`) on the two Z muons and `sf_mu_trigger_leading` (IsoMu24 SF
on the leading muon only; `isr_weights.py`). Smoke-tested on 2023D (1 file): data histograms identical
with/without SFs; MC weights x0.977 (DY), nearly flat in pT(mumu). `search_region` output identical with the
code added (regression check, 2026-10-23). CONFIRMED -- full runs via `pocket_coffea/run_isr_zmumu_all.sh`
(`KIND=data`, `data_v1`) and `run_isr_zmumu_mc_v2.sh` (`KIND=mc`, `bkgmc_v2`; `bkgmc_v1` had no SFs and was
stopped), dask@lpc workday, scaleout files/4 (30-200), outputs `analysis_output/<era>/isr_zmumu/<tag>/`:

```bash
DISAPPTRKS_CATEGORY_MODE=isr_zmumu DISAPPTRKS_DATASET_JSON=datasets/eos_<era>_Muon_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_Muon DISAPPTRKS_DATASET_YEAR=<year> \
python -m pocket_coffea.scripts.runner run --cfg config.py --outputdir analysis_output/<era>/isr_zmumu/data_v1 \
  --executor dask@lpc --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml --scaleout <N> --queue workday
# background MC: DISAPPTRKS_DATASET_JSON=datasets/eos_<era>_BkgMC_OSUv3.json, no DISAPPTRKS_DATASET_SAMPLE
```

**Non-interactive dask@lpc needs `COFFEA_IMAGE` and `COFFEA_IMAGE_FULL`** in the environment (`./shell`
exports them; a bare `apptainer exec` does not), otherwise lpcjobqueue fails at once with
"$COFFEA_IMAGE_FULL environment not set". Also: Ctrl-C into a tmux pane running `script | tee` kills the
whole loop, not just the current era.

**Official jet energy corrections, `DISAPPTRKS_JET_CALIBRATION=1`** (opt-in, LPC checkout 2026-10-28, backup
`config.py.bak-pre-jec-20261028`): enables PocketCoffea's `JetsCalibrator` on the AK4 PUPPI `Jet` collection only
(default JME tags: Summer22(EE)_22Sep2023_V4, Summer23(BPix)Prompt23_V4; data incl. run-dependent L2L3Residual, MC
JER smearing). Needed because the OSUv2 2023C/D data Nano (GT `130X_dataRun3_PromptAnalysis_v1`) carries almost
no JEC -- data jets ~10-15% low vs MC in Z+jet balance; with the calibrator data/MC is 0.98-1.00 (all eras). MET
and MetNoMu are **not** recalibrated (2023D stored Type-1 MET is also ~5-10% low in data -- open follow-up).
CONFIRMED in a 1-file 2023D `isr_zmumu` smoke test (data Z+jet fraction 1.09% -> 1.34%, DY unchanged at 1.33%).
ISR v3/v4 inputs: `pocket_coffea/run_isr_zmumu_v4.sh` (`data_v3`, `bkgmc_v4`, flag set, scaleout cap 100).

**PUPPI MET-no-mu, `DISAPPTRKS_PUPPI_METNOMU=1`** (opt-in, LPC checkout 2026-10-29, backups
`*.bak-pre-puppimet-20261029` of config.py, workflow.py, selections.py; implies `DISAPPTRKS_JET_CALIBRATION`):
calibrates `Jet` and `CorrT1METJet`, runs PocketCoffea's `METCalibrator` (Type-1 PUPPI MET from `RawPuppiMET`,
the JME NanoAOD recipe -- jets and MET from the same JEC), and rebuilds `MetNoMu` = recalibrated `PuppiMET` + PF
NanoAOD muons (`selections.met_no_mu_puppi`) at the start of `apply_object_preselection` (after the calibrators;
the PF-only fix in `process_extra_after_skim` is skipped). The lepton transverse-mass MET also switches to the same
`PuppiMET` in every year. Changes the search's main variable (PF -> PUPPI): trigger efficiency/SF and all
background estimates must be redone with it. Smoke-tested (1 file 2023D data + DY, `isr_zmumu`, all modes exit 0).
**Worker gotcha (fixed 2026-10-29, commit `542740d` on MattDev):** dask/condor workers only inherit the
fiducial-map `DISAPPTRKS_*` env vars (`executors_lpc.get_worker_env`), so a flag the *processor* reads from
`os.environ` is silently off on workers even though local/futures smoke tests pass. The first full ISR rerun
with this flag (`run_isr_zmumu_v5.sh`, `data_v4`/`bkgmc_v5`) hit exactly that: calibrators ran (config-level) but
MetNoMu stayed the stored PF one -- histograms identical to `data_v3`/`bkgmc_v4`. Now carried as
`params.disapptrks.puppi_met_no_mu` (env only as fallback); verified on dask@lpc workers (2023D inclusive
<MET-no-mu> 49.9 -> 29.8 GeV). `DISAPPTRKS_METNOMU_ALL_MUONS` is still env-only in the processor (off on
workers). Any new processor-side flag must go through `parameters["disapptrks"]` in config.py.
2024-2026 (Nano v15): CONFIRMED on 1 file each of Muon (`isr_zmumu`) and JetMET (`fake_tracks` basic) data. 2026
needed a `met_calibration["2026"]` entry (PocketCoffea 0.9.13 stops at 2025; config.py copies 2025's -- commit
`b3492a2`). Inclusive Z->mumu <MET-no-mu> drops PF -> PUPPI by ~20-25 GeV in every year (2024 50.2 -> 29.5,
2025 53.5 -> 33.0, 2026 62.9 -> 38.0), as in 2023D.
**JEC sanity veto (always on, commit `722217e`):** data-quality cut `jet_jec_sanity` vetoes events with any `Jet`
(and, in PUPPI mode, `CorrT1METJet`) rawFactor > 0.9 after the calibrators (JME L2Relative safeguard). Zero
events hit with the official JECs in ~147M events 2022CD-2026; 32 stored-JEC jets exceed it (calibration off).
**Triggers:** no PUPPI MET HLT paths exist in any 2022-2026 file -- the MET trigger OR stays PF-based; measure
trigger efficiency vs offline PUPPI MET-no-mu. `PFMETNoMu110_..._FilterHF` fires 0% in 2025-26.

**MET-trigger efficiency / signal trigger SF, `DISAPPTRKS_CATEGORY_MODE=met_trigger_efficiency`** (LPC checkout
2026-10-30, backups `*.bak-pre-mettrig-20261030`; TRIG-02/03): Run 2 GrandOr method -- IsoMu24 skim, >= 1 tag muon
(pT > 55, |eta| < 2.1, tight ID, pfRelIso04 < 0.15, its IsoTrack (dR < 0.01) with 0 missing inner/middle hits),
leading jet |eta| <= 2.4 or none; categories `met_trigger_denominator` / `met_trigger_numerator` (+ `met_hlt` OR),
histogram `metTriggerEfficiency_METNoMu` (5 GeV bins). Data `DISAPPTRKS_DATASET_SAMPLE=DATA_Muon` on
`eos_<era>_Muon_OSUv2.json` (2022CD-2026); MC `DISAPPTRKS_DATASET_SAMPLE=MC_WtoLNu` on `eos_<era>_BkgMC_OSUv3.json`
(2022-23 only). Always with `DISAPPTRKS_PUPPI_METNOMU=1`. Production script `pocket_coffea/run_met_trigger_eff_v1.sh`
(KIND=mc|data, outputs `analysis_output/<era>/met_trigger_efficiency/{data_v1,wjets_v1}`). SFs:
`limits/lifetime_reweighted_run3/scripts/make_met_trigger_scale_factors.py` (2024-26 = own data / 2023D MC).
Smoke test 1 file 2023D: tag muons 98% (data) / 100% (MC) matched to an IsoTrack, 81% / 89% pass the hit cuts.
Full production CONFIRMED (Claude for mjoyce, 2026-10-30): all 7 eras data + 2022-23 W MC; SFs in
`limits/lifetime_reweighted_run3/results/met_trigger_scale_factors_v1/`.

### Background estimates with PUPPI MET-no-mu, all eras -- CONFIRMED (Claude for mjoyce, 2026-10-30 -- 11-02)

`pocket_coffea/run_bkg_puppi_v1.sh` (`CHAIN=fake|electron|muon|tau`, one tmux session per chain, inside the
container) runs every fake/electron/muon/tau job for 2022CD-2026 with `DISAPPTRKS_PUPPI_METNOMU=1`, the env vars
above, scaleout min(files/4, 100), outputs `analysis_output/<era>/<mode>_dedx_puppi_v1`. 2023C runs last with
`DISAPPTRKS_MUON_FIDUCIAL_MAP_JSON=.../muon_fiducial_map_2023C_puppi_v1.json` (the published 2023C muon map is a copy of
2023D's). All 77 outputs complete; six 2024/2025 ones miss <= 0.3% of events (skip-bad-files). **Gotcha:** several
dask@lpc runners starting at the same moment on one node can fail with `OSError: [Errno 98] Address already in use`
(scheduler port clash, job dies in ~15 s) -- rerun; the chain script skips finished outputs. Estimates:
`tables/*_dedx_puppi_v1*` (tau with `--trigger-efficiency 0.90 --trigger-efficiency-error 0.006`, Matt's choice);
published to `disapptrks_output/<era>/<mode>_dedx_puppi_v1` and `<era>|combined/tables_dedx_puppi_v1`.

Signal side: `DISAPPTRKS_SIGNAL_ISR=1` (+ optional `DISAPPTRKS_ISR_SF_FILE`, default
`data/isr/isr_scale_factors_v1.json` from `limits/.../scripts/make_isr_scale_factors.py`) adds the `isr`
weight (SF at the generator-level chargino/neutralino pair pT, last-not-first copies, legacy
ISRWeightProducer; era from the dataset year, so 2023D for the 2024-26 template runs) with `isrUp/isrDown`
next to the pileup weight. Tested with a flat dummy SF 2.0 +- 0.1: yields x2.0000, up/down x1.05/x0.95.

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

### `tau_trigger_probability` full runs, 2022CD/2022EFG/2023C/2023D/2024 — CONFIRMED (Claude for mjoyce, 2026-10-22)

Rerun after `c1c14b1` switched the cross-trigger in `src/disapptrks/triggers.py`
to HPS27 (2022-2023) / PNet26 (2024+): the 2026-09-16 `_dedx` outputs for these
periods used HPS30, which is unprescaled but fires ~1/330 as often, so their
P(tau) is ~300x too small. Each run processed its dataset JSON's full
`nevents` (checked against the runner's `Total` row); 2.6-38 min with 200
workers. From `pocket_coffea/` inside `./shell`:

```bash
DISAPPTRKS_CATEGORY_MODE=tau_trigger_probability \
DISAPPTRKS_DATASET_JSON=datasets/eos_2022CD_Muon_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_Muon \
DISAPPTRKS_DATASET_YEAR=2022_preEE \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/2022CD/tau_trigger_probability_dedx_crossfix \
  --executor dask@lpc --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 200 --queue workday
```

Other periods: swap the JSON/year (`2022EFG`/`2022_postEE`, `2023C`/`2023_preBPix`,
`2023D`/`2023_postBPix`, `2024`/`2024`) and the output period. Resulting
`extract-tau-trigger-probability` values: 2022CD 0.0186, 2022EFG 0.0214, 2023C
0.0210, 2023D 0.0200, 2024 0.0107 (was 5-8e-5 with HPS30). The `_crossfix`
suffix marks this round; outputs kept local, not published to EOS (per mjoyce).
Note the P(tau) definition itself is still under review -- see
`disapptrks-lepton-backgrounds`.

Fill in `fiducial_maps`/`high_purity_study`/`z_sideband_skim` with real
commands (and update their status) the first time each is actually run and
confirmed.
