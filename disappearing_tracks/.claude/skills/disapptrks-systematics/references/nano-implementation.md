# Implementing the systematics in DisappTrks_Nano / PocketCoffea

Generic PocketCoffea patterns (WeightWrapper, variations, calibrators, ColOut) are in the root
`pocketcoffea-conventions` skill -- read it alongside this file. This file covers how they map onto
this analysis. Check every class/field name against the live checkout and `ref/PocketCoffea`;
both move.

## Starting point (verify, it may have changed)

`pocket_coffea/config.py` (MattDev):
```python
weights={"common": {"inclusive": ["genWeight", "lumi", "XS"]}, "bysample": {}},
weights_classes=common_weights,
variations={"weights": {"common": {"inclusive": []}}},
calibrators=[],
```
Opt-in lifetime columns for `search_region`: `DISAPPTRKS_SEARCH_LIFETIME_COLUMNS=1` adds
`ColOut("GenChargino", ["ctau", "isDecayed", "Lxy"])` per `disappearing_track_<layer>` category
for `SIGNAL_Chargino` (block near the `sideband_event_columns` definition; not committed at the time
of writing). Yields per lifetime: `limits/lifetime_reweighted_run3/scripts/make_reweighted_yields.py`.

## Kind A -- weight variations

1. Add the weight to `weights` -- scoped to the signal sample (`bysample: {"SIGNAL_Chargino": ...}`)
   unless it is meaningful for every MC sample -- and list it in `variations["weights"]` for the
   same scope. Gate both behind an env var so other modes are untouched.
2. **Pileup**: PocketCoffea's built-in `pileup` weight (`pocket_coffea/lib/weights/common/common.py`,
   `sf_pileup_reweight` in `lib/scale_factors.py`) returns nominal/up/down from the LUM correctionlib
   files; `parameters/pileup.yaml` already has `2022_preEE`, `2022_postEE`, `2023_preBPix`,
   `2023_postBPix` (Sep23 NanoAODv12 files). Points to settle first:
   - **The nominal signal currently has no pileup weight at all**, so adding it changes every
     nominal signal yield (SIG-01), not just the uncertainty (SYST-03). Do the two together and
     rebuild all cards, or explicitly document an interim "uncertainty only" choice.
   - Confirm `Pileup_nTrueInt` is in the OSUv3 signal files (standard Nano has it; check one file).
   - The correction files live under the cms-griddata CVMFS area; the existing Condor-worker
     workaround in this analysis only covers the jet-veto maps, so a worker without that area will
     fail to find the pileup file. Interactive `./shell` runs are fine where the area is mounted.
   - Check the dataset `year` metadata matches those keys.
3. **ISR**: write a `WeightWrapper` returning nominal/up/down from the Run 3 data/MC recoil
   reweighting once SIG-06 has produced it (Z->mumu, per period). Until then there is no Run 3
   ISR weight to vary -- do not substitute PocketCoffea's PSWeight ISR variation without saying so;
   it is a generator-scale variation, a different systematic.
4. **Trigger**: a `WeightWrapper` with the data/MC grand-OR efficiency SF and separate data/MC-stat
   up/down (Run 2 had four fluctuations: Data/MC x Up/Down), from the trigger-efficiency work (TRIG
   tasks).
5. **Reading the variations**: with variations configured, the columns manager writes
   `weight_variation_<weight>Up` / `...Down` next to `weight` for each category (verified in
   `pocket_coffea/lib/columns_manager.py`: `fill_columns_accumulators` and `fill_ak_arrays`). Like
   `weight`, these are **not** rescaled by `sum_genweights` in `postprocess()` -- divide by it, as
   the nominal extraction does. Per target lifetime:
   `yield_var = sum(weight_variation * w_life) / sum_genweights` with the same `w_life` as nominal.
   Extend `make_reweighted_yields.py` with an option to emit these (keep the nominal output
   byte-identical).
6. Histograms: `searchRegionYield_<layer>` gains a `variation` axis entry per weight variation, which
   covers the generated lifetimes directly -- a useful cross-check of the column path (target =
   source must agree exactly, as it does for nominal).

## Kind B -- object calibrations

PocketCoffea `Calibrators` (jet calibration with JES/JER variations, MET propagation) and the
`variations["shape"]` config. Each shape variation reruns selection, histograms and columns
(`output["columns"][sample][dataset][category][<variation>]`). Points to watch for this analysis:
- The basic selection uses MET-no-mu and a leading jet; make sure the varied jets propagate into
  `METNoMu` (custom field) consistently, not only into standard MET.
- Skim looseness: the skim runs before calibration, so it must not cut on the quantities being
  varied tighter than the analysis does (see `pocketcoffea-conventions` invariants).
- Cost: each shape variation multiplies processing time; run on signal only.

## Kind C -- control-region data/MC efficiencies

These need control-region category modes on data **and** matching MC (DY for Z->ll probes), which
the Nano framework does not have for signal-systematic purposes yet:
- **E_calo**: Z->mumu events plus a *fake* track passing the full search selection (highPurity,
  dE/dx, missing outer hits, lepton vetoes, ...) with only the `caloEnergy < 10` requirement removed
  -- the `fake_tracks` machinery (`_z_to_mumu_control_mask`, `fake_track_base_mask`) builds these;
  `fake_track_base_mask` hard-codes the calo cut, so add an opt-in switch defaulting to on. Book the
  variable actually cut on (`caloEnergy`, pileup-subtracted) and the raw EM+HAD sum, plus their
  dependence on nPV / rho / eta, per layer bin. Efficiency of `E_calo < 10 GeV` in data and DY MC,
  with pileup weights on in MC. Prerequisite: DY MC in custom NanoAOD (none exists yet; it also
  unblocks the hits and lepton-veto systematics). Validate by first reproducing the legacy numbers
  (raw variable, old selection: ~3.5% 2022EFG, 20.7% 2023D), then change one ingredient at a time.
  If a large data/MC gap survives, the alternative to Run 2's "gap as uncertainty" is a data/MC
  scale factor on the signal efficiency plus its uncertainty -- a change of central values that the
  analysis lead must decide.
- **Missing inner/middle hits**: a well-measured-track control selection (Run 2: MET data muon
  tracks; `HITS_V2`: Z->ee/tautau probes), 2D (missing middle vs inner) histogram, efficiency of
  0 missing hits in data vs MC. The `IsoTrack_missingInnerHits/MiddleHits` branches exist.
- **Missing outer hits**: control-region rates e(n+) (data, MC) plus, per signal point, the
  true-missing-outer-hits fractions before the cut -- the latter needs a signal category without the
  missing-outer-hits requirement, with a per-event column of the track's missing outer hits so it
  can be reweighted in lifetime.
- **Lepton-veto SF**: tag-and-probe probe tracks near leptons; overlaps the P_veto machinery in
  `disapptrks-lepton-backgrounds`.

## Kind E -- statistics and the reweighting method

- Signal MC statistics: per (era, mass, lifetime, layer) `sqrt(sum w^2)/sum w`, already written
  as `variance` in the yield JSONs. Add a bootstrap (resample events with Poisson(1) weights) or a
  minimum-`neff` rule for the low-statistics bins; `neff` is already stored.
- Reweighting method: from closure tests against generated samples (scripts in
  `limits/lifetime_reweighted_run3/scripts/`: `compare_sources.py`, the 1000->100 cm closure in the
  README), e.g. a per-decade lnN equal to the observed non-closure where it exceeds its statistical
  uncertainty.

## Output format for the cards

Write a new dated JSON next to `dissertation_systematics_by_era.json` (never overwrite it). For
per-era values reuse its schema; for per-point values use
`signal_points[<era>][<mass>][<ctau>][<name>][<layer>] = [down_rel, up_rel]` and extend
`build_combined_cards.py` to prefer it over `signal_percent` when present (asymmetric lnN written
as `1+down/1+up`), and drop the dissertation entry for that name so it isn't counted twice. Keep
nuisance names (`<name>_<era>_<layer>`) unchanged so the correlation model stays the same unless
SYST-14 decides otherwise.

**Projected eras (2024-2026)**: `build_combined_cards.py --extra-eras` rebuilds those eras' signal
from the template era copying only `yield`, `variance` and `raw` per layer bin. Any per-point
systematic stored alongside the yields would be silently dropped there -- extend that copy (or look
the template era's per-point values up by `mc_source`) when adding per-point systematics.

**Per-point values are often MC-statistics dominated.** Decide and document a rule before quoting:
raw per-point; per-point with a fallback (source sample's or mass-averaged value) where
`neff < ~10`; or one value per (era, layer, lifetime) averaged over mass. Attach a statistical error
(bootstrap) to every relative variation so the choice can be justified.
