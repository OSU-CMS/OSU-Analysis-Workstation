---
name: disapptrks-signal-acceptance
description: Measure the DisappTrks Nano/PocketCoffea signal acceptance/efficiency of the highPurity track-ID requirement -- the paired before/after cumulative cutflow across NLayers4/5/6plus/combinedBins bins, via the signal_acceptance PocketCoffea category mode and the summarize-signal-high-purity CLI command. Use for signal cutflow comparisons, CartesianSelection-based category debugging in this mode, or quantifying how much signal the highPurity requirement costs. Do not use for the compact per-track signal dE/dx summaries from this same mode (see disapptrks-track-diagnostics), the fake-track sideband dE/dx study, or either background estimate (see disapptrks-lepton-backgrounds, disapptrks-fake-track-background).
---

# DisappTrks Signal Acceptance of the `highPurity` Requirement

Work from the `DisappTrks_Nano` checkout (`ref/DisappTrks_Nano`). This skill covers the
`signal_acceptance` PocketCoffea category mode's primary purpose: quantifying signal
efficiency lost to the `highPurity` track-ID requirement, via a paired before/after
cumulative cutflow. The same category mode can *also* produce compact per-track signal
dE/dx summaries (`DISAPPTRKS_ENABLE_SIGNAL_DEDX_HISTOGRAMS=1`) -- that is a separate
product covered by the `disapptrks-track-diagnostics` skill's "Signal" workflow, not
this one.

If asked to actually run a job or produce the summary (not just say what
command would do it), this skill supplies the command but not how to execute
it on the LPC -- use `disapptrks-lpc-execution` for the SSH/proxy/tmux/
container mechanics.

If asked to add a new cumulative stage or axis to this mode's `CartesianSelection`
(not just run it), use `pocketcoffea-conventions` -- this mode is a good example of
`CartesianSelection`/`MultiCut` used exactly as the framework intends (three
independent axes combined to work around `PackedSelection`'s 64-mask limit).

## Establish the current interface

Category and stage names below are illustrative; this code evolves. Before proposing a
command:

1. Check `disapptrks summarize-signal-high-purity --help`.
2. Search `pocket_coffea/config.py` for `category_mode == "signal_acceptance"` to see
   the current `CartesianSelection` axes (`high_purity_variant`, `layer_bin`,
   `cutflow_stage`) and where their cut lists come from in `pocket_coffea/cuts.py`
   (`signal_acceptance_variant_axis_cuts`, `signal_acceptance_layer_axis_cuts`,
   `signal_acceptance_stage_cuts`, `SIGNAL_ACCEPTANCE_CARTESIAN_FIELDS`).
3. Search `pocket_coffea/workflow.py` for `_store_signal_acceptance_cutflows` for how
   the paired track-level masks are actually built.
4. Search `pocket_coffea/workflow.py` for `_fiducial_map_era`/`_eos_fiducial_hot_spots`
   for how the electron/muon fiducial maps applied at `track_fiducialECAL` are resolved
   (automatically, by era, from the shared EOS space, unless an explicit
   `DISAPPTRKS_*_FIDUCIAL_MAP_JSON`/`_DIR` override is set).

## What this mode measures

`signal_acceptance` applies the MET trigger, data-quality machinery (golden JSON
skipped for MC), the full basic event selection, and the full disappearing-track
selection, then creates categories that are identical *except* whether the nominal
`isHighPurityTrack` bit is required -- once per layer bin (`NLayers4`, `NLayers5`,
`NLayers6plus`, `combinedBins`). The difference between the paired categories is the
signal efficiency cost of requiring `highPurity`.

Both electron and muon fiducial maps must be in effect, so the tested selection
matches the production search selection. Since the `MattDev` fiducial-map-auto-resolve
change, this happens automatically by era -- no local path needs to be set for the
common case; see [references/workflow.md](references/workflow.md) for the run command
and the `summarize-signal-high-purity` output.

## Preserve these invariants

- The "without high purity" and "with high purity" categories must otherwise be
  *identical* -- same event selection, same layer bin, same fiducial maps applied at
  the same point in the cumulative sequence. If a change to one side isn't mirrored on
  the other, the comparison is meaningless.
- The fiducial-hot-spot mask is applied starting only from the `track_fiducialECAL`
  stage onward (see `apply_fiducial_mask` in `_store_signal_acceptance_cutflows`) --
  don't apply it to earlier cumulative stages when adding a new one.
- Cumulative masks must stay jagged per-track through the whole stage sequence (not
  reduced to an event-level boolean early) so that every requirement is evaluated
  against the *same* candidate track, consistent with this analysis's general
  candidate-selection invariant (see `disapptrks-track-diagnostics`'s equivalent rule).
- This mode uses PocketCoffea's `CartesianSelection` (three independent `MultiCut`
  axes combined), not `StandardSelection`/`PackedSelection`, specifically because the
  full stage list plus the high-purity/layer axes exceeds `PackedSelection`'s 64-mask
  limit. A new stage should extend `SIGNAL_ACCEPTANCE_CARTESIAN_FIELDS` and the
  corresponding cut dict together, not be bolted on as an ad hoc separate category.
- `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1` -- maps now resolve automatically by era from
  the shared EOS space, but without this flag a resolution failure for either flavor
  silently falls back to zero hot spots instead of erroring, and the comparison then
  doesn't match the production search selection without any indication that it doesn't.

## Why this mode exists right now

`highPurity` is **not** currently part of the disappearing-track selection. The group
is actively deciding whether to add it, as a tradeoff: does it reduce the fake-track
background (see `disapptrks-fake-track-background`, and the sideband study in
`disapptrks-track-diagnostics`) enough to be worth whatever signal efficiency it costs?
This mode's output is the signal-acceptance-cost side of that tradeoff, not an isolated
efficiency measurement -- when reporting a retained/lost fraction, frame it against
that decision (e.g. "costs X% signal efficiency in the n_layers=4 bin; compare against
the fake-track yield reduction from the same cut") rather than as a number in isolation.

Note this is **not** a named systematic in the dissertation (M. Carrigan, OSU 2025):
Chapter 7.5.4 "Signal Selection Systematics" lists pileup, missing hits, ISR, JES/JER,
MET, calorimeter energy, lepton-veto scale factor, trigger efficiency, and track
reconstruction efficiency, but no `highPurity`-requirement entry -- because the
selection doesn't include it yet. Don't present this mode's output as reproducing or
feeding a published number; it's live investigation, not established analysis content.

## Completion checks

- Report the retained/lost percentage per layer bin from `summarize-signal-high-purity`
  (not just the combined bin) -- the reduction is not required to be uniform in
  `n_layers`, and dissertation-adjacent uncertainties (missing hits, trigger
  efficiency) show it usually isn't.
- If using `--full-cutflow`, state which cumulative stage the retained fraction starts
  meaningfully diverging at, not just the final ratio.
- Confirm both fiducial maps were actually loaded (nonzero
  `nElectronFiducialHotSpotsLoaded`/`nMuonFiducialHotSpotsLoaded`, same check as the
  other DisappTrks skills) before trusting a production-representative number.
- State whether verification was CLI/configuration-only or an end-to-end PocketCoffea
  run.
