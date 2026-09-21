---
name: bug-missing-supplement-json
description: A PocketCoffea dask-on-condor job fails inside load_metadata_extra() with FileNotFoundError opening a supplement JSON (e.g. "No such file or directory: 'MuonEG.json'"). Also worth checking any time a bug has resisted debugging for a long time in this analysis, since the real cause here was hidden behind a completely unrelated-looking error message.
---

# Bug: misleading "missing supplement JSON" error

## Symptom

A dask/condor chunk fails inside `load_metadata_extra()`:

```
FileNotFoundError: [Errno 2] No such file or directory: 'MuonEG.json'
```

This looked exactly like a condor/dask environment problem. It reproduced
100% of the time, across many separate `--test` runs over several hours, on
every sample tried. It was **not** condor flakiness, and treating it as an
infra problem wasted a lot of time before the real cause was found.

## Actual root cause

The error message is a red herring. The real bug is a `KeyError:
'primaryDataset'` raised inside `skim()`, in
`pocket_coffea/lib/triggers.py`'s `get_trigger_mask_byprimarydataset`, when
`get_default_skim_cuts()` is called with no `sample` argument. That no-arg
path (used for data) reads `events.metadata["primaryDataset"]`, a metadata
key this analysis's dataset JSONs never populated (only `sample`).

Why the visible error looks unrelated: `skim()` runs *after*
`load_metadata_extra()` in `process()`, so the `KeyError` can't be what's
crashing the chunk whose traceback you're looking at. What actually happens:
one chunk of a dataset key hits the real `KeyError` and fails outright (no
retry -- `automatic_retries` in coffea reraises immediately). `dask`'s
gather cancels sibling in-flight futures for that same dataset-key batch,
tearing down whichever *other* chunk happens to be mid-flight (commonly
still inside its own `load_metadata_extra()`). `pocket_coffea`'s
`try_and_log_error` writes only one `.err` file per dataset key, in
overwrite mode -- so the file you actually see almost always shows the
collateral chunk's incidental `FileNotFoundError`, not the real `KeyError`.
Checked every `.err` file across many runs; the real `KeyError` was never
once the one that survived to be visible.

## Fix

Data-sample dataset JSON metadata needs a `primaryDataset` key (this
analysis groups split streams like `Muon0`/`Muon1` or `EGamma0`/`EGamma1`
under one `sample`, but they share the same HLT paths, so `primaryDataset =
sample` is correct here):

- `scripts/datasets/create_dataset_definition.py`: set
  `metadata["primaryDataset"] = d.sample` alongside `metadata["era"]` in the
  data (`else`) branch.
- Backfill existing `datasets/central/*.json` files: for every entry with
  `metadata.isMC == "False"` missing `primaryDataset`, set it to
  `metadata["sample"]`.

## How this was actually found

Bisecting the *config* (not the processor -- swapping in the always-working
processor with the failing config's dataset/sample settings still
reproduced the crash, which ruled out the processor entirely) from a known
-working config, one field at a time, isolated `skim` as the trigger. From
there, reading `get_default_skim_cuts()`'s no-arg branch led to
`get_trigger_mask_byprimarydataset` and the missing key.
