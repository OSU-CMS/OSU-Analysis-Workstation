---
name: disapptrks-job-submission
description: Construct the full, currently-correct command to submit a DisappTrks_Nano PocketCoffea batch job on the LPC -- DISAPPTRKS_CATEGORY_MODE, dataset JSON, DISAPPTRKS_DATASET_SAMPLE/YEAR, mode-specific env vars, and the executor/scaleout/queue flags -- for any job type (Pveto or Poffline/Pmiss per lepton flavor, fake-track control regions, fiducial maps, signal acceptance, high-purity study, Z-sideband skim, tau trigger probability). Use this whenever the user wants to submit, launch, kick off, resubmit, or smoke-test a PocketCoffea job on the LPC; asks "how do I run the X job" or "what's the command for Y"; gives a DISAPPTRKS_CATEGORY_MODE or a dataset JSON and wants the rest of the command filled in; or is about to run something after a code change and needs to know what to re-run. Also use it right after successfully helping submit and confirm a job, to record the exact working command for next time.
---

# DisappTrks_Nano job submission

This skill answers **"what's the exact command"**. It does not cover:

- **"How do I get onto LPC and actually run it"** (SSH, grid proxy, tmux,
  entering the container) -- that's `disapptrks-lpc-execution`.
- **"What does this mode actually measure, and what does the output mean"**
  -- that's the relevant physics skill (`disapptrks-lepton-backgrounds`,
  `disapptrks-fake-track-background`, `disapptrks-signal-acceptance`,
  `disapptrks-track-diagnostics`).

Use those alongside this one; don't duplicate their content here.

## Read `references/commands.md` for the actual commands

It's organized by `DISAPPTRKS_CATEGORY_MODE` family, and every entry is
tagged with a confidence level -- read the tag before trusting an entry:

- **CONFIRMED** -- this exact command (or one differing only in per-run
  values like the dataset JSON, year, or output directory) was actually run
  on LPC and its success was reported back. Safe to copy and adapt.
- **REFERENCE** -- shown by the user as a real example, or taken from
  another skill's documented example, but not run-and-confirmed in this
  session. Very likely correct, but worth a smoke test first.
- **INFERRED** -- built from reading `config.py`'s handling of that
  `category_mode`, following the pattern of a confirmed/reference command for
  a sibling mode (e.g. guessing `muon_pveto`'s command from a reference
  `electron_pveto` one). Not yet verified against a real run at all --
  flag this explicitly if you use one, and treat every value as a
  starting point to double-check, not a fact.

**When you help submit a job and the user confirms it worked, update that
entry to CONFIRMED with the exact command used, the date, and who ran it.**
This file is meant to accumulate real, working examples over time so future
sessions stop re-deriving or guessing them -- do this proactively, without
being asked, whenever a submission is confirmed successful.

## The pieces of every command

Every job is the same shape: a block of `DISAPPTRKS_*` environment
variables, then `python -m pocket_coffea.scripts.runner run` with `--cfg
config.py` and executor flags. Get each piece right independently rather
than copying a whole command and hoping it transfers:

1. **`DISAPPTRKS_CATEGORY_MODE`** -- picks the physics content. See the mode
   table in `references/commands.md`; when unsure what a mode actually
   computes, check the matching physics skill, not just the name.
2. **Dataset selection** -- three env vars, and they are not independent:
   - `DISAPPTRKS_DATASET_JSON` -- path relative to `pocket_coffea/`, e.g.
     `datasets/eos_2023C_EGamma_OSUv2.json`. Convention observed so far:
     `eos_<period-label>_<Sample>_OSUv2.json`, but treat that as a pattern to
     confirm with `ls datasets/`, not a rule to construct blindly.
   - `DISAPPTRKS_DATASET_SAMPLE` / `DISAPPTRKS_DATASET_YEAR` -- **always set
     these explicitly rather than omitting them.** `config.py` will try to
     infer them from the dataset JSON's own `metadata.sample`/`metadata.year`
     fields, but *only* succeeds if every dataset entry in that JSON shares
     one value; if a file spans multiple eras (a real example:
     `eos_2023_Muon.json` contains both `year=2023` and
     `year=2023_postBPix` entries), inference silently gives up and that
     filter is **not applied at all** -- the job runs over everything in the
     file with no error or warning. The year value also does not necessarily
     match the period label in the filename (`eos_2023C_EGamma_OSUv2.json`
     pairs with `DISAPPTRKS_DATASET_YEAR=2023_preBPix`, not `2023C`) --
     read it from the dataset JSON's own `metadata` block
     (`python -c "import json; [print(v['metadata']) for v in json.load(open('datasets/<file>.json')).values()]"`),
     don't guess it from the filename.
3. **Mode-specific env vars** -- e.g. `DISAPPTRKS_ENABLE_PVETO_DIAGNOSTICS`,
   `DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS`, `DISAPPTRKS_FAKE_TRACK_CONTROL`,
   `DISAPPTRKS_ENABLE_SIGNAL_DEDX_HISTOGRAMS`. See
   `references/commands.md`'s per-mode section and
   `docs/pocket_coffea_workflows.md`'s env-var table in the checkout for the
   full, current list -- it changes as the code changes, so prefer the
   checkout's own table over anything memorized here.
4. **`--outputdir`** -- convention observed: `analysis_output/<period>/<mode
   or descriptive tag>`, e.g. `analysis_output/2023C/electron_pveto_dedx`.
   Label it so the period and any non-default flag (like a dE/dx-cut variant)
   are recoverable from the path alone.
5. **Executor** -- two real choices:
   - **Production**: `--executor dask@lpc --executor-custom-setup
     executors_lpc.py --custom-run-options run_options_lpc_dask.yaml
     --scaleout <N> --queue <queue>`. Observed `--scaleout` values range from
     60 to 200 depending on dataset size; `--queue workday` is the common
     case. This submits to Condor and returns once workers launch, not once
     processing finishes.
   - **Smoke test / local**: `--executor iterative` with `--limit-files 1
     --limit-chunks 1`, and drop every Dask/Condor-specific flag above (they
     don't apply). Runs synchronously in the current shell -- the command
     doesn't return until it's actually done, so you get real errors
     immediately instead of digging through Condor logs. Always do this
     before a full production submission of a new mode/config, per
     `disapptrks-lpc-execution`.

## After the job

Postprocessing/plotting commands (`estimate-lepton-background`,
`estimate-tau-background`, `estimate-fake-tracks`,
`summarize-signal-high-purity`, `make-fiducial-map`, ...) belong to the
relevant physics skill, not here -- this skill stops at "the job ran and
produced `output_*.coffea`".
