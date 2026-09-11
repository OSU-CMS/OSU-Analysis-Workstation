# Troubleshooting

## PackedSelection exhaustion

```text
RuntimeError: Exhausted all slots in PackedSelection
```

The selected category set is too large. Switch to a focused mode (`electron_pveto`,
`electron_pmiss_poffline`, etc.) and disable diagnostics:

```bash
DISAPPTRKS_ENABLE_PVETO_DIAGNOSTICS=0
DISAPPTRKS_ENABLE_SEARCH_DIAGNOSTICS=0
```

Avoid `all`, `muon_backgrounds`, and `egamma_backgrounds` for production.

## Missing histogram key

```text
ValueError: key "nSomeField" does not exist
```

`config.py` selected a histogram variable that `workflow.py` did not create in that
mode. Debug in order:

1. Find the `Cut` in `pocket_coffea/cuts.py`.
2. Identify the event field it reads (usually `nSomething`).
3. Check where that field is created in `pocket_coffea/workflow.py`.
4. Check whether the active `DISAPPTRKS_CATEGORY_MODE` builds that object.
5. Check whether `config.py::_variables_for_mode()` selects histograms whose fields
   exist in that mode.

Fix by either creating `events["nSomeField"]` in that mode, or removing that histogram
from the minimal variable set for the mode.

## Fiducial map has no effect

Maps resolve automatically from the shared EOS space by era, so this is less likely to
be "forgot to set a path" and more likely an EOS/era-mapping problem -- check in order:

- Confirm the job ran with `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1` -- without it, a
  resolution failure for either flavor silently falls back to zero hot spots instead of
  erroring.
- Check `nElectronFiducialHotSpotsLoaded` / `nMuonFiducialHotSpotsLoaded` are nonzero.
- If `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1` and the job still ran (no `FileNotFoundError`),
  an explicit `DISAPPTRKS_*_FIDUCIAL_MAP_JSON`/`_DIR` override is probably set somewhere
  and silently taking precedence over the automatic EOS resolution -- check the job's
  actual environment, not just what this skill or a past conversation assumed.
- Confirm `self._year`/`self._era` for the dataset actually appear in
  `FIDUCIAL_MAP_ERAS` in `pocket_coffea/workflow.py` -- an era outside that mapping (or
  a malformed/legacy `year` string) falls through to `_fiducial_map_era`'s bare-year
  fallback or is passed straight through, which can silently miss on EOS.
- For muon Pveto, compare `nMuonPVetoTagProbePairZWindowPassNoFiducial` against
  `nMuonPVetoTagProbePairZWindowFiducialRejected`.

## Electron 2022CD numbers don't match AN Table 28

Check, in order:

1. The `Pveto` convention -- 2022/2023 should use the direct histogram-branch
   OS-minus-SS ratio (see
   [references/workflow.md](workflow.md#legacy-pveto-convention)).
2. The Poffline/Pmiss control track includes `dR(track, jet) > 0.5`.
3. The legacy prescale/luminosity factor -- legacy 2022 electron estimates use a
   `MET lumi / EGamma lumi` prescale, passed via `--control-prescale`.
4. Whether legacy `Pmiss` used trigger-efficiency files (`useFilesForTriggerEfficiency()`)
   rather than a direct MET-HLT event bit.
5. The exact electron tag definition: Nano uses `Electron.cutBased >= 4`, dxy/dz
   barrel/endcap cuts, `pt > 35`, `|eta| < 2.1`, and the single-electron HLT mask.

Expected nominal postprocessing diagnostics:

```text
trigger_efficiency_method=legacy-tag-probe
met_method=hist-integrated
```

`default` epsilon or `cutflow-ratio` MET means the input files are stale or incomplete
for the nominal estimate -- rerun before tuning physics cuts.

## Quick output sanity check

```bash
python - <<'PY'
from coffea.util import load
out = load("pocket_coffea/analysis_output/2022CD_electron_pmiss_poffline/output_all.coffea")
for key in sorted(str(k) for k in out.get("variables", {}).keys()):
    if "BackgroundMet" in key or "BackgroundDeltaPhi" in key:
        print(key)
PY
```

## Open items to keep in mind

These were under active review as of the last handoff -- confirm current status against
the checkout rather than assuming either is settled:

- The Run-3 electron veto object for fiducial maps: currently `Electron.cutBased >= 1`.
- The Run-3 tau object working point: `hadronic_tau_veto_object_mask` uses DeepTau
  2018v2p5 raw thresholds and `idDecayModeNewDMs`.
- Whether a non-unity `MET lumi / lepton lumi` prescale should be passed via
  `--control-prescale` for each run period and channel.

## Minimum validation before handing off work

```bash
python -m py_compile <changed files>
git -C ref/DisappTrks_Nano diff --check
python -m pytest DisappTrks_Nano/tests/test_lepton_backgrounds.py   # formula changes
python -m pytest DisappTrks_Nano/tests/test_fiducial.py             # fiducial-map changes
```

For PocketCoffea workflow/config changes, run an LPC smoke test:

```bash
--limit-files 1 --limit-chunks 1 --scaleout 2 --queue microcentury
```

Always check the worktree before editing (`git -C ref/DisappTrks_Nano status --short`)
and do not revert unrelated local changes -- the tree may have other in-progress work.
