---
name: skim-manager
description: Supervising long-running PocketCoffea skim production across this analysis's export configs (configs/specific/config_*_export.py) on the FNAL LPC -- tracking dataset queue progress in a state file, checking on running condor/dask jobs, resubmitting failures, and advancing to the next dataset. Use whenever a task touches skim production, tmp/skim_progress.json, or resuming/pausing skim supervision (e.g. "continue working on skims", "save skim progress").
---

# Skim production supervision

This analysis needs skims produced for all data/MC samples via the export
configs in `configs/specific/` (e.g. `config_emu_MuonEG_export.py`), run on
the FNAL LPC through `scripts/run_lpc.py`. Production takes a long time, so
progress is tracked in a state file rather than in conversation memory --
every session that picks this up starts cold and must reconstruct where
things stand by reading that file, not by assuming anything about what a
prior session did.

## Unit of work: one dataset, not one sample

Every launch processes exactly **one dataset** -- a single key of the
central dataset JSONs (e.g. `MuonEG_2022_preEE_EraC`,
`EGamma_2024_EraF_index0`,
`DYto2E-4Jets_Bin-MLL-50_TuneCP5_13p6TeV_madgraphMLM-pythia8_2024`) -- never
a whole sample (`MuonEG`, `DY`, `TTbar`, ...) and never several dataset
keys at once. Each launch passes `--filter-datasets <that one key>`. Never
use `--filter-samples` for skim production.

The point is to finish things incrementally: a sample-level run can take
days, and its failed files can't be resubmitted (same `outputdir`, same
driver) until every dataset in it is done. With one dataset per launch,
each dataset goes through the whole cycle -- run, resubmit its failed
files, transfer, build definitions, `done` -- before the next dataset is
launched, so problems are caught and closed out per dataset instead of
piling up at the end of a sample.

## The two layers

There are two independent things running, and it's important to keep them
separate:

- **The actual job**, on the LPC: `run_lpc.py --launch-tmux` launches the
  PocketCoffea/condor/dask driver inside its own `tmux` session on the LPC
  login node. This keeps running regardless of what happens locally -- it
  does not depend on this session, your local machine, or your terminal
  staying open.
- **This supervision loop**, locally: periodically checks in on that job,
  reacts to what it finds, and updates the state file. If this loop isn't
  running (you closed your terminal, didn't say "continue working on
  skims" today, etc.), the LPC job doesn't stop -- it just isn't being
  watched, so a failure won't get resubmitted until supervision resumes.

## State file

Progress lives in `tmp/skim_progress.json` (local, relative to the workspace's
`displaced_leptons/` directory, not on the LPC -- it's supervision bookkeeping, not
analysis code). Read it in full
before doing anything else; write it back after every action.

```json
{
  "default_run_options": "-s 20 -c 105000",
  "retry_cap": 3,
  "genweights_file": "output/genweight/output_all.coffea",
  "datasets": {
    "emu_MuonEG_2022_preEE_EraC": {
      "status": "running",
      "channel": "emu",
      "sample": "MuonEG",
      "dataset": "MuonEG_2022_preEE_EraC",
      "config": "configs/specific/config_emu_MuonEG_export.py",
      "run_options": "--filter-datasets MuonEG_2022_preEE_EraC",
      "outputdir": "output/skims_claude_emu_MuonEG_2022_preEE_EraC",
      "lpc_tmux_session": "pocketcoffea-emu-muoneg",
      "lpc_node": "cmslpc308.fnal.gov",
      "eos_staging_path": "/store/user/lnestor/skims_staging/emu/MuonEG_2022_preEE_EraC",
      "eos_final_path": "/store/user/lnestor/skims/emu/MuonEG_2022_preEE_EraC",
      "retries": 2,
      "last_checked": "2026-09-17T14:00:00",
      "notes": ""
    }
  },
  "queue_order": ["emu_MuonEG_2022_preEE_EraC", "emu_MuonEG_2022_preEE_EraD", "ee_EGamma_2024_EraF_index0"],
  "log": [
    {"time": "2026-09-17T14:00:00", "event": "resubmitted emu_MuonEG_2022_preEE_EraC after 3 failed files"}
  ]
}
```

- `status` is one of `pending`, `running`, `transfer_pending`, `done`,
  `stuck`. `transfer_pending` means the skim job itself finished cleanly
  but the EOS move to `eos_final_path` hasn't succeeded yet -- kept
  distinct from `running` so a transient EOS hiccup doesn't get confused
  with the job itself failing.
- `default_run_options` (`-s 20 -c 105000`, i.e. scaleout 20 / chunksize
  105000) is passed on every launch unless a dataset's own `run_options`
  overrides `-s`/`-c` specifically (see the OOM adjustment guardrail).
- Each entry in `datasets` (and each queue key) is exactly one dataset --
  see "Unit of work" above. Queue keys are `<channel>_<dataset key>`.
- `run_options` holds the `run_lpc.py` flags for this entry on top of
  `default_run_options`. It always contains
  `--filter-datasets <this entry's dataset>` (exactly one key) and never
  `--filter-samples`.
- `dataset` is the single central-JSON dataset key this entry processes;
  it is the value passed to `--filter-datasets`.
- `channel` (`ee`/`emu`/`mumu`) and `sample` (the catalog sample the
  dataset belongs to, e.g. `MuonEG`, `DY`, `TTbar`) are read directly,
  never inferred from the queue key. `sample` is still what the
  definition-building steps (step 3) are keyed on, since those produce one
  file per channel/sample that accumulates all of its finished datasets.
- `outputdir` for a dataset's first launch follows a fixed convention:
  `output/skims_claude_<queue key>` (e.g.
  `output/skims_claude_emu_MuonEG_2022_preEE_EraC`), marking it as skim
  production run by Claude. Compute it this way rather than inventing a
  name.
- `genweights_file` (top-level) is the path passed to
  `create_skim_dataset_definition.py --genweights-file`.
- `lpc_node` is the actual physical login node (e.g. `cmslpc308.fnal.gov`)
  the tmux session was launched on. `cmslpc-el9.fnal.gov` round-robins
  across several distinct nodes, and the SSH ControlMaster only persists
  10 min, so a later `ssh fnal-claude` can land on a different node than
  the one actually running the session -- checking status via the alias
  alone can silently miss it. Capture this immediately after launching,
  while still on the same ControlMaster connection used to launch it
  (`ssh fnal-claude hostname`); if that connection has already dropped,
  fall back to the `lpc-locate-job` skill instead of guessing. Every later
  check of this dataset (tmux, logs) must SSH directly to `lpc_node`, not
  the round-robin alias.
- `eos_staging_path` is where this dataset's config writes skimmed files
  during production (matching its `save_skimmed_files` value). Final
  destination under `eos_final_path` mirrors the same relative path once
  transferred.
- `retries` counts total resubmission/retry attempts for this dataset
  regardless of stage (job failure, OOM adjustment, or transfer) -- the log
  line for each says which.
- `notes` holds a short human-readable reason when a dataset is `stuck`, or
  a TODO for anything not yet finalized about that entry.
- `log` is append-only -- add a line for every action taken, never delete
  history from it.
- A dataset entry missing `outputdir`/`lpc_tmux_session`/`lpc_node`/
  `retries`/`last_checked` (only `status`, `config`, and optionally
  `run_options`/`notes` present) means it hasn't been launched yet --
  treat the same as a fresh `pending` entry.
- `done` is the true terminal state: skim finished, transferred, *and* both
  its skim dataset definition and skim supplement definition built (see
  step 3 below).

## Resume procedure

Triggered by things like "continue working on skims" or "resume skim
production."

1. Read `tmp/skim_progress.json` in full. Don't assume anything about state
   beyond what's in it.
2. For whichever dataset is `running` or `transfer_pending` (there should
   be at most one `running` at a time), SSH directly to that dataset's
   `lpc_node` (not the `fnal-claude` round-robin alias -- a fresh
   connection through the alias can land on a different physical node)
   and check its real status directly -- don't pre-check auth with
   `klist` first, just run the actual status check and read failure off
   its result:
   - Is the LPC-side `tmux` session (`lpc_tmux_session`) still alive?
   - Look at `logfile.log` and `failed_files.csv` in `outputdir` for
     completion/failure state.
3. Act on what's found:
   - **Still running, no problems**: nothing to do, just update
     `last_checked`.
   - **Finished, no failures**: move to `transfer_pending`. Check
     `eos_final_path` doesn't already exist -- if it does, treat as
     `stuck` (see Guardrails) instead of overwriting it. Otherwise move
     staging to final. Once the transfer succeeds, build this dataset's
     skim dataset definition:

     ```bash
     python3 scripts/datasets/create_skim_dataset_definition.py \
         --channels <channel> --genweights-file <genweights_file>
     ```

     Using this dataset's `channel` field and the state file's top-level
     `genweights_file` -- omit `--datasets` and let it pick up whatever
     dataset keys are actually present on EOS for that channel. Already-
     defined keys are safely skipped, so this is re-run after every
     dataset finishes and the per-sample file grows one dataset at a time.
     This writes `datasets/skims/<channel>/<sample>.json`. Once that file
     exists, any config listing that path under `datasets["skims"]`
     automatically prefers the skim over the central dataset for matching
     keys -- that override already works today via `lib/configurator.py`,
     nothing else needed there. For MC datasets, this step requires
     genweights to already exist for that dataset
     (`scripts/run_lpc.py --cfg configs/config_genweights.py ...`) -- if
     missing, the script skips the dataset and prints why; log that as a
     blocker in `notes` rather than silently retrying.

     Then build the skim-specific supplement definition:

     ```bash
     python3 scripts/datasets/create_supplement_definition.py \
         --samples <sample> --skim-channel <channel>
     ```

     Using this dataset's `sample` and `channel` fields directly. This
     is also re-run after every dataset finishes; after each run, confirm
     the new dataset's key is in the output and the previously finished
     datasets' keys are still there. This
     writes `datasets/skim_supplements/<channel>/<sample>.json`,
     matching supplement files to this dataset's actual skim files by
     (run, lumi) read directly out of the skim files (skim files aren't
     registered in DAS, so this can't go through the same DAS-query path
     central supplement definitions use). Only mark `done` once the
     transfer, `create_skim_dataset_definition.py`, and this step have all
     succeeded. Then advance the queue: pop the next `pending` entry from
     `queue_order` and launch it with `-o output/skims_claude_<queue key>`
     (`run_lpc.py --launch-tmux ...`, combining `default_run_options` with
     its own `run_options` if set). Immediately after launching, while
     still on the same SSH connection, capture `lpc_node` (`hostname`) and
     write it into the new entry -- see the `lpc_node` field above.
   - **Finished, some files failed**: resubmit these right away, as part
     of finishing this dataset -- don't transfer it, and don't launch the
     next dataset, until its failed files have been resubmitted and it
     finishes clean. If `retries` is under the cap, resubmit with
     `--resubmit-failed` (same `outputdir`), increment `retries`, log why.
     If at the cap, mark `stuck` with a note and leave it -- don't keep
     retrying automatically. (This is possible only because each launch is
     a single dataset; a multi-dataset run can't be resubmitted until the
     whole run is over.)
   - **tmux session is gone but the job never finished cleanly** (crashed):
     treat the same as "finished with failures" -- resubmit within the
     retry cap, or mark `stuck` if exhausted.
   - **SSH/auth failed**: see Auth failures below.
4. If nothing was `running` (e.g. first tick, or the queue just advanced),
   and there's a `pending` dataset with a resolved `run_options` (no
   outstanding TODO in `notes`), launch it. If the next `pending` entry
   has a TODO blocking it, skip it and try the next one in `queue_order`,
   logging that it was skipped and why. Before launching, confirm the
   entry's `run_options` has `--filter-datasets` with exactly one dataset
   key (see Unit of work); if an entry is sample-level (a `--filter-samples`
   value, or several keys), don't launch it -- expand it first into one
   entry per dataset key, taking the keys from
   `datasets/central/<sample>.json` filtered by the config's own
   `datasets["filter"]` (samples and year), not by hand, and put those
   entries in `queue_order` in its place. Launching uses
   `-o output/skims_claude_<queue key>` and
   combines `default_run_options` with the dataset's own `run_options`.
   Immediately after launching, while still on the same SSH connection,
   capture `lpc_node` (`hostname`) and write it into the entry -- see the
   `lpc_node` field above.
5. Write the updated state back to `tmp/skim_progress.json`, including a
   log line for whatever action was taken.
6. If no `CronCreate` job is covering this session yet (first time
   entering supervision this session -- check `CronList` if unsure),
   create ONE recurring job with `CronCreate` (not `ScheduleWakeup` -- see
   Reliability limits below), prompted to "Follow the skim-manager
   skill's resume procedure (steps 2-5) again." This single job then
   fires itself repeatedly on its own schedule -- do NOT call
   `CronCreate` again on every subsequent tick; each firing just re-enters
   steps 2-5 and stops there. (This is a deliberate departure from
   `ScheduleWakeup`/`/loop`, whose docs call for re-arming a fresh wakeup
   after every firing -- `CronCreate`'s `recurring: true` jobs don't need
   that.)

   Pick an off-round-minute interval (e.g. `*/17 * * * *` rather than
   `*/15`). The only two reasons to touch the cron job again after
   creating it:
   - **Tightening cadence** as the running job's own progress signal
     (chunk/file counts in `logfile.log`) shows it getting close to done
     -- e.g. down toward `*/7` once it looks like it's in the high-90s
     percent -- via `CronDelete` on the old job then a fresh
     `CronCreate` at the tighter interval.
   - **Terminal state**: once every dataset in `queue_order` reaches
     `done` or `stuck`, `CronDelete` the job -- there's nothing left to
     poll for.

   A brand-new session that resumes supervision (e.g. after "continue
   working on skims") always needs a fresh `CronCreate` call regardless --
   any job from a prior session died with that session and cannot be
   found via `CronList` here.

### Reliability limits

Both `CronCreate` and `ScheduleWakeup` (the `/loop` mechanism) are
session-only: they live only in this Claude session's memory, nothing is
written to disk, and they silently stop existing if the session's
underlying process dies (closed terminal, machine sleep/restart, etc.) --
neither survives that, and neither this skill nor the user can tell from
inside a *different* session whether an old one's scheduled job is even
still alive. `CronCreate` is used here anyway because `CronList` at least
lets a live session confirm its own job is actually scheduled, which
`ScheduleWakeup` cannot -- there is no tool to list or inspect pending
`ScheduleWakeup` wakeups, so a silently-missed wakeup is undiagnosable.
Don't claim or imply to the user that this makes production fully
unattended -- the LPC job itself is durable (runs in `tmux` independent of
this session), but supervision (retries, transfers, dataset-definition
generation, queue advancement) is not, and needs the user to periodically
say "continue working on skims" as a backstop, especially after any
restart of their machine or terminal.

## Wind-down procedure

Triggered by things like "save progress" or "wrapping up for the night."

1. Do one last real status check on whatever's currently `running` or
   `transfer_pending` (same checks as step 2 of the resume procedure) so
   the state file reflects reality, not a stale guess -- but don't start
   any new dataset or resubmit anything on this pass, just observe and
   record.
2. Write the state file.
3. Stop the loop (`CronDelete` the scheduled job -- use `CronList` first
   if the job ID isn't already at hand).
4. Print a short plain-English summary: what's currently running, what
   finished today, what's stuck (if anything) and why, and roughly how
   many datasets are left in the queue.

## Auth failures

There are two separate credentials involved, and they fail in different,
distinguishable ways -- don't lump them together:

- **Kerberos ticket** (`kinit`): if the SSH/LPC check in step 2 of the
  resume procedure fails outright (can't connect, can't run a command),
  that's this. Log a line noting supervision was blocked on auth this
  tick, leave all dataset statuses untouched, and stop -- don't retry the
  connection repeatedly within the same tick. The next `/loop` wakeup will
  just try again naturally, and will succeed as soon as you've kinit'd.
- **Grid proxy** (`X509_USER_PROXY`): this doesn't block SSH -- the LPC
  connection works fine, but the job itself fails when it tries to read
  from or write to EOS (`root://cmseos.fnal.gov/...`). Look for this
  specifically when reading `logfile.log`/`failed_files.csv` in step 2:
  errors mentioning `proxy`, authentication, or permission-denied against
  an `root://` path, as opposed to an ordinary file-processing error. When
  recognized, treat it like the Kerberos case -- log it, leave the
  dataset's status/retries untouched (resubmitting won't fix an expired
  proxy, so don't burn the retry cap on it), and wait for the next tick.
  Don't attempt to renew the proxy yourself, same as Kerberos.

In both cases, the fix requires you to act (re-`kinit`, or refresh the
grid proxy) -- this skill only detects and waits, never renews credentials
itself.

## Retry cap

Each dataset gets `retry_cap` (3) automatic retries -- job resubmission,
OOM-driven scaleout/chunksize adjustment, and transfer attempts all count
against the same counter -- before this skill stops touching it
automatically. Once a dataset's `retries` hits `retry_cap`:

- Set `status` to `stuck` and write a clear reason to `notes`.
- Do not resubmit or retry it again on future ticks.
- Do not let a `stuck` dataset block the rest of the queue -- keep
  processing other `pending` datasets normally.

## Guardrails

- Never delete or overwrite an existing skim output directory, EOS staging
  path, or final EOS path -- if a final path already exists where a skim
  should be transferred, treat it as `stuck` and let a human resolve it
  rather than assuming it's safe to replace.
- Scaleout and chunksize start at `default_run_options` (`-s 20 -c 105000`)
  for every dataset and may be adjusted automatically from there, but only
  downward and only in response to a clear memory-exhaustion signature in
  the job's logs (e.g. a worker OOM-killed, an explicit memory error) --
  not for other failure types, and not just because a job failed. Write
  the adjusted values into that dataset's own `run_options` (overriding
  `-s`/`-c` for it specifically) and log the old and new values and why.
  Any such adjustment still counts as one of the dataset's retries under
  the cap above.
- Never change scaleout or chunksize for any other reason without being
  asked.
- Never attempt to renew Kerberos or the grid proxy -- see Auth failures
  above.
- Never mark a dataset `done` without the transfer, `create_skim_dataset_definition.py`,
  and `create_supplement_definition.py --skim-channel` all succeeding for it.
- Never launch a skim run over more than one dataset key, or over a whole
  sample (`--filter-samples`). After launching, check the first
  `Working on dataset:` line in the tmux pane or `logfile.log` names only
  the intended key; if it names anything else, tell the user right away
  (don't kill the job on your own) rather than letting it run on
  unnoticed.
- Never advance to the next dataset while the current one still has
  unresolved failed files (`failed_files.csv` rows) and is under the retry
  cap -- resubmit and finish it first.
