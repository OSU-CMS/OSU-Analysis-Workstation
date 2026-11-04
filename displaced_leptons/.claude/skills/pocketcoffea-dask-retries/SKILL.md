---
name: pocketcoffea-dask-retries
description: How file/chunk retries and skip-bad-files interact in PocketCoffea's dask executor on the LPC. Use when debugging unexpected skipped files, files skipped without ever being retried, or tuning the "retries" run option for run_lpc.py / lib/workflow/runner.py.
---

# Retries and skip-bad-files in the dask executor

There are two separate, non-composing retry layers, plus a per-file
skip-and-record mechanism this analysis added on top. Mixing them up is easy
and was the source of a real bug (fixed, see below).

## The two layers

1. **`DaskExecutor.retries`** (`../ref/coffea/coffea/processor/executor.py`,
   `DaskExecutor` dataclass, default 3): passed straight to
   `client.map(..., retries=...)`. This is dask's own task-resubmission
   mechanism -- if a submitted task raises all the way out, dask resubmits
   the *whole task* (possibly on a different worker) up to this many times.
   In this analysis it's set from `run_options["retries"]`
   (`lib/workflow/executors_lpc.py:347`).

2. **`Runner.retries`** (`../ref/coffea/coffea/processor/executor.py:1481-1488`):
   used by `automatic_retries`, a plain Python while-loop wrapped *around*
   the per-chunk work function -- i.e. it runs *inside* a single dask task,
   retrying in-process (same worker, e.g. re-opening the xrootd connection)
   before the task function ever returns or raises. Coffea's base
   implementation hardcodes this to `0` whenever the executor is a
   `DaskExecutor`, regardless of what `retries` you configure -- the
   intent being "let dask's own resubmission (layer 1) handle it instead."

These two layers don't compose the way you'd hope. `DaskExecutor` merges all
per-chunk futures through a tree-reduction into one combined future
(`DaskExecutor.__call__`) and calls `.result()` on it once. If a task
exhausts layer 1's retries and still raises, that exception surfaces at
`.result()` and kills **the entire dataset's processing**, not just that one
file/chunk -- there's no per-file granularity at the dask-resubmission layer.
`run_lpc.py` catches this with a `try/except` around `coffea_runner(...)`
and marks the whole dataset as failed (see `update_failed_jobs`), clearing
any prior per-file `failed_files.csv` entries for it.

## The per-file skip/record layer (this analysis's addition)

`lib/workflow/runner.py` overrides `automatic_retries` on a custom `Runner`
subclass so that instead of coffea's default (just `warnings.warn()` and
drop the chunk with nothing retrievable), a skipped file is recorded as a
`(dataset, filename, traceback)` tuple in a `"skipped_files"` accumulator.
That accumulator rides through the same map-reduce tree as the real output,
so it needs no separate channel; `Runner.run()` pulls it out into
`self.failed_files`, and `run_lpc.py` writes that to `failed_files.csv` for
later `--resubmit-failed`.

Because this per-file skip only fires within layer 2 (`automatic_retries`,
in-process, one dask task), and layer 2 was always forced to `retries=0`
for the dask executor, files were being skipped and recorded on the very
first failure -- before dask's own resubmission (layer 1) ever got a
chance, and before any real "give it a second attempt" retry happened at
all. Turning on `--skip-bad-files` didn't just handle *permanently* bad
files; it silently ate every *transient* failure too.

## The bug (fixed in `lib/workflow/runner.py`)

Two separate issues stacked:

- `Runner.retries` was inherited unchanged from coffea, forcing `0` for the
  dask executor no matter what `run_options["retries"]` was set to.
- Independent of that, the `OSError`/`UprootMissTreeError` branch in
  `automatic_retries` skipped unconditionally on the *first* matching
  exception -- no `retries == retry_count` gate at all. (The very next
  branch, for specific transient message strings like "Socket timeout",
  *does* gate on `retries == retry_count` -- this asymmetry is what to
  compare against if this logic gets touched again.)

Fix applied:
- `Runner.retries` overridden to just return `self.executor.retries`
  (no more dask special-case).
- The `OSError`/`UprootMissTreeError` branch now also gates on
  `retries == retry_count`, so it only skips-and-records once all in-process
  attempts are exhausted.
- `run_lpc.py` sets `run_options["retries"] = 5` (previously implicitly 0
  for dask regardless of the general default of 10, because of the bug
  above).

Since `run_options["retries"]` feeds both layers (`executors_lpc.py:347`
sets `DaskExecutor.retries` from it, and `Runner.retries` now reads it back
off the executor), one knob now controls both: up to 5 in-process retries
per chunk for read errors, and dask-level task resubmission (up to 5) for
failures that still propagate (e.g. a worker dying mid-task).

## If you need to tune this further

- Raising `retries` gives transient xrootd errors more chances but adds
  latency per permanently-bad file (each failed attempt still has to time
  out/fail before the next attempt starts -- there's no backoff/sleep
  between in-process attempts).
- If retries ever need to differ from `DaskExecutor`'s dask-resubmission
  count, `Runner.retries` and `run_options["retries"]`/`DaskExecutor.retries`
  would need to be decoupled again (e.g. a separate run option read directly
  in the `Runner.retries` override) instead of sharing one value.
- `"Auth failed"` in the exception chain always raises immediately,
  regardless of `retries` or `skipbadfiles` -- not retried, not skipped.
