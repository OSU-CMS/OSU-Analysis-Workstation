Short answer: not automatically — you need to check the output before trusting it, and there's a real chance the run doesn't reflect the production selection.

Here's why. `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1` isn't the switch that turns fiducial masking on — it's a fail-loudly guard. Looking at `_load_fiducial_hot_spots()` in `pocket_coffea/workflow.py` (around line 165), for each flavor (electron/muon) the loader:

1. Uses `DISAPPTRKS_<FLAVOR>_FIDUCIAL_MAP_JSON` (or `DISAPPTRKS_FIDUCIAL_MAP_DIR`) to find a map file, if set.
2. If no path is configured at all, and `REQUIRE_FIDUCIAL_MAPS` is *not* set to a truthy value, it silently returns an empty tuple `()` of hot spots — no error, no warning beyond a `print`. The fiducial-hot-spot veto at the `track_fiducialECAL` cutflow stage then becomes a no-op for that flavor.
3. Same thing if a map file loads but has zero hot spots.
4. `REQUIRE_FIDUCIAL_MAPS=1` just converts both of those silent-empty cases into a hard `FileNotFoundError`/`ValueError` instead of letting the job continue.

So the real question isn't "did I set the REQUIRE flag" — it's "did I also set `DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON` and `DISAPPTRKS_MUON_FIDUCIAL_MAP_JSON`, and did those files actually contain hot spots?" If you did, and they were valid, the run applied the fiducial vetoes exactly as it would have with the REQUIRE flag on — the flag would have been inert (nothing to fail on). If you didn't set those paths, the run went ahead anyway and quietly skipped fiducial masking for whichever flavor(s) were missing.

This matters specifically for your `highPurity` decision because of where `track_fiducialECAL` sits in the cumulative stage sequence: it comes *before* `track_highPurity` (the before/after split point), and the `signal_acceptance` skill's own stated invariant is: "Run with both electron and muon fiducial maps required, so the tested selection matches the production search selection... without it, the comparison doesn't match the production search selection and shouldn't be reported as if it done." If the fiducial vetoes were skipped, the candidate-track population feeding into both the "without HP" and "with HP" categories (and every stage from `track_fiducialECAL` through the end of the cutflow) is drawn from a looser, non-production selection. The retained/lost percentages `summarize-signal-high-purity` prints would still be internally consistent (both sides of the comparison are still identical except for `highPurity`), but they'd describe a different selection than the one you'd actually deploy — so they're not safe to read directly as "this is what adding `highPurity` costs in the real search."

**How to check without rerunning anything:** you don't have to guess — the workflow records exactly this. Load the saved `output_all.coffea` and check whether `nElectronFiducialHotSpotsLoaded` and `nMuonFiducialHotSpotsLoaded` are nonzero (this is the same check the lepton-background skill's troubleshooting doc uses for "fiducial map has no effect"):

```python
from coffea.util import load
out = load("analysis_output/.../signal_acceptance/<variant>/output_all.coffea")
for key in ("nElectronFiducialHotSpotsLoaded", "nMuonFiducialHotSpotsLoaded"):
    h = out["variables"][key]["SIGNAL_Chargino"]["SIGNAL_Chargino"]  # or your sample name
    print(key, h.values())
```

(Exact indexing depends on how the histogram is keyed in your config, but the field names are what to look for.)

- If both come back nonzero, the maps were loaded and applied — the comparison is trustworthy for the `highPurity` decision, and the missing `REQUIRE_FIDUCIAL_MAPS=1` turned out not to matter this time (you just didn't get the safety net if it had gone wrong).
- If either is zero, that flavor's fiducial veto was a no-op for the whole run, the `track_fiducialECAL`-onward stages (including the `track_highPurity` split, and everything after it: pixel/valid hits, missing hits, isolation, dxy/dz, `dR`(track,jet), calo energy, lepton vetoes) don't match the production search selection, and I wouldn't use those retained/lost numbers to decide on adding `highPurity` — rerun with `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1` and both `DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON`/`DISAPPTRKS_MUON_FIDUCIAL_MAP_JSON` pointed at valid maps, so any future mistake fails loudly instead of silently.

Practical suggestion going forward: always pass `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1` alongside the two map-path variables for this mode, per the reference workflow command — that way a missing/empty map turns into an immediate error at job start rather than a silently-non-representative cutflow you only catch by auditing the output afterward.

I haven't run or re-run anything on the LPC to check your specific output file — this is based on reading the `signal_acceptance` skill and the actual `_load_fiducial_hot_spots` logic in `pocket_coffea/workflow.py`. If you point me at your saved `output_all.coffea`, I can help interpret the loaded-hot-spot counts directly.
