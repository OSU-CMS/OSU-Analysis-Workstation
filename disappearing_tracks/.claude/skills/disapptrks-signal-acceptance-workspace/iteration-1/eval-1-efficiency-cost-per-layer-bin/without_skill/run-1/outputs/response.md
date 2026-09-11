Short answer up front: I don't have a real number for you yet. No `signal_acceptance` PocketCoffea job has actually been run over the 2022EFG chargino samples in this environment, so I can't quote you a "you'd lose X% in the 4-layer bin" figure — anything I typed there would be invented. What I can do is show you exactly how this framework is built to answer that question, and what's still missing before we can actually run it.

## What I found when I went looking

This repo (`DisappTrks_Nano`, the PocketCoffea-based Nano-tier framework at `ref/DisappTrks_Nano`) already has a purpose-built mode for exactly this comparison:

- `pocket_coffea/cuts.py` defines, per layer bin (`NLayers4`, `NLayers5`, `NLayers6plus`, `combinedBins`), a pair of cutflow categories: `signal_selection_without_high_purity_<layer>` and `signal_selection_with_high_purity_<layer>`, counting `nIsoTrackSearchNoHighPurity_<layer>` vs `nIsoTrackSearch_<layer>`. Below the layer split it also builds a `CartesianSelection` crossing every basic-event/disappearing-track cut against a with/without-`highPurity` axis (`signal_acceptance_stage_cuts`, `signal_acceptance_layer_axis_cuts`, `signal_acceptance_variant_axis_cuts`), so the *entire* cumulative cutflow is available in both variants, not just the final yield.
- `pocket_coffea/config.py` wires this up under `DISAPPTRKS_CATEGORY_MODE=signal_acceptance`.
- `src/disapptrks/cli.py` has `disapptrks summarize-signal-high-purity <coffea files> --sample <sample> --full-cutflow`, which prints exactly the table you're asking for: `without HP`, `with HP`, `retained`, `lost` for combined/4-layer/5-layer/≥6-layer, plus (with `--full-cutflow`) the full cut-by-cut breakdown showing where in the selection the `highPurity` bit actually removes tracks.
- `docs/pocket_coffea_workflows.md` (section "Signal acceptance of the high-purity requirement") documents the exact invocation, using a `local_chargino_700.json` smoke dataset as the worked example — 2022EFG, `SIGNAL_Chargino`, with the 2022EFG electron/muon fiducial maps required.

So the machinery to measure this is real and already built; it's just never been pointed at the actual 2022EFG chargino production samples.

**One thing I want to flag rather than quietly use:** there are five `.txt` files sitting in `ref/DisappTrks_Nano/docs/` (`AMSB_Wino_M100GeV_ctau10000cm...txt`, and four `M700GeV` ctau variants) that look at a glance like `summarize-signal-high-purity` output — same combined/4-layer/5-layer/≥6-layer table shape. I checked them against actually treating them as your answer, and I don't think they should be:
- They're untracked by git (`git status` shows them as `??`) and there's no commit or log associated with them, so I can't tell who produced them, when, or from what config/dataset.
- The row label they use ("highPurity for 4-layer tracks") doesn't match the current CLI's actual label ("highPurity track ID"), which makes me doubt they came from this version of `summarize-signal-high-purity`.
- Nothing in them ties them to a run period (no "2022EFG" anywhere in the file, no metadata block), and the raw stats are small enough (dozens to low hundreds of surviving events) to be smoke-test-scale rather than a full production sample.

Given the explicit ask was for 2022EFG chargino numbers, and I can't verify these came from that, I'm treating them as unverified rather than reusable — happy to dig into their provenance with you if you know where they came from, but I won't report their percentages as "the answer."

## How I'd actually go about getting the real number

1. **Confirm the input samples exist.** Right now the only chargino dataset JSON in the repo is `pocket_coffea/datasets/local_chargino_700.json` — a single local file, 1511 events, one mass point (700 GeV), used purely as the docs' worked smoke example. There's no `eos_2022EFG_chargino*.json` analogous to the data-side `eos_2022EFG_Muon.json`/`eos_2022EFG_EGamma.json`. Before anything else, we'd need to know where the actual 2022EFG chargino (AMSB Wino) signal NanoAOD lives on EOS — which mass/ctau points count as "the 2022EFG chargino samples" for this question — and build a real dataset JSON for it, either by hand (matching the existing `eos_*.json` format) or via `disapptrks make-dataset-json <eos_path> -o <out.json> --sample SIGNAL_Chargino --year 2022_postEE --era ...`.
2. **Run the `signal_acceptance` mode**, per the documented recipe, against that dataset instead of the smoke JSON:
   ```
   DISAPPTRKS_CATEGORY_MODE=signal_acceptance \
   DISAPPTRKS_ENABLE_SIGNAL_DEDX_HISTOGRAMS=1 \
   DISAPPTRKS_OUTPUT_VARIANT=chargino_2022EFG_high_purity \
   DISAPPTRKS_DATASET_JSON=datasets/<the real 2022EFG chargino json> \
   DISAPPTRKS_DATASET_SAMPLE=SIGNAL_Chargino \
   DISAPPTRKS_DATASET_YEAR=2022_postEE \
   DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
   DISAPPTRKS_ELECTRON_FIDUCIAL_MAP_JSON=data/fiducial_maps/electron_fiducial_map_2022EFG_v2.json \
   DISAPPTRKS_MUON_FIDUCIAL_MAP_JSON=data/fiducial_maps/muon_fiducial_map_2022EFG_v2.json \
   python -m pocket_coffea.scripts.runner run \
     --cfg config.py \
     --outputdir analysis_output/2022EFG/signal_acceptance/chargino_2022EFG_high_purity \
     --executor dask   # iterative only makes sense for a tiny smoke test; real signal stats need dask/condor on LPC
   ```
   The fiducial-map requirement matters here — it's what makes the tested selection match the actual production search selection rather than a looser proxy.
3. **Summarize it**:
   ```
   disapptrks summarize-signal-high-purity \
     analysis_output/2022EFG/signal_acceptance/chargino_2022EFG_high_purity/output_all.coffea \
     --sample SIGNAL_Chargino --full-cutflow
   ```
   This gives the retained/lost percentage per layer bin directly, plus (via `--full-cutflow`) the full cumulative cutflow so we can see exactly which cut stage the `highPurity` bit interacts with (it's a single explicit row — `track_highPurity` — inserted after the layer-bin requirement; everything before it is identical between the two variants by construction).
4. **If "samples" really means multiple mass/ctau points**, either fold them into one dataset JSON with distinct sample keys and use `--dataset`/`--sample` to break out each point separately (acceptance for a highPurity-style requirement is known to depend on lifetime/mass through the track's hit/layer topology, so I wouldn't just report one blended number), or run each point and compare the `combinedBins` and per-layer rows across points.
5. **Actually executing this** means logging into the LPC, confirming the grid proxy, working inside the analysis's Apptainer/Singularity shell, and running the job in tmux — none of which I did here, since no real LPC credentials or grid proxy are available in this session and I was explicitly asked not to attempt any remote execution. That's mechanically what the `disapptrks-lpc-execution` skill in this repo covers once we're ready to actually submit.

## What I'd expect physically (a hypothesis, not a result)

`highPurity` is a track-quality bit derived from the fit's chi-square, hit-pattern consistency, etc. Tracks reconstructed from fewer layers generally have less redundant hit information to make that fit robust, so I'd *expect* the acceptance loss to be largest in the 4-layer bin and smallest in the ≥6-layer bin, with 5 layers in between — consistent with the general shape (small effect, biggest at 4 layers) glimpsed in the unverified `docs/` text files. But that's exactly the kind of intuition a real cutflow either confirms or corrects, and given the wino/chargino lifetime dependence baked into the layer-bin split itself, I wouldn't want to commit to a number without actually running it.

If you'd like, I can help draft the real 2022EFG chargino dataset JSON once you tell me where those samples are staged on EOS, so the job is ready to submit the next time we have LPC access.
