# Lepton background workflow

## Repository context

Two related codebases sit under the same parent workspace:

- `ref/DisappTrks` -- the legacy CMSSW/OSUT3 disappearing-tracks analysis code. Physics
  reference for the AN formulas, especially:
  - `BackgroundEstimation/python/`
  - `BackgroundEstimation/test/bkgdEstimate_2022.py`
  - `StandardAnalysis/python/EventSelections.py`
  - `StandardAnalysis/python/Cuts.py`
- `ref/DisappTrks_Nano` -- the newer custom-NanoAOD + PocketCoffea migration. All
  lepton-background development happens here.

## Main Nano files

| File | Role |
| --- | --- |
| `src/disapptrks/selections.py` | Physics definitions on Awkward arrays: object masks, tag definitions, probe-track masks, pair builders, AN-style cutflow masks. |
| `pocket_coffea/workflow.py` | Builds derived event/object collections and event-level counters during PocketCoffea processing. Includes `_lepton_background_track_mask` and `_store_lepton_background_controls`. |
| `pocket_coffea/cuts.py` | PocketCoffea `Cut` objects, usually thin wrappers around counts or booleans stored by `workflow.py`. |
| `pocket_coffea/config.py` | Dataset filtering, category-mode routing, category selection, histogram variable selection (`_variables_for_mode`, `_skim_cuts_for_mode`). |
| `src/disapptrks/lepton_backgrounds.py` | Computes final lepton-background estimates from `Pveto`, `Poffline`, `Pmiss`; `pveto_count_from_pair_counts(...)`. |
| `src/disapptrks/tables.py` | Cutflow and Pveto table extraction/formatting. |
| `src/disapptrks/cli.py` | CLI commands for fiducial maps, Pveto tables, fake-track tables, lepton-background estimates. |
| `docs/pocket_coffea_workflows.md` | Collaborator-facing workflow guide -- keep it current when modes or commands change. |

## Production modes (`DISAPPTRKS_CATEGORY_MODE`)

| Mode | Dataset | Purpose |
| --- | --- | --- |
| `fiducial_maps` | `DATA_Muon` or `DATA_EGamma` | Before/after eta-phi histograms used to build the electron and muon fiducial-map JSON/NPZ files. |
| `muon_pveto` | `DATA_Muon` | Muon `Pveto` tag-probe pairs and categories. |
| `electron_pveto` | `DATA_EGamma` | Electron `Pveto` tag-probe pairs and categories. |
| `tau_mu_pveto` | `DATA_Muon` | Tau `Pveto` using muon low-`MT` tags. |
| `tau_ele_pveto` | `DATA_EGamma` | Tau `Pveto` using electron low-`MT` tags. |
| `muon_pmiss_poffline` | `DATA_Muon` | Muon `Poffline`/`Pmiss` control categories only. |
| `electron_pmiss_poffline` | `DATA_EGamma` | Electron `Poffline`/`Pmiss` control categories only. |
| `tau_mu_pmiss_poffline` | `DATA_Muon` | Legacy-equivalent single-muon-triggered tau control for `N_ctrl`, `Poffline`, `Pmiss`; no low-`MT` muon required. |
| `tau_ele_pmiss_poffline` | `DATA_EGamma` | Compatibility/diagnostic only; excluded from the final tau normalization. |
| `tau_pmiss_poffline` | `DATA_Muon` | AN-style tau normalization using the muon+tau cross-trigger; no low-`MT` offline muon required. |
| `tau_trigger_probability` | `DATA_Muon` | `P(tau) = N_cross / N_muon` (dissertation eq. 7.7-7.8); the tau estimate always consumes this via `--tau-probability-files` -- standard production path, not a legacy/AN-only comparison. See the matching entry further below. |
| `fake_tracks` | `DATA_JetMET`, `DATA_MET`, `DATA_Muon`, or `DATA_EGamma` | Fake-track estimate control regions -- a separate background (see the `disapptrks-track-diagnostics` skill's `references/fake-track-background-estimate.md`), not part of this lepton-background workflow. |

Avoid `muon_backgrounds`, `egamma_backgrounds`, and `all` for production -- they select
too many categories at once and can exhaust `PackedSelection` slots.

## Fiducial maps

Jobs write `ElectronFiducialBefore/After` and `MuonFiducialBefore/After`. Build the
JSON/NPZ maps from the `.coffea` output:

```bash
disapptrks make-fiducial-map \
  --flavor electron \
  --output-json /path/to/electron_fiducial_map.json \
  /path/to/fiducial_map_output/output_*.coffea
```

(`--flavor muon` for the muon map.) Hot spots use `--threshold 2.0` by default; for an
era with one pathological high-inefficiency bin inflating the stddev, add
`--stddev-exclude-top 1` (excludes only that bin from the stddev calculation -- it is
still tested and can still be reported as a hot spot).

Pveto jobs resolve maps automatically from the group's shared EOS space
(`root://cmseos.fnal.gov//store/group/lpcdisapptrks/fiducialmaps`), based on the
dataset's own year/era (`self._year`/`self._era` -> `_fiducial_map_era` in
`pocket_coffea/workflow.py`, e.g. `2022_postEE` -> `2022EFG`) -- no local path needs to
be hand-configured for the common case. Only set an explicit override to point at a
specific local file instead, e.g. while testing an unreleased map:

```bash
DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON=/path/to/electron_fiducial_map.json
DISAPPTRKS_MUON_FIDUCIAL_MAP_JSON=/path/to/muon_fiducial_map.json
```

or a directory containing exactly `electron_fiducial_map.json` and
`muon_fiducial_map.json`:

```bash
DISAPPTRKS_FIDUCIAL_MAP_DIR=/path/to/fiducial_maps
```

Any explicit override always takes precedence over the automatic EOS resolution.

Leg-specific tau jobs only need the active leg's map (`tau_ele_*` -> electron map,
`tau_mu_*` -> muon map) -- each flavor resolves independently, so this still holds with
automatic resolution. Fake-track jobs are not leg-specific and need both, since legacy
fake-track selections inherited both `cutTrkFiducialElectron` and `cutTrkFiducialMuon`
from `isoTrkCuts`.

For production validation:

```bash
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1
```

This fails the job if a map (automatically or explicitly resolved) cannot be loaded or
contains no hot spots, rather than silently proceeding with zero hot spots.

## Lepton background formula

```text
N_lepton = N_ctrl * Pveto * Poffline * Pmiss / epsilon_trig^lepton
```

- `N_ctrl`: control yield category, e.g. `electron_background_control_NLayers4`.
- `Pveto`: lepton veto (non-reconstruction) probability from tag-probe pair counts.
- `Poffline`: ratio of offline-MET-passing control events to control events.
- `Pmiss`: ratio of MET-trigger-passing control events to offline-MET-passing control
  events (the MET-trigger turn-on).
- `epsilon_trig^lepton`: separate trigger-efficiency divisor reproducing the legacy
  `calculateTriggerEfficiencyFile()` path, from the Pveto output's
  `n<Prefix>TriggerEff...` counters (OS-minus-SS, same formula as `Pveto`). Distinct
  from `Pmiss`. Layer-specific for `NLayers4`/`NLayers5`/`NLayers6plus`; `combinedBins`
  uses the unsuffixed counters.

Category naming: `<mode>_background_control_{layer}`,
`<mode>_background_offline_{layer}`, `<mode>_background_trigger_{layer}`, where
`<mode>` is `muon`, `electron`, `tau_mu`, or `tau_ele`, and `{layer}` is
`NLayers4`/`NLayers5`/`NLayers6plus`/`combinedBins`.

`N_ctrl` can be scaled with `--control-prescale` (default `1.0`) for the legacy
MET/lepton-dataset luminosity or prescale correction.

### Low-statistics layer bins

`estimate-lepton-background`'s `--low-stat-layers` draws `Poffline`/`Pmiss`/
`epsilon_trig` for those layers from `--low-stat-combined-layer` (default
`combinedBins`) instead of their own per-layer control categories -- those control
samples are too small at NLayers4/NLayers5 for a meaningful per-layer ratio.
`N_ctrl` and `Pveto` still use each layer's own categories; only the Poffline/Pmiss/
trigger-efficiency *ratios* borrow combinedBins'.

Defaults to `NLayers4 NLayers5` for `--mode muon`/`tau_mu`/`tau_ele`, and to
nothing (every layer uses its own categories) for `--mode electron` -- electron's
own per-layer control samples are large enough not to need it; muon and tau are
not. Pass `--low-stat-layers` explicitly (with no values to force-disable) to
override the default for any mode. Implemented in `estimate_lepton_background`'s
`low_stat_layers`/`combined_layer` parameters (`lepton_backgrounds.py`); the
mode-dependent default itself lives in `_estimate_lepton_background_command`
(`cli.py`), not in `estimate_lepton_background` (whose own default is `()`, i.e.
no substitution, so a caller that doesn't ask for this explicitly is unaffected).

`estimate-tau-background`'s own, separate call to `estimate_lepton_background` does
not use these parameters and needs no change here -- it already applies the
equivalent substitution for its tau MET probabilities unconditionally, via
`_apply_sparse_tau_met_probability_fallback` (hardcoded `NLayers4`/`NLayers5` ->
`combinedBins`, reproducing dissertation Table 7.25); its trigger efficiency is
already a single cross-trigger-derived value shared by every layer, so there is no
per-layer trigger-efficiency discrepancy to fall back from there.

### Tau combination

Four jobs feed the tau estimate (not two, unlike electron/muon):

| Mode | Dataset | Supplies |
| --- | --- | --- |
| `tau_mu_pveto` | `DATA_Muon` | `Pveto` OS/SS pairs, muon leg |
| `tau_ele_pveto` | `DATA_EGamma` | `Pveto` OS/SS pairs, electron leg |
| `tau_pmiss_poffline` | `DATA_Muon` | `N_ctrl`, `Poffline`, `Pmiss` from the muon+tau cross-trigger control |
| `tau_trigger_probability` | `DATA_Muon` | `P(tau) = N_cross / N_muon` (dissertation eq. 7.7-7.8), consumed via `--tau-probability-files` |

`tau_mu_pmiss_poffline` and `tau_ele_pmiss_poffline` are legacy-equivalent/
diagnostic only -- excluded from the final combination above.

Combine the `tau_mu` and `tau_ele` legs for `Pveto`, use only the cross-triggered
`tau_pmiss_poffline` control for the normalization and MET probabilities, and
supply `P(tau)` directly from the `tau_trigger_probability` job output:

```bash
disapptrks estimate-tau-background \
  --run-period 2022CD \
  --output-json tables/tau_background_2022CD.json \
  --output-tex tables/tau_background_2022CD.tex \
  --trigger-efficiency 0.90 \
  --trigger-efficiency-error 0.006 \
  --tau-probability-files analysis_output/2022CD_tau_trigger_probability/output_*.coffea \
  --tau-control-files analysis_output/2022CD_tau_pmiss_poffline/output_*.coffea \
  --tau-mu-files analysis_output/2022CD_tau_mu_pveto/output_*.coffea \
  --tau-ele-files analysis_output/2022CD_tau_ele_pveto/output_*.coffea
```

Defaults: `--tau-mu-sample DATA_Muon`, `--tau-ele-sample DATA_EGamma`.

`--trigger-efficiency`/`--trigger-efficiency-error` are **required** and have no
automatic derivation for tau (`trigger_efficiency_method=manual-cross-trigger-control`
always, unlike electron/muon's `legacy-tag-probe`). The `0.90 ± 0.006` above is only
the checked-in example value for 2022CD, not a default to reuse -- confirm the
current effective value for the period at hand before running.

## Typical commands

Electron Pveto:

```bash
cd DisappTrks_Nano/pocket_coffea
DISAPPTRKS_CATEGORY_MODE=electron_pveto \
DISAPPTRKS_ENABLE_PVETO_DIAGNOSTICS=0 \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
DISAPPTRKS_DATASET_JSON=datasets/eos_2022CD_EGamma.json \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/2022CD_electron_pveto \
  --executor dask@lpc \
  --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 60 \
  --queue workday
```

Electron Poffline/Pmiss uses the same pattern with
`DISAPPTRKS_CATEGORY_MODE=electron_pmiss_poffline`, no fiducial maps, and
`--outputdir analysis_output/2022CD_electron_pmiss_poffline`.

Postprocess:

```bash
cd DisappTrks_Nano
disapptrks estimate-lepton-background \
  --mode electron \
  --run-period 2022CD \
  --output-json tables/electron_background_2022CD.json \
  --output-tex tables/electron_background_2022CD.tex \
  pocket_coffea/analysis_output/2022CD_electron_pveto/output_*.coffea \
  pocket_coffea/analysis_output/2022CD_electron_pmiss_poffline/output_*.coffea
```

(`--mode muon` for muons; see [Tau combination](#tau-combination) above for taus.)

For a smoke test, append to the runner command:

```bash
--limit-files 1 --limit-chunks 1 --scaleout 2 --queue microcentury
```

## Combining multiple periods into one table

Once several periods' JSON outputs exist, don't hand-build a multi-period table --
two CLI commands already do this:

**One flavor, many periods** (`combine-lepton-background-tables`, works for
muon/electron/tau JSON alike -- title/column set is inferred from the JSON's own
`flavor` field):

```bash
disapptrks combine-lepton-background-tables \
  --input 2022CD=tables/muon_background_2022CD_dedx.json \
  --input 2022EFG=tables/muon_background_2022EFG_dedx.json \
  --input 2023C=tables/muon_background_2023C_dedx.json \
  --output-tex tables/muon_background_combined.tex \
  --table-env
```

Repeat `--input RUN_PERIOD=path.json` in the order you want the periods to appear;
each period's rows get their own `\multirow` block, separated by an `\hline` from
the next period's block. `--flavor` filters a JSON down to one exact flavor label
(`'$e$'`, `'$\mu$'`, `'$\tau_h$'`) if a single file ever mixes them -- not needed for
the standard one-flavor-per-file JSONs this workflow produces.

**Leptons + fake tracks -> one Total-background table**
(`combine-total-background-table`, added specifically to reproduce the
dissertation's "Expected Backgrounds: Leptons / Spurious Tracks / Total" summary
table): sums the muon/electron/tau estimates per period/layer bin into "Leptons",
takes the *nominal* fake-track control region's yield (Z->mu mu by default -- Z->ee
is a cross-check only, per the dissertation convention, and is not folded in) as
"Spurious Tracks", and adds the two (in quadrature) for "Total". Statistical
uncertainties only.

```bash
disapptrks combine-total-background-table \
  --muon-input 2022CD=tables/muon_background_2022CD_dedx.json \
  --electron-input 2022CD=tables/electron_background_2022CD_dedx.json \
  --tau-input 2022CD=tables/tau_background_2022CD_dedx.json \
  --fake-input 2022CD=tables/fake_tracks/2022CD_dedx/zmumu.json \
  --muon-input 2022EFG=tables/muon_background_2022EFG_dedx.json \
  --electron-input 2022EFG=tables/electron_background_2022EFG_dedx.json \
  --tau-input 2022EFG=tables/tau_background_2022EFG_dedx.json \
  --fake-input 2022EFG=tables/fake_tracks/2022EFG_dedx/zmumu.json \
  --output-tex tables/total_background_combined.tex \
  --table-env
```

Every period passed via `--muon-input` must also appear in `--electron-input`,
`--tau-input`, and `--fake-input` (a `ValueError` names which input is missing it
otherwise) -- run this only once all four background pieces are done for every
period you want in the table. `--fake-control-region zee` switches which control
feeds "Spurious Tracks" if that's ever wanted instead of the zmumu default.

Both commands live in `write_combined_lepton_background_latex`/
`write_combined_total_background_latex` in `lepton_backgrounds.py`, wired into
`cli.py`'s `_combine_lepton_background_tables_command`/
`_combine_total_background_table_command` -- extend those, not a one-off script, if
another combined-table shape is needed later (e.g. a fake-track-only multi-period
table: `write_combined_fake_track_table34_latex` in `fake_tracks.py` already has the
logic but isn't CLI-wired yet, see `disapptrks-fake-track-background`).

## Legacy Pveto convention

The 2022/2023 legacy scripts use the histogram branch in
`LeptonBkgdEstimate.printPpassVetoTagProbe()`
(`DisappTrks/BackgroundEstimation/python/bkgdEstimate.py`), active by default
(`_useHistogramsForPpassVeto=True`):

```text
Pveto = (N_pass_OS - N_pass_SS) / (N_total_OS - N_total_SS)
```

The two-lepton denominator, `N_pass / (2*N_total - N_pass)`, is only the older
non-histogram fallback branch:

```python
if (self._flavor == "electron" or self._flavor == "muon") and not self._useHistogramsForPpassVeto:
    eff = scaledPasses / (2.0 * total - scaledPasses)
else:
    eff = scaledPasses / total
```

Nano implements the histogram-branch formula in
`src/disapptrks/lepton_backgrounds.py::pveto_count_from_pair_counts(...)`.

## Legacy search patterns

```bash
# electron backgrounds
rg -n "ElectronTagPt55|ZtoEleProbeTrk|printPpassVetoTagProbe|printPpassMetCut|printPpassMetTriggers" ref/DisappTrks/BackgroundEstimation ref/DisappTrks/StandardAnalysis

# muon backgrounds
rg -n "MuonTagPt55|ZtoMuProbeTrk|printPpassVetoTagProbe|printPpassMetCut|printPpassMetTriggers" ref/DisappTrks/BackgroundEstimation ref/DisappTrks/StandardAnalysis

# tau backgrounds
rg -n "ZtoTau|TauTag|tau.*pveto|TauTagProbeSelections" ref/DisappTrks/BackgroundEstimation ref/DisappTrks/StandardAnalysis

# common track selections
rg -n "isoTrkCuts|candTrkCuts|disTrkCuts|cutTrkPt55|cutTrkJetDeltaPhi|cutTrkNMissOut" ref/DisappTrks/StandardAnalysis/python
```

## Poffline/Pmiss control selection

Built in `pocket_coffea/workflow.py::_lepton_background_track_mask` /
`_store_lepton_background_controls`. Current control-track requirements:

- track `pt > 55 GeV`; requested layer bin; standard isolated-track quality;
  high-purity and dE/dx max-over-median (per `probe_track_dedx_mask`, since
  this is looped over one explicit layer bin at a time here -- unlike the
  Pveto probe tracks, this could equally use the single-layer
  `dedx_max_over_median_mask`, but uses the shared per-track helper for
  consistency), gated by `DISAPPTRKS_LEPTON_BACKGROUND_REQUIRE_DEDX_CUT`
  (default on) -- this control track selects the same kind of track the
  signal selection targets, so it carries the same requirement as the Pveto
  probe tracks
- `dR(track, jet) > 0.5` (matches legacy `ElectronTagPt55`/`MuonTagPt55`'s `isoTrkCuts`)
- no missing-outer-hit requirement
- muon control: `caloEnergy < 10 GeV`; electron control: no calorimeter-energy cut
- electron match: `0 <= dRMinElectron < 0.1`; muon match: `0 <= dRMinMuon < 0.1`;
  tau match: `0 <= dRMinTauHad < 0.1`

Control-event baseline (mirrors legacy `ElectronTagPt55`/`MuonTagPt55`/`TauTagPt55`):
golden JSON, MET filters, jet-veto map; at least one tag; at least one jet with
`pt > 110 GeV`, `|eta| < 2.4`, tight-lepton-veto ID; max dijet delta-phi `< 2.5`. It
intentionally omits ordinary `MetNoMu > 120` / `deltaPhi(MetNoMu, leading jet) > 0.5` --
legacy applies those through the Poffline/Pmiss histogram integrals instead.

Offline numerator adds: MET-no-mu-minus-selected-lepton `pt >= 120 GeV`; leading-jet
delta-phi to that MET direction `>= 0.5`. Trigger event = offline event AND
`_met_trigger_mask(events)`.

`*_pmiss_poffline` outputs also store MET-shape histograms
(`n<Prefix>BackgroundMetNoMuPt_{layer}`, `..MetNoMuPtTrig_{layer}`,
`..MetMinusOnePt_{layer}`, `..MetMinusOnePtTrig_{layer}`,
`..DeltaPhiMetJetLeadingVsMetMinusOnePt_{layer}`, `<Prefix>` = `Muon`/`Electron`/
`TauMu`/`TauEle`) that the postprocessor uses automatically for the legacy-style
MET-trigger-turn-on integration, printing `met_method=hist-integrated`. If missing, it
falls back to scalar cutflow ratios and prints `met_method=cutflow-ratio` -- rerun the
`*_pmiss_poffline` job with current code if you see that.

Older Pveto outputs can carry duplicate `n<Prefix>Background...` histograms; the
postprocessor prefers a dedicated `*_pmiss_poffline` output's histograms over a Pveto
output's when both are passed.
