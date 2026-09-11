Short answer: I don't have a number to give you yet — no `signal_acceptance` job has
been run for the 2022EFG chargino samples in this environment, and I'm not going to
invent one. What I can give you is exactly how to get the real numbers, plus a couple
of things I found while checking that will block a clean run right now.

## How you'd actually find this out

This is exactly what the `signal_acceptance` PocketCoffea category mode in
`DisappTrks_Nano` (checked out at `ref/DisappTrks_Nano`, currently on the `MattDev`
branch) is built to measure: it runs the full MET trigger + data-quality + basic event
selection + full disappearing-track selection, then builds paired categories that are
identical except for whether the nominal `isHighPurityTrack` bit is required — once per
layer bin (`NLayers4`, `NLayers5`, `NLayers6plus`, and `combinedBins`). The difference
between each pair is the signal efficiency cost of adding `highPurity`.

1. **Get a 2022EFG chargino dataset JSON.** The only chargino dataset in the checkout
   right now is a single local smoke file at mass 700
   (`pocket_coffea/datasets/local_chargino_700.json`, one file, `2022_postEE`,
   `SIGNAL_Chargino`, 1511 events) — not a real EOS-scale 2022EFG production sample.
   For the real answer you'd build one (or one per mass/lifetime point) from EOS with
   `disapptrks make-dataset-json`, e.g.:

   ```bash
   disapptrks make-dataset-json /store/group/lpcdisapptrks/nano/dev/SignalSim \
     --recursive --group-signal-points \
     --sample SIGNAL_Chargino --year 2022_postEE --era EFG \
     --primary-dataset Signal --is-mc --xsec 1.0 --count-events \
     --event-count-workers 12 --nano-version 12 \
     --xrootd root://cmseosmgm01.fnal.gov:1094 \
     -o pocket_coffea/datasets/eos_signal_2022_postEE.json
   ```

   Run this once per independent mass/lifetime point (the README is explicit about
   that) so each point gets its own acceptance number — don't average across points
   before reporting.

2. **Run the `signal_acceptance` mode**, with both electron and muon fiducial maps
   required so the tested selection matches the production search selection:

   ```bash
   DISAPPTRKS_CATEGORY_MODE=signal_acceptance \
   DISAPPTRKS_OUTPUT_VARIANT=chargino_2022EFG_high_purity \
   DISAPPTRKS_DATASET_JSON=datasets/eos_signal_2022_postEE.json \
   DISAPPTRKS_DATASET_SAMPLE=SIGNAL_Chargino \
   DISAPPTRKS_DATASET_YEAR=2022_postEE \
   DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
   DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON=data/fiducial_maps/electron_fiducial_map_2022EFG.json \
   DISAPPTRKS_MUON_FIDUCIAL_MAP_JSON=data/fiducial_maps/muon_fiducial_map_2022EFG.json \
   python -m pocket_coffea.scripts.runner run \
     --cfg config.py \
     --outputdir analysis_output/2022EFG/signal_acceptance/chargino_high_purity \
     --executor iterative
   ```

   (Swap `--executor iterative` for the Dask/Condor executor for a real-scale sample —
   that's execution mechanics, not something to change about the physics command.)

3. **Summarize the retained/lost efficiency per layer bin:**

   ```bash
   disapptrks summarize-signal-high-purity \
     analysis_output/2022EFG/signal_acceptance/chargino_high_purity/output_all.coffea \
     --sample SIGNAL_Chargino \
     --full-cutflow
   ```

   Without `--full-cutflow` this prints exactly the table you're asking for: one row
   per layer bin (`combined`, `4 layers`, `5 layers`, `>=6 layers`) with the yield
   without/with `highPurity`, the retained fraction, and the fraction lost. Add
   `--full-cutflow` to also see the full cumulative cutflow and confirm where the two
   columns start diverging (they're identical through `track_layers4plus`, then split
   exactly at the `track_highPurity` stage and stay split for every stage after).

4. **Before trusting the numbers**, confirm both fiducial maps actually loaded —
   nonzero `nElectronFiducialHotSpotsLoaded` and `nMuonFiducialHotSpotsLoaded` in the
   output. If either map failed to load silently, the comparison won't match the
   production search selection and shouldn't be reported as if it did.

## Two things worth flagging before you run this

- **There is no muon fiducial map file in the checkout at all** (only electron maps
  exist under `pocket_coffea/data/fiducial_maps/`), and the electron map that does
  exist for this era is named `electron_fiducial_map_2022EFG.json` — not the
  `..._v2.json` naming the docs/skill example uses. With
  `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1` (which you want, per above) and no muon map
  available, the run will fail fast on a missing-map check rather than silently doing
  the wrong thing — but you'll need to locate or produce the muon map before this can
  actually run end to end.
- **No real 2022EFG chargino dataset JSON exists locally yet** — only the single-file
  mass-700 smoke sample. Building the EOS-based dataset JSON (step 1 above) is a
  prerequisite, not an optional extra.

## Why this matters beyond the number itself

`highPurity` isn't part of the disappearing-track selection today — this is a live
tradeoff decision, not a settled cut. The number this workflow produces is only the
signal-acceptance-cost side of it; it should be weighed against how much the
fake-track background yield actually drops when the same cut is applied (the
`disapptrks-fake-track-background` estimate, informed by the dE/dx discrimination
study in `disapptrks-track-diagnostics`). Also worth knowing: this isn't a named
systematic in the dissertation (Carrigan, OSU 2025, Ch. 7.5.4 lists pileup, missing
hits, ISR, JES/JER, MET, calo energy, lepton-veto SF, trigger efficiency, and track
reconstruction efficiency — no `highPurity` entry), because the requirement isn't in
the selection yet. So whatever number comes out of this run is live investigation
input for the group's decision, not a reproduction of an established analysis number.

Also worth double-checking: the group's per-machine note on this checkout says
`ref/DisappTrks_Nano` tracks `MattDev`, not `main`, and that's where this comparison
logic actually lives — I confirmed that's still the checked-out branch, but it's worth
reconfirming yourself if this note might be stale by the time you run it.
