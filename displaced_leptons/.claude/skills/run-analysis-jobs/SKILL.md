---
name: run-analysis-jobs
description: Launching, monitoring, and resubmitting displaced_leptons analysis jobs on the FNAL LPC with scripts/run_lpc.py (PocketCoffea dask-on-condor), including the backup-before-resubmit procedure and the pocket-coffea run fallback. Use whenever a task involves submitting an analysis job, running a config over datasets, checking or resubmitting failed files or datasets, or reading failed_jobs.json / failed_files.csv.
---

# Running analysis jobs

Analysis jobs run through `scripts/run_lpc.py`, a modified version of PocketCoffea's
own runner that only supports the LPC dask executor. It processes each dataset
separately, writes one `output_<dataset>.coffea` per dataset, and records what
failed so it can be resubmitted. Always use it unless told otherwise; the stock
`pocket-coffea run` is documented at the end as a fallback only.

This skill covers the job-specific mechanics. SSH aliases, grid proxy checks, tmux
conventions, and node pinning come from `lpc-remote-session`; read it first if you
haven't this session. Skim production has extra supervision rules on top of this
skill, see `skim-manager`.

The work area is `/uscms_data/d3/lnestor/displaced_leptons` on the LPC (mounted
locally at `mnt/lpc-displaced-leptons/`). Run commands from its root, and read the
LPC copy of `scripts/run_lpc.py` rather than the `ref/` clone if the two disagree.

## Launching a job

Everything runs inside tmux, and inside the `./shell` apptainer container. The whole
launch is done with `tmux send-keys`; do not use `run_lpc.py --launch-tmux`, which
ends in `tmux attach` and needs a real TTY.

1. **Check the grid proxy** with `lpc-remote-session`'s check-never-create sequence,
   and note the path it resolves to. Stop and ask the user to refresh it if missing.
2. **Pick the output directory.** Use the name the user gives, as `output/<name>`
   relative to the work area, or ask if they gave none. Never reuse an existing
   directory for a new run: outputs and failure records inside it get overwritten.
   The only exception is a resubmit, which reuses the directory on purpose (see
   Resubmitting failed work).
3. **Check for an existing session** (`tmux ls`) and reuse it only if it is this same
   job. Name a new one for what it runs, e.g. `emu-closure-v4-DY`.
4. **Create the session in the work area, then enter the container:**

   ```bash
   ssh <alias> "tmux new -d -s <session> -c /uscms_data/d3/lnestor/displaced_leptons"
   ssh <alias> "tmux send-keys -t <session> './shell' Enter"
   ```

5. **Wait for the container prompt** before sending anything else, by polling
   `tmux capture-pane -t <session> -p`. The first entry after a fresh clone builds
   `.env` and takes a while.
6. **If the proxy is not at the default `/tmp/x509up_u<uid>`,** send the export first,
   using the path from step 1:

   ```bash
   ssh <alias> "tmux send-keys -t <session> 'export X509_USER_PROXY=<resolved-proxy-path>' Enter"
   ```

7. **Send the job:**

   ```bash
   ssh <alias> "tmux send-keys -t <session> 'python scripts/run_lpc.py --cfg configs/<config>.py -o output/<name> -s 80 -c 105000 [filters]' Enter"
   ```

   Options and defaults are in the next section.
8. **Record the node** (`ssh <alias> hostname`) right after launching, on the same
   connection that created the session. The tmux session lives only on that login
   node; see `lpc-remote-session` if it later seems to have vanished.
9. **Confirm it started** with `capture-pane`: the run-options table, the
   "Working on dataset" lines, and the dask "Waiting for the first job to start..."
   message. Then report and stop; don't wait for the job to finish.

## Options and defaults

Run `python scripts/run_lpc.py --cfg <config> -o <outputdir> [options]` from the work
area root, inside `./shell`. `--cfg` and `-o` are required.

| Option | Meaning |
|---|---|
| `--cfg` | Config file, `.py` or a pickled `.pkl` (`configs/config_ee.py`, `config_emu.py`, `config_mumu.py`, `config_genweights.py`, `configs/specific/...`) |
| `-o`, `--outputdir` | Output directory, created if missing |
| `-s`, `--scaleout` | Number of condor workers |
| `-c`, `--chunksize` | Events per chunk (lowered automatically for small datasets) |
| `--filter-datasets`, `--filter-samples`, `--filter-years` | Comma-separated filters on the datasets processed |
| `-lf`, `-lc` | Limit files / chunks |
| `-t`, `--test` | Test run: 2 files and 2 chunks unless `-lf`/`-lc` are given |
| `--resubmit-failed` | See Resubmitting failed work |
| `--launch-tmux` | Do not use, see Launching a job |

**Defaults to use** unless the user says otherwise: `-s 80` and `-c 105000`, with
`-c 75000` for MC. Data and MC use different chunk sizes; if a single run mixes them,
ask which to use.

**Filters are never applied on your own.** Pass `--filter-datasets`,
`--filter-samples` or `--filter-years` only when the user names what to run, and use
exactly what they name. With no filter, every dataset in the config is processed.

The full merged run-options table is printed at the start of every run; read it there
to confirm what actually applied.

## Output layout

Everything lands in the `-o` directory. Datasets are processed one at a time, and the
records below are updated right after each dataset finishes, so they stay accurate if
the run is interrupted.

| Path | Contents |
|---|---|
| `output_<dataset>.coffea` | Result for one dataset |
| `logfile.log` | Driver log |
| `failed_jobs.json` | Datasets that failed outright and need a full reprocess. Absent when empty |
| `failed_files.csv` | Failed pieces of otherwise-successful datasets: columns `dataset, filename, entrystart, entrystop`. One row per failed chunk; empty `entrystart`/`entrystop` means the whole file could not be opened. Absent when empty |
| `file_errors/<dataset>/<file>[__<start>_<stop>].err` | Traceback for each `failed_files.csv` row |
| `error/run_<dataset>.err` | Traceback for a dataset that failed outright; removed when that dataset later succeeds |

A dataset is in `failed_jobs.json` or in `failed_files.csv`, never both: when a dataset
is marked as failed outright, its `failed_files.csv` rows and `file_errors/<dataset>/`
are deleted. This is why a resubmit needs a backup first, see Resubmitting failed work.

At the end of a run the script warns if `failed_jobs.json` is non-empty, and prints
how many failed ranges and files each dataset had when it finishes.

Condor worker logs are not in the output directory. By default they go to
`$HOME/pocketcoffea_dask_logs/<basename of -o>/condor_log/` on the LPC
(`dask_job_output.<ClusterId>.<ProcId>.{log,out,err}`); look there when workers fail to
start or die.

## Checking on a running job

Check by default **every hour for a full run and every 20 minutes for a resubmit
run**, unless the user gives a different interval. Each check is one pass of the
commands below over ssh: report what you find, schedule the next check, and stop.
Don't sit in a tight poll loop between checks. **Scheduling is automatic:** as soon
as a job or resubmit is launched, and after every check while it is still running,
schedule the next check at the full interval above (with `ScheduleWakeup`, or
whatever the session provides) without being asked. Never schedule a shorter
interval than the default unless the user gives one. `lpc-remote-session` has the details on
reaching the right login node and querying condor; the job-specific parts are:

- **Progress:** `ssh <alias> "tmux capture-pane -t <session> -p"` shows the
  "Working on dataset" and "Saving output to" lines. Console logging is raised to
  ERROR after startup, so INFO messages only appear in `logfile.log` in the output
  directory (`tail` it over ssh).
- **Datasets done so far:** the `output_<dataset>.coffea` files in the output directory.
- **Workers:** `condor_q <username> -totals` with no `-name` (per-schedd breakdown).
  A single empty schedd result does not mean the job is stuck. If workers never
  start or keep dying, read the worker logs described under Output layout.
- **Session not found:** the tmux session is pinned to the login node it was created
  on. Use the node recorded at launch; if it was never recorded, `lpc-locate-job`
  recovers it.
- **Finished:** the pane is back at the `./shell` prompt, and `logfile.log` ends with
  either "All jobs completed successfully." or a warning that N job(s) failed. Stop
  scheduling checks once the job has finished. If failures remain, keep the session
  for the resubmit rounds. Once everything is done (the run finished and no resubmit
  is left to launch, whether it came out clean or the rounds are used up), close the
  session yourself with `tmux kill-session -t <session>` on the node recorded at
  launch, without asking. Close only sessions you created for this job, never one
  that was already there. An idle session at the `./shell` prompt is the only kind
  to close this way; a session still running a job is never killed (see below).

When a run finishes, look for `failed_jobs.json` and `failed_files.csv` in the output
directory. If either exists, resubmit it right away, following Resubmitting failed
work: the backup comes first, every time, and a resubmit is never launched without
one. Then check on the resubmit at the shorter interval, and if failures remain,
resubmit again (if only a small number of ranges remain, as an iterative resubmit,
see Few chunks left after one recovery). Do at most 2 resubmit rounds per run. Remaining failures are most
often transient (an overloaded storage endpoint, a busy site), so if any are left
after round 2, stop, report exactly what is still failing, and leave the output
directory as it is so the user can ask for another attempt later. Never kill a
running job's session without asking.

## Resubmitting failed work

`--resubmit-failed` with the same `-o` reprocesses only what the previous run recorded
as failed. It works per dataset, so it can only be run after the previous run has
finished. Do at most 2 resubmit rounds per run (see Checking on a running job).

### Back up the output directory before every round

When a dataset fails outright, `run_lpc.py` deletes that dataset's rows from
`failed_files.csv` and its `file_errors/<dataset>/` directory, because
`failed_jobs.json` takes precedence. That erases the record of which files or chunks
had failed. The backup exists so that list can be recovered and retried.

Always copy the whole output directory, as a sibling named
`<outputdir>_backup_<YYYYMMDD>`, e.g.
`output/emu_closure_test_v4_DY_backup_20260928`. If that name already exists (a second
round the same day), append `_2`, `_3`, ... rather than overwriting or copying into it
(`cp -r` into an existing directory nests the copy).

```bash
ssh <alias> "cd /uscms_data/d3/lnestor/displaced_leptons/output && cp -a <name> <name>_backup_<YYYYMMDD>"
```

Do this on the LPC over ssh, not through the sshfs mount, which is slow. Confirm it
finished (the sizes from `du -s` match) before launching the resubmit. Never launch a
resubmit without a completed backup that matches the current state of the output
directory. The one exception is a recovery (below) that leaves the directory identical
to an existing backup; reuse that backup instead of taking another.

### Keeping the number of backups down

- Keep a list of the backups you created for this run, by exact name.
- Once a newer backup is complete and verified, delete the previous backup from this
  run: recovery only ever needs the backup taken immediately before the failing round.
- When the run finishes with neither `failed_jobs.json` nor `failed_files.csv` in the
  output directory, delete this run's remaining backup. This needs no confirmation.
- If failures remain after round 2, keep the newest backup, report what is still
  failing, and leave the deletion to the user.
- Delete only the backups you created, by their exact names. Never use a glob, and
  never touch a backup from an earlier run.

### Launching the resubmit

Launch it the same way as a normal job (see Launching a job), with the same `--cfg`
and `-o`, and the same `-s` and `-c` as the original run: the chunk ranges being
retried are split using the chunk size. Add `--resubmit-failed`. Filters are optional
and can only narrow what is retried.

### What it does

| State in the output directory | What gets reprocessed | What happens to the output |
|---|---|---|
| Dataset in `failed_jobs.json` | The whole dataset | `output_<dataset>.coffea` is overwritten |
| Dataset only in `failed_files.csv` | Only the failed chunks and files | The result is merged onto the existing `output_<dataset>.coffea`. Both are un-scaled by their own `sum_genweights`, summed, and post-processed again so the weights stay correct. If nothing could be reprocessed, the existing output is kept |

After each dataset, its rows in `failed_jobs.json` and `failed_files.csv` are replaced
with what failed this time; anything that now succeeds is dropped.

### Recovering after a dataset fails outright

If a dataset that had `failed_files.csv` rows before the resubmit ends up in
`failed_jobs.json` afterwards, its rows and `file_errors/<dataset>/` are gone from the
output directory. Do not copy the rows back on their own: they describe what was
missing from a specific version of `output_<dataset>.coffea`, and copying them next to
a different version double counts the chunks that were recovered in between.

Restore them as a pair, from the backup taken immediately before the round that failed
the dataset:

1. Copy `output_<dataset>.coffea` from that backup over the one in the output directory.
2. Copy that dataset's rows from the backup's `failed_files.csv`, and its
   `file_errors/<dataset>/`, into the output directory.
3. Remove the dataset from `failed_jobs.json`.
4. Take a fresh backup if the output directory now differs from the one you restored
   from (other datasets changed during the failed round), then resubmit.

A recovery resubmit counts as one of the 2 rounds. If the dataset had no rows in the
backup (it failed outright on the first run), there is nothing to restore; resubmitting
reprocesses it in full.

### Few chunks left after one recovery: run it iteratively

If one resubmit round (a recovery) leaves only a small number of failed ranges, do
not run another dask round. Rerun the resubmit with the iterative executor instead:
a single process on the login node, no condor workers. It recovers ranges that kept
failing on dask (persistent XRootD "Operation expired" / "Socket timeout"). Small
here means on the order of 100 ranges or fewer: it cleared 101 ranges (ee DY) and 92
(emu DY) in one or two passes, and 8 (ee TTbar) in one.

Everything else is as in Launching the resubmit (same `--cfg`, `-o`, `-c`, backup
first, `./shell`, `.py` config), except:

- Add `--executor iterative` to `--resubmit-failed`, and drop `-s`, which does nothing
  here.
- It is slower per chunk, so check every 20 minutes as for any resubmit.
- It retries a little less per chunk: the `retries` value is not passed to this
  executor, so coffea's own default applies.
- Two such runs side by side on one login node worked fine, but keep it to a couple.

```bash
python scripts/run_lpc.py --cfg configs/<config>.py -o output/<name> -c <chunksize> --filter-samples <sample> --executor iterative --resubmit-failed
```

This counts as one of the 2 rounds, unless the user asks for more.

## Fallback: stock `pocket-coffea run`

Use `scripts/run_lpc.py` for everything. Only fall back to PocketCoffea's own runner
if the user asks for it or `run_lpc.py` itself is broken. Launch it the same way
(tmux, `./shell`, same output-directory rules), replacing the job command:

```bash
python -m pocket_coffea.scripts.runner run --cfg configs/<config>.py \
  --executor dask --executor-custom-setup lib/workflow/executors_lpc.py \
  --outputdir output/<name> --scaleout 80 -ps
```

Inside `./shell`, `pocket-coffea run ...` is equivalent; `.bashrc` wraps the
`pocket-coffea` command so it uses the venv Python that has `lpcjobqueue`. The stock
runner needs `--scaleout`, or you get a single condor worker. `-ps` writes one output
per dataset (see `merge-coffea` for combining them). `--test`, `-lf`, `-lc` and the
`--filter-*` options exist there too.

What you give up compared to `run_lpc.py`:

- No `failed_files.csv` or `file_errors/`. Skipped files are only a warning in the log,
  so nothing records which files to retry.
- `--resubmit-failed` still works, but only for entire datasets: a failed dataset is
  reprocessed in full. With no per-file record, there is nothing for the backup to
  protect, so the backup step above does not apply to a stock-runner directory.
- No chunk-level retry or output merging.
- `skip-bad-files` and `retries` are not set for you; pass what you need.

The command above is not verified against the current container image. If it fails on
an unrecognised option, read the runner's `--help` inside `./shell` rather than
guessing.

## Gotchas

- **Different behavior between runs with no code change:** the container image
  (`latest`) may have changed; see `pocketcoffea-image-drift`.
- **Files skipped unexpectedly, or never retried:** see `pocketcoffea-dask-retries`.
