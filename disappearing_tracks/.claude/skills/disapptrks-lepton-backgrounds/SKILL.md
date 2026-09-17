---
name: disapptrks-lepton-backgrounds
description: Develop, run, debug, and interpret the DisappTrks Nano/PocketCoffea charged-lepton background estimate for the disappearing-track search -- Pveto (lepton non-reconstruction probability), Poffline/Pmiss (offline-MET and MET-trigger-turn-on probabilities), fiducial maps, and the combined tau estimate, for electrons, muons, and taus. Use for DISAPPTRKS_CATEGORY_MODE selection (*_pveto, *_pmiss_poffline, fiducial_maps), fiducial-map production, lepton-background/tau-background CLI commands, or AN-vs-Nano cross-checks against the legacy DisappTrks code. Do not use for the fake-track dE/dx sideband study (see disapptrks-track-diagnostics) or unrelated CMS histogramming.
---

# DisappTrks Lepton Background Estimate

Work from the `DisappTrks_Nano` checkout (`ref/DisappTrks_Nano`). Cross-check physics
definitions against the legacy `DisappTrks` CMSSW code (`ref/DisappTrks`) before
changing Nano behavior -- the Nano implementation is a migration of that code, not a
from-scratch redesign, and it must reproduce the AN's numbers.

If asked to actually run a job (not just say what command would do it), this
skill supplies the command but not how to execute it on the LPC -- use
`disapptrks-lpc-execution` for the SSH/proxy/tmux/container mechanics.

## Establish the current interface

This workflow evolves; treat mode names, environment variables, and file paths below as
illustrative, and confirm against the current checkout before proposing a command:

1. Read `DisappTrks_Nano/docs/pocket_coffea_workflows.md` for the current supported
   workflow.
2. Check `disapptrks --help` and the specific subcommand's `--help`.
3. Search `DisappTrks_Nano/pocket_coffea/config.py` for the active `DISAPPTRKS_*`
   environment variables and `DISAPPTRKS_CATEGORY_MODE` values.
4. Where the actual code in `ref/DisappTrks_Nano` or `ref/DisappTrks` disagrees with
   this skill, trust the code.
5. Fiducial maps resolve automatically by era from the group's shared EOS space
   (`_fiducial_map_era`/`_eos_fiducial_hot_spots` in `pocket_coffea/workflow.py`) unless
   an explicit `DISAPPTRKS_*_FIDUCIAL_MAP_JSON`/`_DIR` override is set -- don't assume a
   local path needs to be hand-configured per era.

## Route by task

- For the mode table, file-role map, fiducial-map production, the lepton-background
  formula, and example commands, read [references/workflow.md](references/workflow.md).
- For `PackedSelection` exhaustion, missing-histogram-key errors, cutflow debugging, or
  an AN-mismatch, read [references/troubleshooting.md](references/troubleshooting.md).
- For the physics definitions of `Pveto`, `Poffline`, `Pmiss`/`Ptrigger`, and the tau
  combination -- including how they map onto the dissertation's Section 7.4.1 notation
  -- read [references/physics-background.md](references/physics-background.md).

## Where to put new code

- New or changed physics mask: `src/disapptrks/selections.py`
- New derived collection, pair collection, or event count: `pocket_coffea/workflow.py`
- New PocketCoffea category: `pocket_coffea/cuts.py` and `pocket_coffea/config.py`
- New histogram variable: `pocket_coffea/config.py`
- New table or estimate formula: `src/disapptrks/tables.py` or
  `src/disapptrks/lepton_backgrounds.py`
- New CLI behavior: `src/disapptrks/cli.py`
- New workflow documentation: update `docs/pocket_coffea_workflows.md` in the checkout

For a new PocketCoffea category, cut, histogram, or weight specifically, use the
`pocketcoffea-conventions` skill to check it follows the framework's own recommended
pattern (`Cut`/`StandardSelection`/`CartesianSelection`, `HistConf`/`Axis`,
`WeightsManager`) rather than a one-off workaround.

## Preserve these analysis invariants

- Keep AN terminology in public names and docs: `Pveto`, `Poffline`, `Pmiss`,
  `basic_selection`, `isolated_track_selection`, `candidate_track_selection`,
  `disappearing_track_selection`.
- For 2022/2023, `Pveto` uses the histogram-branch direct OS-minus-SS ratio,
  `(N_pass_OS - N_pass_SS) / (N_total_OS - N_total_SS)`, not the older two-lepton
  denominator `N_pass / (2*N_total - N_pass)` (that branch is an inactive legacy
  fallback). See `references/workflow.md`'s Legacy Pveto convention section.
- The Poffline/Pmiss control-track mask must include `dR(track, jet) > 0.5`, matching
  the legacy `ElectronTagPt55`/`MuonTagPt55` channels' `isoTrkCuts`. Losing this
  requirement is the most common source of an AN mismatch.
- The muon/electron/tau Pveto probe-track selections (`muon_veto_probe_track_mask`,
  `lepton_veto_probe_track_mask`, `tau_veto_probe_track_mask`, and the AN
  Table-16/22/23 cutflow variants) AND the Poffline/Pmiss control-track selection
  (`_lepton_background_track_mask`) apply the high-purity requirement and the
  `PROBE_TRACK_DEDX_MAX_OVER_MEDIAN` dE/dx cut right after `dz`, gated by
  `DISAPPTRKS_LEPTON_BACKGROUND_REQUIRE_DEDX_CUT` (default on) -- every track these
  modes select is the same kind of track the signal selection targets, so the
  background estimate's track quality should match it. This is opt-in on the shared
  `base_probe_track_mask` helper specifically so it cannot leak into the
  signal-region `search_track_mask` -- do not change that default without
  re-checking every `base_probe_track_mask` caller. `fiducial_map_probe_track_mask`
  is the one deliberate exception (it measures detector hot spots independent of
  track quality, a different physics purpose than "select signal-like tracks") --
  confirm with the user before extending it, rather than assuming either way.
- `MuonVetoProbeTrack`/`ElectronVetoProbeTrack`/`TauVetoProbeTrack` are built as ONE
  mixed-NLayers collection at `layer="combinedBins"` (every production call site
  uses the default), not one collection per layer bin the way the fake-track
  background does. So the dE/dx term there uses `probe_track_dedx_mask`, which
  looks up each track's OWN measured layer count against
  `PROBE_TRACK_DEDX_MAX_OVER_MEDIAN` -- NOT `dedx_max_over_median_mask` (the
  single-layer-bin lookup used by `fake_track_layer_cut`, correct there only
  because the fake-track background already loops per layer bin and passes it an
  already-homogeneous population). Confusing the two silently no-ops the cut for
  every lepton-background probe track, since `PROBE_TRACK_DEDX_MAX_OVER_MEDIAN`
  has no `"combinedBins"` entry. There is currently no plan to add an
  `NLayers6plus`/`combinedBins` working point, so those tracks always pass the
  dE/dx term unconditionally -- only NLayers4/NLayers5 tracks are ever cut,
  wherever they appear within the combinedBins mix.
- Combine the tau estimate from raw `tau_mu`/`tau_ele` ingredients (`Pveto` pair counts,
  `N_ctrl`, `Poffline`/`Pmiss` components, epsilon components) via
  `estimate-tau-background`, then form the ratios. Do not average or sum two separately
  finished per-leg `N_tau` estimates.
- Keep production `DISAPPTRKS_CATEGORY_MODE` values narrow (`*_pveto`,
  `*_pmiss_poffline`, `fiducial_maps`). Reserve `muon_backgrounds`,
  `egamma_backgrounds`, and `all` for debugging -- they combine multiple category
  families (and, for `all`, multiple diagnostic-cutflow families at once) into one
  flat `StandardSelection` and can exhaust Coffea's `PackedSelection` slots.
- Each mode's single active diagnostic-cutflow family (`muon_table16_categories`,
  `electron_pveto_diagnostic_categories`, `tau_pveto_diagnostic_categories`,
  `tau_background_diagnostic_categories`, `fake_z_control_diagnostic_categories`) is
  built as a `CartesianSelection` `MultiCut` axis in `config.py`
  (`active_diagnostic_categories`), not merged flat into the mode's
  `StandardSelection` -- this is the pocketcoffea-conventions "cumulative-stage
  axis" pattern, and gives that family its own `PackedSelection` budget. Keep new
  diagnostic-cutflow families in this same shape (one `Cut` per stage, one
  `MultiCut` per mode) rather than adding them as flat categories; `cuts_names`
  must exactly match the family's existing category-name strings, since
  `cli.py`/`tables.py` reference them literally.
- The tau estimate now always supplies `--tau-probability-files` from a
  `tau_trigger_probability` job (`DATA_Muon`, per dissertation eq. 7.7-7.8) --
  this is the standard production path, not a legacy/AN-only comparison. Pass
  `--tau-probability`/`--tau-probability-json` only when substituting a
  previously-extracted value instead of a fresh job output.
- For electron/muon, do not pass `--trigger-efficiency`/`--trigger-efficiency-error`
  outside an explicit manual-override comparison; production should let the
  extractor read the counters from the `*_pveto` output. **Tau is the exception**:
  `estimate-tau-background`'s `--trigger-efficiency` is a required argument with no
  automatic derivation (`trigger_efficiency_method=manual-cross-trigger-control`
  always) -- confirm the current effective value with the user or the AN/dissertation
  for the run period at hand rather than reusing another period's number by default.
- **Never multiply/divide `Count`s that could be exactly zero using plain
  `Count.__mul__`/`__truediv__`.** Their relative-variance formula
  (`variance = value^2 * sum of relative variances`) is undefined at
  `value == 0`, and `_relative_variance()` guards it to `0.0` there -- so a
  chain like `control * p_veto * poffline * pmiss` silently collapses to
  exactly `0 +/- 0` the moment any one factor's central value is zero, even
  if that factor (e.g. a zero-count `control_raw`, or a zero Pveto
  numerator) has a real, nonzero uncertainty. Use
  `_multiply_counts_at_physical_boundary`/`_divide_counts_at_physical_boundary`
  (`lepton_backgrounds.py`) instead -- mathematically identical to the plain
  `Count` chain away from zero, but propagates absolute derivatives so a
  factor's real uncertainty survives the zero boundary. `estimate_lepton_background`
  uses these for every flavor (not just tau); a zero-count `control_raw` is
  also given the standard zero-count 68% CL Poisson upper limit
  (`POISSON_ZERO_UPPER_68` from `tables.py`) there instead of the default
  `Count(value)`'s `variance = value = 0`. Any *new* multiplicative chain
  built from raw event counts should follow the same pattern rather than
  reusing bare `Count` arithmetic and reintroducing `0 +/- 0` results.

## Documentation discipline

When a selection or formula changes, update `docs/pocket_coffea_workflows.md` in the
checkout and/or this skill's `references/workflow.md`. Don't leave a new mode name,
environment variable, or AN-convention change only in code.

## Completion checks

- State the expected postprocessing diagnostics
  (`trigger_efficiency_method=legacy-tag-probe`, `met_method=hist-integrated`) and
  whether they were actually observed; `default`/`cutflow-ratio` means stale or
  incomplete inputs, not a nominal result.
- For Python-only changes: `python -m py_compile <changed files>` and
  `git -C <checkout> diff --check`.
- For lepton-background formula changes: run
  `python -m pytest DisappTrks_Nano/tests/test_lepton_backgrounds.py`.
- For fiducial-map changes: run `python -m pytest DisappTrks_Nano/tests/test_fiducial.py`.
- For PocketCoffea workflow/config changes, recommend (or run) an LPC smoke test:
  `--limit-files 1 --limit-chunks 1 --scaleout 2 --queue microcentury`.
- Before editing, check `git -C <checkout> status --short` and do not revert unrelated
  local changes -- the tree may have other in-progress work.
- State whether verification was compile/test-only or an end-to-end PocketCoffea run.
