---
name: disapptrks-fake-track-job-orchestration
description: End-to-end "just run it" flow for the DisappTrks_Nano fake-track background estimate -- given a request naming one or more run periods (e.g. "please run jobs to estimate fake tracks for 2024 and 2025"), checks that the required dataset JSONs actually exist on the shared EOS space, submits and monitors the basic/zmumu/zee PocketCoffea jobs on the LPC, postprocesses with make-standard-fake-track-estimate, and publishes the output to the shared EOS output space. Use this whenever asked to run, submit, or produce the fake-track estimate for specific period(s) end-to-end, as opposed to asking only for the command (disapptrks-job-submission) or only how to execute one already-known command (disapptrks-lpc-execution).
---

# Fake-track job orchestration

This is the "do the whole thing" layer on top of three existing skills -- it doesn't
duplicate their content, it chains them:

- **`disapptrks-job-submission`** -- the exact `DISAPPTRKS_*` command shape for the
  `fake_tracks` category mode.
- **`disapptrks-lpc-execution`** -- SSH/grid-proxy/tmux/container mechanics for
  actually running a command on the LPC.
- **`disapptrks-fake-track-background`** -- what the `basic`/`zmumu`/`zee` controls
  measure and the `make-standard-fake-track-estimate` postprocessing command.

Read those first if unfamiliar with any piece; this skill only adds the sequencing,
the pre-flight dataset check, and the EOS output-publish step.

## The `_dedx` output-directory convention

**Give every job's `--outputdir`, the postprocessed `--output-dir`, and the EOS
`--mode` tag in Step 5 a `_dedx` suffix** --
`analysis_output/<period>/fake_tracks/<control>_dedx` locally,
`tables/fake_tracks/<period>_dedx` for the standardized estimate output, and
`fake_tracks/<control>_dedx`/`fake_tracks/<period>_dedx` as the EOS mode tags. This
keeps a fresh round of jobs distinguishable from the many pre-existing runs already
sharing the same period/control names in `analysis_output/` and on the shared EOS
output space, both locally and once published, so a new submission never silently
collides with or shadows someone else's prior output. If the user asks for a
different suffix or naming scheme, follow that instead, but default to `_dedx` absent
other guidance.

## Trigger

A request naming one or more run periods and asking to run/submit/estimate fake
tracks, e.g. "please run jobs to estimate fake tracks for 2024 and 2025."

## Step 1 -- pre-flight dataset-JSON check (before submitting anything)

For **every** requested period, check all three controls up front, before touching
any job submission for any of them:

| Control | Sample | Canonical dataset-JSON name |
| --- | --- | --- |
| `basic` | `DATA_JetMET` | `eos_<period>_JetMET_OSUv2` |
| `zmumu` | `DATA_Muon` | `eos_<period>_Muon_OSUv2` |
| `zee` | `DATA_EGamma` | `eos_<period>_EGamma_OSUv2` |

```bash
ssh cmslpc "eos root://cmseos.fnal.gov/ ls /store/group/lpcdisapptrks/dataset_jsons" \
  | grep <period>
```

(See `lpc-eos` for the general EOS-listing conventions.) Build a full
period x control availability table from this and **report it to the user before
doing anything else** -- which controls are ready to run, and which are missing.

For any missing control:

- **Do not submit that job.** Do not guess an EOS NanoAOD source path or fabricate a
  dataset JSON to unblock it.
- Point at the fix: `disapptrks make-dataset-json <eos-path> -o <output.json> --sample
  <DATA_X> --year <year> --era <era> --primary-dataset <X> --publish` (the `--publish`
  flag, `publish_dataset_json`, was added specifically for this -- see
  `src/disapptrks/datasets.py`/`cli.py` in the checkout).
- Check `disappearing_tracks/nano_v2_migration_checklist.md` for whether the
  underlying NanoAOD reprocessing for that period/primary is even finished yet --
  a missing dataset JSON for a period still "early/mid-stage" in that checklist means
  the fix isn't "just publish a JSON," it's "the data isn't ready."

Only proceed to Step 2 for the (period, control) pairs confirmed present.

## Step 2 -- submit each available control's job

Use the exact `fake_tracks` command shape from
`disapptrks-job-submission/references/commands.md`, one job per (period, control):

- `DISAPPTRKS_CATEGORY_MODE=fake_tracks`, `DISAPPTRKS_FAKE_TRACK_CONTROL=<basic|zmumu|zee>`
- `DISAPPTRKS_DATASET_JSON=datasets/eos_<period>_<Sample>_OSUv2.json`,
  `DISAPPTRKS_DATASET_SAMPLE`/`DISAPPTRKS_DATASET_YEAR` read from that JSON's own
  metadata (per `disapptrks-job-submission` -- don't infer the year from the filename)
- `--outputdir analysis_output/<period>/fake_tracks/<control>_dedx`
- `dask@lpc` executor with the usual scaleout/queue flags

Follow `disapptrks-lpc-execution`'s full sequence to actually run each one: SSH in,
check the grid proxy, a tmux session per job (name it for what it's doing, e.g.
`fake-tracks-2025-zmumu`), enter `./shell`, confirm the environment once per session,
then submit. **Smoke-test first** (`--executor iterative --limit-files 1
--limit-chunks 1`) for any period/control combination not already confirmed working
in `disapptrks-job-submission/references/commands.md`.

## Step 3 -- monitor without blocking

Check tmux/Condor status once per period/control, report what's known, and either
schedule a follow-up check or tell the user how to ask again -- per
`lpc-remote-session`'s "checking on a long job without blocking" guidance. Never sit
in a tight poll loop; a `dask@lpc` fake-track job can run for a long time depending on
scaleout and queue.

## Step 4 -- postprocess once a period's three controls are all done

Confirm all three `output_*.coffea` files exist (don't just trust that the runner
command returned -- see `disapptrks-lpc-execution`'s completion checks), then run, per
`disapptrks-fake-track-background`:

```bash
disapptrks make-standard-fake-track-estimate \
  --run-period <period> \
  --basic-files pocket_coffea/analysis_output/<period>/fake_tracks/basic_dedx/output_all.coffea \
  --zmumu-files pocket_coffea/analysis_output/<period>/fake_tracks/zmumu_dedx/output_all.coffea \
  --zee-files pocket_coffea/analysis_output/<period>/fake_tracks/zee_dedx/output_all.coffea \
  --output-dir tables/fake_tracks/<period>_dedx \
  --transfer-factor-source fit \
  --fit-plots
```

Pass the three `--*-files` explicitly rather than relying on `--input-base`'s
auto-discovery (which defaults to the unsuffixed `analysis_output/<period>/fake_tracks/{basic,zmumu,zee}`
paths) -- with the `_dedx` convention above, auto-discovery will silently pick up
someone else's older, differently-suffixed run instead of this one's.

**Drop `--sideband-plots` if the jobs ran with `DISAPPTRKS_ENABLE_FAKE_SIDEBAND_HISTOGRAMS=0`**
(the `disapptrks-fake-track-background` skill's own recommended production setting) --
that flag skips exactly the per-hit-pattern/dE/dx diagnostic histograms
`--sideband-plots` needs, and passing it anyway raises a `KeyError` partway through
(the core estimate itself still computes and gets written before the crash, but the
command exits nonzero). `--fit-plots` still works since the transfer-factor-fit
histograms are always kept regardless of that env var.

If a period is only partially available (e.g. `zmumu` ready but `basic`/`zee` still
missing their dataset JSON per Step 1), say so explicitly rather than running the
standardized estimate against an incomplete set of controls -- offer the single-control
`estimate-fake-tracks` command instead if that's useful on its own.

## Step 4b -- combine into a multi-period table (once several periods are done)

For a multi-period fake-track-only table (AN Table-34-style, `P_fake`/`N_fake` for
both Z->mu mu and Z->ee), or to fold a period's fake-track estimate into the
Leptons/Spurious Tracks/Total summary table alongside the lepton-background
estimates, see `disapptrks-fake-track-background/references/formulas.md`'s
"Combining multiple periods into one table" section and
`disapptrks-lepton-backgrounds/references/workflow.md`'s matching section for the
exact commands (`combine-total-background-table` is CLI-wired; the fake-track-only
multi-period table currently needs a short script, not a CLI command -- see the
formulas.md note for why and how). Regenerate a combined table whenever a
contributing per-period table changes underneath it.

## Step 5 -- publish to EOS

**Do this step. Don't let it fall off the end of the task.** It's easy to stop once
Step 4 has produced a number and treat the job as "done" -- but per the user's own
correction after a real session skipped this for nearly every fake-track and
lepton-background job it ran in a row, the estimate isn't actually finished until the
output is published, since that's what makes it visible to anyone else using the
shared EOS space. Track this as an explicit remaining step the moment jobs are
submitted, not only after Step 4's number is in hand.

For each completed control's `analysis_output/<period>/fake_tracks/<control>_dedx`
directory, and for the postprocessed `tables/fake_tracks/<period>_dedx` directory, run:

```bash
disapptrks publish-output <local-dir> \
  --period <period> --mode fake_tracks/<control-or-tables-tag>_dedx \
  --eos-base root://cmseos.fnal.gov//store/group/lpcdisapptrks/disapptrks_output
```

Keep the `_dedx` suffix in the EOS `--mode` tag too, not just the local directory --
that's what keeps this round's publish from colliding with a prior, differently-named
publish of the same period/control. When publishing many directories in one pass (a
full multi-period, multi-control run), a small driver script looping over
`(period, mode, local_dir)` triples and calling `publish-output` for each is easier to
get right -- and easier to re-verify afterward by grepping its log for exit codes and
any "already exists" lines -- than typing out each call by hand.

**Unless the user indicated this is a dev/test run** -- in that case, skip this step
and say so explicitly rather than defaulting to publishing.

If the command reports the destination already exists, **stop and ask the user**
directly which of the two supported resolutions they want:

- `--overwrite` -- replace the existing EOS copy with this run's output.
- `--suffix <label>` -- publish this run alongside the existing copy instead (e.g.
  `--suffix dev` or `--suffix rerun2`), leaving the original untouched.

Never choose either on the user's behalf, and never default to overwriting.

## Step 6 -- record confirmed commands

Once a period/control's job is confirmed to have actually completed successfully,
update its entry in `disapptrks-job-submission/references/commands.md` to
**CONFIRMED** with the exact command used, the date, and who ran it -- per that
skill's own stated convention. Do this proactively, without being asked.

## Dataset-JSON readiness changes over time

Which (period, control) pairs have a canonical dataset JSON -- and whether the
underlying NanoAOD production is actually finished, not just published -- changes as
production continues. Don't trust a stale snapshot written into this skill; always
run Step 1's live EOS listing plus a check of
`nano_v2_migration_checklist.md` for the period/primary at hand before concluding a
control is or isn't ready.
