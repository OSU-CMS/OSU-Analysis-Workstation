---
name: lpc-locate-job
description: Recovering which physical FNAL LPC login node a currently running dask scheduler/driver process (e.g. a PocketCoffea dask-on-condor run in tmux) is on, when the node was not recorded at launch and has been forgotten. Only for a job that is running right now with at least one condor worker. Use whenever a task touches "where is my job running", "which node is my tmux session on", locating a dask scheduler, or a tmux session that `tmux ls` no longer shows on cmslpc-el9.
---

# Locating a running dask driver's login node on the LPC

## When to use this

This is for one situation: a job is **running right now**, and we have **forgotten
which login node it is on**. Typically a `tmux` session was started earlier (this
session or a previous one), `ssh <lpc-host-alias>` landed on a different node this time,
and `tmux ls` comes back empty even though the job is alive.

- If the node was recorded when the job was launched, don't use this -- `ssh` straight
  to the recorded node (see the round-robin note in `lpc-remote-session`).
- If the job has finished, crashed, or has no condor workers running yet, this can't
  find it -- see Notes.

## Why the node is lost

A PocketCoffea (or other dask-on-condor) run is launched by hand in a `tmux` session on
an LPC login node, behind the `cmslpc-el9.fnal.gov` alias, which round-robins across
several distinct physical nodes (e.g. `cmslpc361`, `cmslpc366`, ...). The driver script
starts a local dask scheduler and isn't itself a condor job, so it never shows up in
`condor_q` directly, and the node you're currently SSH'd into is not necessarily the one
running the tmux session started earlier.

The trick: every condor **worker** job the driver spawns is told the scheduler's address
on its command line. Read that back out of the worker's classad instead of hunting
across login nodes or looping over jobs.

Run all of this over SSH on the LPC host alias for this project (see the analysis's
`CLAUDE.md`; general SSH/proxy/tmux mechanics are in `lpc-remote-session`).

## Single driver

```bash
condor_q -af Arguments
```

Find the `tcp://<ip>:<port>` inside the `dask_worker` invocation -- that IP is the
scheduler's (and therefore the driver's tmux session's) login node:

```
python -m distributed.cli.dask_worker tcp://131.225.188.242:10058 --nthreads 1 ...
```

Resolve it to a hostname:

```bash
host 131.225.188.242
# -> cmslpc366.fnal.gov
```

## Multiple drivers running at once

Pull all unique scheduler addresses in one shot instead of checking job by job -- each
unique `tcp://` address is a separate driver/scheduler:

```bash
condor_q -af Arguments | grep -oE 'tcp://[0-9.]+:[0-9]+' | sort -u
```

To label which address belongs to which run, pull the log path alongside it
(PocketCoffea's dask log paths usually encode the run name):

```bash
condor_q -af Arguments Out | grep -oE 'tcp://[0-9.]+:[0-9]+|pocketcoffea_dask_logs/[^/]+'
```

## Using the result

Once resolved, `ssh` directly to that hostname (e.g. `ssh cmslpc366.fnal.gov`) and
`tmux attach` to reach the driver's session. A bare hostname needs the username spelled
out (`ssh <lpc-username>@cmslpc366.fnal.gov`), since the alias's `User` mapping doesn't
apply.

## Notes

- This only works while the driver has at least one condor worker currently running --
  if all its workers are idle/unmatched or it hasn't submitted any yet, there's nothing
  in `Arguments` to read.
- `condor_q` without `-name` queries only the default schedd, so an empty result doesn't
  mean the job isn't running -- see the multi-schedd note in `lpc-remote-session` before
  concluding the workers aren't there.
- `condor_userprio`/`condor_status -negotiator` can be flaky or slow when the pool is
  under heavy load -- this doesn't affect `condor_q -af Arguments`, which only hits the
  schedd.
