---
name: disapptrks-datacards-limits
description: Build DisappTrks_Nano/PocketCoffea datacards and produce the wino/higgsino chargino exclusion (limit vs. mass/lifetime) plot for the disappearing-track search. Use for the analysis's own signal grid (chargino mass/lifetime points), the AMSB wino/higgsino signal cross-section tables and how to patch them into a dataset JSON's xsec metadata, process/systematic declarations against the search_region PocketCoffea mode's staged counting-experiment categories, and the legacy AMSB wino/higgsino plot conventions in ref/DisappTrks/LimitSetting. Do not use this for the generic pocket_coffea.utils.stat Datacard API or generic Combine/exclusion-plot mechanics -- see pocketcoffea-datacards-limits, which this skill builds on.
---

# DisappTrks Datacards and Exclusion Plots

This is the analysis-specific layer on top of the generic `pocketcoffea-datacards-limits`
skill: the DisappTrks signal models, the legacy plot/grid conventions, and what's
actually available to build on today. Read `pocketcoffea-datacards-limits` first for
the `Datacard`/`MCProcess`/`SystematicUncertainty` API and the Combine/plotting
mechanics -- this skill does not repeat that content.

## The `search_region` PocketCoffea mode (added 2026-09-17, restaged 2026-09-18)

`pocket_coffea/config.py` in `DisappTrks_Nano` (`MattDev` branch) now has
`DISAPPTRKS_CATEGORY_MODE=search_region`: a plain `StandardSelection` (no
`CartesianSelection` needed) producing 14 categories -- `inclusive`, `basic_selection`,
and one `isolated_track_<layer>`/`candidate_track_<layer>`/`disappearing_track_<layer>`
triple per layer bin (`NLayers4`/`NLayers5`/`NLayers6plus`/`combinedBins`) -- an
explicit, dissertation-matching (Ch. 7.3.3) cumulative chain, not the single flat
`signal_selection_with_high_purity_<layer>` category this mode originally shipped
with. `disappearing_track_<layer>` (the final stage) reuses that same underlying Cut
(`nIsoTrackSearch_<layer> >= 1`) rather than duplicating it. Confirm the current shape
before relying on details here (`grep -n "category_mode ==" pocket_coffea/config.py`
in the real checkout, not just `ref/DisappTrks_Nano` which may lag).

The selection is the full disappearing-track selection with `isHighPurityTrack`
required and, for `NLayers4`/`NLayers5` only, a max/median dE/dx cut -- see
`disapptrks-signal-acceptance`'s "historical context" section for why both are now
required rather than an open question. The electron/muon fiducial hot-spot veto is
applied consistently across all three stages (`isolated_track`/`candidate_track`/
`disappearing_track`) as of 2026-09-18 -- it was previously applied only to the final
stage, a real bug (not just a display gap) caught by building a per-individual-cut
cutflow table and finding the staged counts weren't monotonic.

Each layer bin gets one 1-bin `searchRegionYield_<layer>` `HistConf` (binned on
`AnalysisEvent.METNoMu_pt`, `only_categories=[f"disappearing_track_{layer}"]`, range
wide enough that every passing event falls in the one bin). **This is a deliberate
counting-experiment design, not a shape variable** -- the histogram's single-bin
integral *is* the category's yield, and `Datacard.rate()` reads it directly. This
matches the legacy `bkgdConfig_*.py` per-era/per-layer-bin structure (see below), not
a shape fit. (A prior version of this `HistConf` pointed `only_categories` at a stale
category name from before the highPurity switch, silently producing empty
histograms -- fixed 2026-09-18, alongside the fiducial fix above, in the same
verification pass.) If a shape discriminant is wanted later, reuse `signal_acceptance`'s
per-track dE/dx summary machinery (`SignalDeDxTrack_<layer>`), built per `search_region`
category instead of gated to `inclusive`.

Verified end-to-end (2026-09-18) against real signal MC that actually carries the
`IsoTrackDeDxHit` branch (`datasets/eos_signal_2022_postEE_OSUv2.json`, AMSB wino
M700GeV, four lifetimes) and real 2025 muon data: the staged per-layer counts are
monotonically decreasing (isolated ≥ candidate ≥ disappearing) and cross-check exactly
against `signal_acceptance`'s independent cutflow on the same files. `muon_pveto`/
`fake_tracks` full cutflows stayed byte-identical across every fix made along the way
(the fiducial fix and the event-weighting fix below are both gated to
`signal_acceptance`/`search_region`, or -- for weighting -- verified not to change any
raw event count anywhere, only weighted yields).

### Event weighting (fixed 2026-09-18)

The `Configurator` previously had `weights={"common": {"inclusive": []}}` and
`weights_classes=[]` -- **no weight classes registered at all**, for any category
mode. Every yield reported before this fix was a raw, unweighted event count. Fixed to:

```python
from pocket_coffea.lib.weights.common import common_weights
...
weights={"common": {"inclusive": ["genWeight", "lumi", "XS"]}, "bysample": {}},
weights_classes=common_weights,
```

- `genWeight`/`lumi`/`XS` are PocketCoffea built-ins (`pocket_coffea.lib.weights.common`)
  -- no custom `WeightWrapper` needed. `lumi` reads `params.lumi.picobarns[year]["tot"]`
  (confirmed `"2022_postEE"` already resolves via PocketCoffea's own default
  `lumi.yaml`, no DisappTrks-specific lumi config needed for that year); `XS` reads
  `float(metadata["xsec"])` straight from the dataset JSON.
- Both default `isMC_only=True`, so `WeightsManager` skips them for data automatically
  -- no `bysample` exclusion needed, and this was verified (`DATA_Muon` job ran clean).
- `sum_genweights` rescaling happens automatically in the base processor's
  `postprocess()` (already invoked by the standard `pocket_coffea.scripts.runner run`
  CLI every job in this analysis uses) -- **do not hand-roll dividing by it.**
- `weights_classes=common_weights` registers the *whole* bundle (pileup, lepton/jet
  SFs, ...) for future use; only `genWeight`/`lumi`/`XS` are actually activated in
  `weights=`. Turning on more (pileup reweighting matters for a real result) is a
  follow-up, not done yet.
- Verified: `cutflow` (raw counts) stayed byte-identical before/after on both a data
  job and a signal-MC job; `sumw`/histogram integrals changed and matched
  `sum_genweights`-rescaled expectations exactly.

### Signal cross sections (fixed 2026-09-18, only for M700GeV wino so far)

Dataset JSONs ship with a placeholder `"xsec": "1.0"` in `metadata` -- with the `XS`
weight now active, this directly becomes the `Datacard` rate's normalization, so it
must be replaced with the real value before any yield means anything.

**Source**: `ref/DisappTrks/SignalMC/python/signalCrossSecs13p6TeV.py` (Resummino
aNNLO+NNLL, matches the `13p6TeV` sample naming; cited from the
[LHCPhysics SUSY cross-sections twiki](https://twiki.cern.ch/twiki/bin/view/LHCPhysics/SUSYCrossSections13x6TeVn2x1wino)).
Two separate tables, keyed by mass in GeV as a string:

- `signal_cross_sections` -- **wino** grid (`AMSB_Wino_...` sample names). Value per
  mass = `chargino_neutralino_cross_sections[mass] + chargino_chargino_cross_sections[mass]`
  (both production modes summed; the legacy file does this itself via its `Measurement`
  class -- read the two dicts directly and sum by hand if reusing just the numbers).
- `signal_cross_sections_higgsino` -- **higgsino** grid, same structure
  (`higgsino_n2c1 + higgsino_c1c1`; note `higgsino_n2c1`'s table already has the "×2
  for degenerate N1/N2" factor baked into its `value` field -- don't apply it twice).
- Both tables store values in **picobarns** (the raw table entries are in fb, converted
  by `* 1.0e-3` in the source file) -- matches the units `XS`/`lumi` expect.
- **Cross section does not depend on lifetime.** One value per mass applies to every
  `ctau` sample at that mass -- confirmed by patching all four lifetime entries in
  `eos_signal_2022_postEE_OSUv2.json`'s M700GeV samples to the same value.

**Worked example (verified end-to-end)**: M700GeV wino =
`11.1063e-3 + 5.18784e-3 = 0.01629414` pb. Patched into all four `AMSB_Wino_M700GeV_*`
entries' `metadata.xsec` in `eos_signal_2022_postEE_OSUv2.json` (JSON-diffed against
the original first, to confirm only `xsec` changed, nothing else in `files`/other
metadata). Re-running `search_region` confirmed the weighted yield scaled exactly
linearly with the new value (`505.53 -> 8.237`, ratio `0.01629414` as expected).

**Still needed to extend beyond this one mass point**: the same two tables cover
masses 100-1200 GeV; each additional mass's dataset JSON entries need the same patch
using that mass's value. This is a small, fixed lookup -- worth scripting (read the
dataset JSON, look up cross-section table by sample-name pattern and mass, write back)
once the full signal grid's dataset JSON exists, rather than patching by hand per mass
point as done here for the one verified case.

**No `Datacard` has actually been built from this mode's output yet** -- only the
category/histogram/weighting mechanics have been run and verified, now with real
signal normalization for one mass point. Before proposing one, confirm the actual
process/systematic list for this analysis (samples, years, layer-bin scope, which
backgrounds are already routed through `search_region` -- as of this writing, none
are: fake-track/lepton backgrounds are data-driven estimates from separate category
modes, not naturally a `search_region`-shaped histogram) rather than assuming the
generic PocketCoffea example in the parent skill's `datacard-api.md` applies
unchanged.

## The legacy analysis this migrates

`ref/DisappTrks/LimitSetting` (legacy CMSSW, ROOT/`TChain`-based, not PocketCoffea) is
the physics reference for what the datacard and exclusion plot need to reproduce:

- **Two signal grids**, selected by `-l wino`/`-l higgsino`
  (`validLimitTypes` in `python/limitOptions.py`): AMSB chargino direct production,
  parameterized by mass (`masses`, GeV) and proper lifetime (`lifetimes`, cm) --
  see `python/winoElectroweakLimits.py`/`higgsinoElectroweakLimits.py` for the actual
  per-era grid points (they differ: e.g. wino's Run 3 grid extends to 1200 GeV and down
  to 0.2 cm, higgsino's tops out at 1000 GeV). One datacard is produced per
  `(mass, lifetime)` grid point, named `datacard_AMSB_mGravMASS_TAUns.txt` (`scripts/
  makeDatacards.py`).
- **Per-era, per-layer-bin background configs**
  (`python/bkgdConfig_<era>[_NLayers<n>].py`) -- the legacy equivalent of this
  repo's `signal_acceptance`/fake-track/lepton-background layer-bin split
  (`NLayers4`/`NLayers5`/`NLayers6plus`), listed in `validEras` in `limitOptions.py`.
  `search_region` (above) uses this same layer-bin structure, since it mirrors the
  disappearing-track selection's own binning used throughout this analysis (see
  `disapptrks-signal-acceptance`).
- **Combine method**: `AsymptoticLimits` by default (`scripts/runLimits.py`), with
  `--cminDefaultMinimizerStrategy 1 --picky --minosAlgo stepping` and per-limit-type
  `--rMin`/`--rMax` bounds (tighter for `higgsino`: `[1e-8, 0.1]` vs. wino's
  `[1e-8, 2]`) -- a useful starting point if a new fit needs bounds, though the actual
  values should be re-derived for the Nano-tier cross sections/yields rather than
  copied blindly.
- **Plot scripts**: `scripts/makeLimitPlots.py`/`makeLimitPlotsWithCMSLumi.py` (2D
  mass-vs-lifetime exclusion contour, CMS-style luminosity/energy labels via
  `python/CMS_lumi.py`) and `test/amsbLimitPlotConfigPaper.py` for the published-paper
  plot configuration. These are ROOT-based and ~1600 lines each -- read the specific
  plotting function needed rather than the whole file, and treat them as a style/
  convention reference (label placement, contour styling, per-era combinations) rather
  than code to port line-by-line into the PocketCoffea-based pipeline.

## Route by task

- Generic `Datacard`/`MCProcess`/`SystematicUncertainty` construction, running
  `combineCards.py`/`text2workspace.py`/`combine`, and reading a `limit` TTree: see
  `pocketcoffea-datacards-limits`.
- Actually executing anything on the LPC (SSH, grid proxy, tmux, entering `./shell` for
  the PocketCoffea side and a separate CMSSW+Combine environment for the Combine side):
  see `disapptrks-lpc-execution` and `lpc-remote-session`. Note the two environments
  are genuinely separate (see `pocketcoffea-datacards-limits`'s combine-execution
  reference) -- don't expect `combine` to be available inside `./shell`.
- What category-mode/env-var shape a new search-region PocketCoffea job should follow:
  cross-check with `disapptrks-job-submission`'s existing mode table for this
  analysis's conventions (dataset JSON naming, `DISAPPTRKS_DATASET_SAMPLE`/`_YEAR`,
  layer-bin handling) before inventing a new one from scratch.

## Completion checks

- Confirm `search_region` still builds against the current checkout (category names,
  histogram names) before proposing a `Datacard` from it -- don't assume this skill's
  description of it hasn't drifted.
- State whether any datacard/limit content proposed is backed by an actual `Datacard`
  built from real `search_region` output, or is illustrative/design-stage -- as of this
  writing, only the category/histogram/weighting mechanics have been verified
  end-to-end, not an actual datacard.
- If reporting a yield, confirm `genWeight`/`lumi`/`XS` are actually active in the
  `Configurator` used (don't assume -- this was silently `[]` for a long time) and
  state which dataset JSON's `xsec` metadata was used and whether it's a real
  cross-section value or the `"1.0"` placeholder. A yield built from the placeholder
  is not a physical number and shouldn't be reported as one.
- If patching `xsec` into a dataset JSON, cite which table (`signal_cross_sections`
  wino vs. `signal_cross_sections_higgsino`) and mass point, and confirm by diffing
  the JSON before/after that only `xsec` fields changed.
- If proposing a signal grid, state which limit type (wino/higgsino) and era it's based
  on, and confirm the mass/lifetime points against the *current*
  `winoElectroweakLimits.py`/`higgsinoElectroweakLimits.py` rather than the excerpt
  above, which may go stale.
- Confirm which layer bins (`NLayers4`/`5`/`6plus`, or a combined bin) the datacard
  covers, consistent with how the rest of this analysis's background estimates and
  signal-acceptance study are split.
- State whether a reported limit/exclusion came from an actual `combine` run, and
  against what datacard/workspace -- never present a placeholder or by-hand-estimated
  number as an actual Combine result.
