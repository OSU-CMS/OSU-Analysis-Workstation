---
name: disapptrks-lepton-background-job-orchestration
description: End-to-end "just run it" flow for the DisappTrks_Nano charged-lepton background estimate -- electron, muon, or tau -- given a request naming a flavor and a run period (e.g. "run the electron background estimate for 2023C" or "run the tau background estimate for 2022CD"). For electron/muon, submits and monitors the <flavor>_pveto and <flavor>_pmiss_poffline PocketCoffea jobs, then runs estimate-lepton-background. For tau, submits and monitors four jobs (tau_mu_pveto, tau_ele_pveto, tau_pmiss_poffline, tau_trigger_probability), then runs estimate-tau-background. Either way, publishes the output to the shared EOS output space. Use this whenever asked to run, submit, or produce a lepton or tau background estimate end-to-end for a period, as opposed to asking only for the command (disapptrks-job-submission) or only how to execute one already-known command (disapptrks-lpc-execution).
---

# Lepton background job orchestration (electron / muon / tau)

This is the "do the whole thing" layer on top of three existing skills -- it doesn't
duplicate their content, it chains them:

- **`disapptrks-job-submission`** -- the exact `DISAPPTRKS_*` command shape for the
  `*_pveto`, `*_pmiss_poffline`, and `tau_trigger_probability` category modes.
- **`disapptrks-lpc-execution`** -- SSH/grid-proxy/tmux/container mechanics for
  actually running a command on the LPC.
- **`disapptrks-lepton-backgrounds`** -- the physics definitions, analysis invariants
  (the dE/dx cut on probe/control tracks, fiducial-map auto-resolution, etc.), and the
  `estimate-lepton-background`/`estimate-tau-background` postprocessing commands.

Read those first if unfamiliar with any piece; this skill only adds the sequencing,
the code-sync check, and the EOS publish step.

## The `_dedx` output-directory convention

**Give every job's `--outputdir` (and its EOS `--mode` tag in Step 5) a `_dedx`
suffix** -- `analysis_output/<period>/<flavor>_pveto_dedx`,
`analysis_output/<period>/tau_mu_pveto_dedx`, etc., for *every* mode, tau included
(earlier versions of this skill only showed `_dedx` on the electron/muon paths, which
is exactly what caused a real session to run all four tau jobs without it, and then
have to explain the inconsistency and redo the EOS-mode naming after the fact). The
point is to keep any session's or contributor's ad hoc/current-round-of-jobs output
distinguishable from the analysis_output directory's many pre-existing runs sharing
the same period/mode names -- both locally and on the shared EOS output space -- so a
fresh submission never silently collides with or shadows someone else's prior output.
If the user asks for a different suffix or naming scheme, follow that instead, but
default to `_dedx` absent other guidance.

**Electron/muon is a two-job flow; tau is a four-job flow with an extra manual input**
(the effective trigger efficiency) -- see Steps 1-4 below, which branch by flavor.
Don't try to force the tau flow into the electron/muon pair-of-jobs shape or vice versa.

## Trigger

A request naming electron, muon, or tau and a run period, asking to run/submit/estimate
the lepton or tau background end-to-end, e.g. "run the electron background estimate for
2023C" or "run the tau background estimate for 2022CD."

## Step 0 -- confirm the checkout actually has what this job needs

Before submitting anything, on whichever checkout will run the job:

```bash
ssh cmslpc "cd <checkout> && git fetch origin <branch> -q && git log origin/<branch> -1 --oneline && git log -1 --oneline"
```

If the local HEAD doesn't match `origin/<branch>`, or the working tree has uncommitted
changes to `pocket_coffea/workflow.py`/`src/disapptrks/selections.py` that look
related to the lepton-background probe/control-track selection, **stop and ask**
rather than assuming which version is correct -- per `disapptrks-lepton-backgrounds`'s
own "before editing, check `git status --short` and do not revert unrelated local
changes" guidance, and per this repo's git discipline: never commit or push on the
user's behalf without asking, and never assume a different session's uncommitted work
is safe to discard. If another session reports work as "pushed" but a checkout here
disagrees, re-fetch before trusting either side -- a stale local `git log` (checked
without fetching first) is a common false alarm, not necessarily a real gap.

If everything matches, say so briefly and move on -- don't treat this as needing the
user's attention every time, only when there's an actual discrepancy.

## Step 1 -- submit the `<flavor>_pveto` job (electron/muon)

**Tau: skip to Step 1t below instead.**

Per `disapptrks-job-submission`/`references/commands.md`'s Pveto section:

```bash
cd pocket_coffea/
DISAPPTRKS_CATEGORY_MODE=<electron|muon>_pveto \
DISAPPTRKS_ENABLE_PVETO_DIAGNOSTICS=0 \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
DISAPPTRKS_DATASET_JSON=datasets/eos_<period>_<EGamma|Muon>_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_<EGamma|Muon> \
DISAPPTRKS_DATASET_YEAR=<year-from-dataset-metadata> \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/<period>/<flavor>_pveto_dedx \
  --executor dask@lpc --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 200 --queue workday
```

Read `DISAPPTRKS_DATASET_YEAR` from the dataset JSON's own `metadata` block, not the
filename (see `disapptrks-job-submission` -- e.g. `eos_2023C_EGamma_OSUv2.json` pairs
with `2023_preBPix`, not `2023C`). Confirm the dataset JSON actually exists first
(`eos root://cmseos.fnal.gov/ ls /store/group/lpcdisapptrks/dataset_jsons`, per
`lpc-eos`) rather than assuming the naming convention holds for a period not seen
before.

Follow `disapptrks-lpc-execution`'s full sequence to run it: SSH in, check the grid
proxy, a tmux session named for the job (e.g. `electron-pveto-2023C`), enter
`./shell`, confirm the environment once per session, then submit.

**Let it sit once submitted.** Dask/Condor worker startup can take a while when the
LPC pool is busy -- don't treat "no workers yet" after a minute or two as a hang. If
it's genuinely not progressing, check `condor_q -better-analyze <clusterid>` on the
LPC (rather than interrupting) to see whether jobs are actually being matched against
available slots or stuck on an unsatisfiable requirement.

## Step 1t -- submit the four tau jobs (tau only)

Unlike electron/muon, tau needs four jobs, split across two datasets. Submit all
four following `disapptrks-job-submission`/`references/commands.md`'s Pveto and
Poffline/Pmiss sections for the mode shape, plus its `tau_trigger_probability` entry:

| Job | `DISAPPTRKS_CATEGORY_MODE` | Dataset | Fiducial map |
| --- | --- | --- | --- |
| tau (muon leg) `Pveto` | `tau_mu_pveto` | `DATA_Muon` | muon map (auto-resolved) |
| tau (electron leg) `Pveto` | `tau_ele_pveto` | `DATA_EGamma` | electron map (auto-resolved) |
| tau normalization control | `tau_pmiss_poffline` | `DATA_Muon` | none |
| tau trigger probability | `tau_trigger_probability` | `DATA_Muon` | none |

Do **not** also submit `tau_mu_pmiss_poffline`/`tau_ele_pmiss_poffline` by default --
those are legacy-equivalent/diagnostic only and excluded from the final combination
(per `disapptrks-lepton-backgrounds`'s tau invariant); only add them if the user
explicitly asks for that comparison.

```bash
cd pocket_coffea/
DISAPPTRKS_CATEGORY_MODE=tau_mu_pveto \
DISAPPTRKS_ENABLE_PVETO_DIAGNOSTICS=0 \
DISAPPTRKS_REQUIRE_FIDUCIAL_MAPS=1 \
DISAPPTRKS_DATASET_JSON=datasets/eos_<period>_Muon_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_Muon \
DISAPPTRKS_DATASET_YEAR=<year-from-dataset-metadata> \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/<period>/tau_mu_pveto_dedx \
  --executor dask@lpc --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 200 --queue workday
```

`tau_ele_pveto` is the same shape with `DISAPPTRKS_CATEGORY_MODE=tau_ele_pveto`, the
`DATA_EGamma` dataset JSON, `DISAPPTRKS_DATASET_SAMPLE=DATA_EGamma`, and
`--outputdir analysis_output/<period>/tau_ele_pveto_dedx`.

```bash
DISAPPTRKS_CATEGORY_MODE=tau_pmiss_poffline \
DISAPPTRKS_DATASET_JSON=datasets/eos_<period>_Muon_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_Muon \
DISAPPTRKS_DATASET_YEAR=<year-from-dataset-metadata> \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/<period>/tau_pmiss_poffline_dedx \
  --executor dask@lpc --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 200 --queue workday
```

```bash
DISAPPTRKS_CATEGORY_MODE=tau_trigger_probability \
DISAPPTRKS_DATASET_JSON=datasets/eos_<period>_Muon_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_Muon \
DISAPPTRKS_DATASET_YEAR=<year-from-dataset-metadata> \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/<period>/tau_trigger_probability_dedx \
  --executor dask@lpc --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 200 --queue workday
```

All four `DISAPPTRKS_CATEGORY_MODE`s are **CONFIRMED** as of 2026-09-15 -- check
`disapptrks-job-submission/references/commands.md`'s status table for the current,
authoritative confirmation state and exact confirmed command shape rather than trusting
this snapshot as it ages. For a genuinely new mode (not these four), still smoke-test
first (`--limit-files 1 --limit-chunks 1`, dropping the Dask/Condor flags, or
`--scaleout 2 --queue microcentury`) before a full submission.

Use one tmux session per job (e.g. `tau-mu-pveto-2022CD`, `tau-ele-pveto-2022CD`,
`tau-pmiss-poffline-2022CD`, `tau-trigger-probability-2022CD`) per
`disapptrks-lpc-execution` -- and if a session gets reused across multiple job
submissions, run `pwd` before each new command rather than assuming its working
directory, per `disapptrks-lpc-execution`'s double-`cd` trap.

## Step 2 -- submit the `<flavor>_pmiss_poffline` job (electron/muon)

**Tau: already covered in Step 1t above.**

Same dataset, different mode, no fiducial maps or Pveto diagnostics:

```bash
DISAPPTRKS_CATEGORY_MODE=<electron|muon>_pmiss_poffline \
DISAPPTRKS_DATASET_JSON=datasets/eos_<period>_<EGamma|Muon>_OSUv2.json \
DISAPPTRKS_DATASET_SAMPLE=DATA_<EGamma|Muon> \
DISAPPTRKS_DATASET_YEAR=<year-from-dataset-metadata> \
python -m pocket_coffea.scripts.runner run \
  --cfg config.py \
  --outputdir analysis_output/<period>/<flavor>_pmiss_poffline_dedx \
  --executor dask@lpc --executor-custom-setup executors_lpc.py \
  --custom-run-options run_options_lpc_dask.yaml \
  --scaleout 200 --queue workday
```

If this is the first time this exact mode has been confirmed working for this
checkout's current code (check `disapptrks-job-submission/references/commands.md`'s
status tag), watch its Configurator summary at startup to confirm it builds without
error before walking away, the same way a new mode gets smoke-tested elsewhere in
`disapptrks-lpc-execution`.

## Step 3 -- monitor without blocking

Check tmux/Condor status once per job, report what's known, and either schedule a
follow-up check or tell the user how to ask again -- per `lpc-remote-session`'s
"checking on a long job without blocking" guidance. Confirm each job's
`output_*.coffea` file actually exists and its tmux pane / Condor log shows it
finished without error before treating it as ready for Step 4 (per
`disapptrks-lpc-execution`'s completion checks) -- don't infer completion just
because the runner command returned. For tau, all four jobs need this check, not
just two.

## Step 4 -- compute the estimate

**Electron/muon:**

```bash
cd DisappTrks_Nano
disapptrks estimate-lepton-background \
  --mode <electron|muon> \
  --run-period <period> \
  --output-json tables/<flavor>_background_<period>.json \
  --output-tex tables/<flavor>_background_<period>.tex \
  pocket_coffea/analysis_output/<period>/<flavor>_pveto_dedx/output_all.coffea \
  pocket_coffea/analysis_output/<period>/<flavor>_pmiss_poffline_dedx/output_all.coffea
```

The first file supplies Pveto pair counts; the second supplies `N_ctrl`/`Poffline`/
`Pmiss`. Per `disapptrks-lepton-backgrounds`'s completion checks, confirm the reported
`trigger_efficiency_method`/`met_method` diagnostics are the expected
`legacy-tag-probe`/`hist-integrated` (not `default`/`cutflow-ratio`, which means stale
or incomplete inputs) before reporting `N_<flavor>` as a real result.

**Tau:**

```bash
cd DisappTrks_Nano
disapptrks estimate-tau-background \
  --run-period <period> \
  --output-json tables/tau_background_<period>.json \
  --output-tex tables/tau_background_<period>.tex \
  --trigger-efficiency <value> \
  --trigger-efficiency-error <value> \
  --tau-probability-files pocket_coffea/analysis_output/<period>/tau_trigger_probability_dedx/output_*.coffea \
  --tau-control-files pocket_coffea/analysis_output/<period>/tau_pmiss_poffline_dedx/output_*.coffea \
  --tau-mu-files pocket_coffea/analysis_output/<period>/tau_mu_pveto_dedx/output_*.coffea \
  --tau-ele-files pocket_coffea/analysis_output/<period>/tau_ele_pveto_dedx/output_*.coffea
```

`--trigger-efficiency`/`--trigger-efficiency-error` are **required and have no
automatic source** for tau -- unlike electron/muon, `trigger_efficiency_method` is
always `manual-cross-trigger-control`, never derived from the `*_pveto` output.
**Ask the user for the current effective value for this run period** (or find it in
the AN/dissertation) before running Step 4 -- do not reuse another period's checked-in
example value (`0.90 ± 0.006` for 2022CD in `docs/pocket_coffea_workflows.md`) as a
default. Confirm the reported `trigger_efficiency_method=manual-cross-trigger-control`
is what's expected (it always is, for tau) and that `tau_probability` was actually
computed from the `tau_trigger_probability` job (a printed
`Calculated tau_probability=...` line) rather than silently falling back to `None`.

## Step 4b -- combine into a multi-period table (once several periods are done)

Once more than one period's Step 4 table exists for the same flavor, don't leave
them as separate per-period files if the user wants an overview -- combine them with
`disapptrks combine-lepton-background-tables` (one flavor, many periods) or, once
muon/electron/tau/fake-track are all done for a period, `disapptrks
combine-total-background-table` (Leptons/Spurious Tracks/Total, matching the
dissertation's summary-table layout). Both are documented with full example commands
in `disapptrks-lepton-backgrounds/references/workflow.md`'s "Combining multiple
periods into one table" section -- read that rather than hand-building the table or
reusing a stale one-off script. Regenerate the combined table any time a
contributing per-period table changes (a new period finishes, or an existing one gets
recomputed after a bug fix) -- it's easy to update the per-period tables and forget
the combined one is now stale.

## Step 5 -- publish to EOS

**Do this step. Don't let it fall off the end of the task.** It's easy to stop after
Step 4 once a number is in hand and treat the job as "done" -- but per the user's own
correction after a real session skipped this for nearly every job it ran, the estimate
isn't actually finished until the output has been published, since that's what makes
it visible to anyone else using the shared EOS space. Set a reminder for yourself (a
task-list entry, or just holding it in mind) the moment you submit a job, not only
after Step 4's number is computed.

For each job directory (`<flavor>_pveto_dedx`/`<flavor>_pmiss_poffline_dedx` for
electron/muon; `tau_mu_pveto_dedx`/`tau_ele_pveto_dedx`/`tau_pmiss_poffline_dedx`/
`tau_trigger_probability_dedx` for tau), and the `tables/<flavor|tau>_background_<period>_dedx`
output, run one `publish-output` call per directory, keeping the `_dedx` suffix in the
EOS `--mode` tag too (not just the local directory) -- that's what keeps this round's
publish from colliding with a prior, differently-named publish of the same period/mode:

```bash
disapptrks publish-output <local-dir> \
  --period <period> --mode <flavor>_pveto_dedx \
  --eos-base root://cmseos.fnal.gov//store/group/lpcdisapptrks/disapptrks_output
```

(Swap `--mode` for whichever job directory or the tables tag matches what's being
published -- for tau that's four separate job-directory calls plus the tables call,
not a combined publish. When publishing many directories in one pass, a small driver
script looping over `(period, mode, local_dir)` triples and calling `publish-output`
for each is easier to get right and to re-verify afterward than typing out each call
by hand -- check the resulting log for exit codes and any "already exists" lines
before considering the batch done.)

**Unless the user indicated this is a dev/test run** -- skip this step and say so
explicitly rather than defaulting to publishing. If the command reports the
destination already exists, **stop and ask the user** which of the two supported
resolutions they want (`--overwrite` to replace, or `--suffix <label>` to publish
alongside without touching the existing copy) -- never choose either on the user's
behalf. See `disapptrks-fake-track-job-orchestration` for the same pattern applied to
the fake-track estimate, if a worked example is useful.

## Step 6 -- record confirmed commands

Once a job is confirmed to have actually completed successfully, update its entry in
`disapptrks-job-submission/references/commands.md` to **CONFIRMED** with the exact
command used, the date, and who ran it -- per that skill's own stated convention. Do
this proactively, without being asked. Check that file directly for the current,
authoritative confirmation state of each mode rather than trusting a status snapshot
written into this skill, which will drift out of date as more runs get confirmed.
