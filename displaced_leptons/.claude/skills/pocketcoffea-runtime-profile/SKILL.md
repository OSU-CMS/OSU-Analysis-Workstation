---
name: pocketcoffea-runtime-profile
description: Profile a PocketCoffea job to find CPU/runtime hot spots in this analysis's own code (workflow.py, object_selection.py, event_selection.py, lib/, configs/), not framework internals. Use when asked to profile a job, find what's slow, or investigate long runtimes. The upstream doc (pocketcoffea.readthedocs.io/en/stable/performance.html) assumes a runner script and executor this analysis's CLI doesn't expose -- this skill documents the corrected procedure, verified end-to-end on 2026-09-15.
---

# Profiling PocketCoffea runtime in this analysis

## Procedure

### 1. Pick what to profile

The user supplies the config file (`configs/config_mumu.py`, `config_ee.py`,
...) and a sample (e.g. `DY`). From that, resolve one specific dataset to
scope to -- `pocket-coffea run --test` loops over *every* dataset matching
your filters, doing real preprocessing (metadata/xrootd lookups) for each one
before running chunks, so left scoped only to `--filter-samples`, a run can
spend most of its wall time opening files across datasets/years you don't
care about (a sample groups every year/subsample sharing that `sample`
metadata value).

This analysis's dataset JSONs are named after the sample and keyed by exact
dataset name: `datasets/central/<Sample>.json` is a dict whose top-level keys
are the dataset names for that sample (e.g. `datasets/central/DY.json` has
keys like `DYto2L-4Jets_MLL-50_TuneCP5_13p6TeV_madgraphMLM-pythia8_2022_preEE`).
Read that file and pick any one key -- which one doesn't matter, since `-lf`
below caps how many files actually get read regardless of the dataset's real
size. Pass it as `--filter-datasets <that_key>`.

### 2. Run cProfile inside the container

Resolve `<resolved-proxy-path>` first with `lpc-remote-session`'s check-never-create
sequence; never create or refresh the proxy yourself. Run from the repo root (`/srv`)
and invoke `pocket_coffea` as a module so
`python -m cProfile` can wrap it:

```bash
ssh fnal-claude "cd /uscms_data/d3/lnestor/displaced_leptons && \
  export APPTAINER_BINDPATH=/uscmst1b_scratch,/cvmfs,/cvmfs/grid.cern.ch/etc/grid-security:/etc/grid-security,/etc/condor/config.d/01_cmslpc_interactive,/usr/local/bin/cmslpc-local-conf.py:/usr/local/bin/cmslpc-local-conf.py.orig,.cmslpc-local-conf:/usr/local/bin/cmslpc-local-conf.py && \
  apptainer exec -B \$(pwd):/srv -B /uscms/home/lnestor --pwd /srv \
    /cvmfs/unpacked.cern.ch/gitlab-registry.cern.ch/cms-analysis/general/pocketcoffea:lxplus-el9-latest \
    /bin/bash -c 'source /srv/.bashrc >/tmp/bashrc.log 2>&1; \
      export X509_USER_PROXY=<resolved-proxy-path>; \
      cd /srv && mkdir -p tmp/profiling/<label> && \
      python -m cProfile -o tmp/profiling/<label>/output.prof \
        -m pocket_coffea run --cfg configs/<config>.py \
        -o tmp/profiling/<label>/out --test -lf 2 -lc 10 \
        --filter-datasets <exact_dataset_name> --skip-bad-files'"
```

`--test` defaults to `-lf 2 -lc 2`; raise `-lc` to 10 as above so there's
enough per-chunk work in the profile.

### 3. Pull the profile back

```bash
mkdir -p /home/lnestor/projects/analysis/displaced_leptons/tmp/profiling/<label>
scp fnal-claude:/uscms_data/d3/lnestor/displaced_leptons/tmp/profiling/<label>/output.prof \
  /home/lnestor/projects/analysis/displaced_leptons/tmp/profiling/<label>/output.prof
```

(`displaced_leptons/tmp/` per this workspace's convention for anything temporary.)

### 4. Analyze with pstats -- do this yourself, don't just hand the file back

Filter to this repo's own code using the `/srv/` absolute path prefix (how
the container sees the repo root) rather than a hardcoded filename list --
it automatically covers every file in the repo (configs/, lib/, workflow.py,
...) with no maintenance burden. Exclude `/srv/.env/` (the venv's editable
install shim lives under the repo too and shows up as noise otherwise).

```python
import pstats

p = pstats.Stats("tmp/profiling/<label>/output.prof")

repo_filter = r"^/srv/(?!\.env/)"

print("=== Repo code, by cumulative time ===")
p.sort_stats("cumulative").print_stats(repo_filter, 20)

print("=== Repo code, by self (tottime) ===")
p.sort_stats("tottime").print_stats(repo_filter, 20)

print("=== Unrestricted top cumtime, for context ===")
p.strip_dirs().sort_stats("cumulative").print_stats(15)
```

Gotcha confirmed during testing: `print_stats(marker1, marker2, ...)` with
**multiple separate string arguments ANDs the restrictions together**, not
ORs -- passing a list of filenames that way silently matches nothing. Use one
combined regex string (as above) instead of multiple positional args if you
need to match several files/patterns.

Read both cumtime and tottime tables:
- **tottime** (self time, excludes sub-calls) points at the actual hot loop
  -- a function with high tottime is where cycles are actually being spent,
  not just passing through to something else.
- **cumtime** on a function called once per run (e.g. one-time config/setup
  code) can look artificially large next to a per-chunk function called only
  `-lc` times in a short test -- don't rank purely by cumtime without
  checking `ncalls`.
- The unrestricted top-cumtime table is a sanity check: if the top of *that*
  list is still framework/import machinery even after scoping to
  `-lc 10`, evaluate raising `-lc`/`-lf` further before trusting the
  breakdown.

### 5. Report worst offenders

Summarize, don't just dump tables: name the top 3-5 repo functions by
tottime with `file:line`, their `ncalls`/`percall`, and cumtime for the
heavier ones, plus a one-line read on why (e.g. "supplement join
(`process_extra_after_skim`) dominates at N s/chunk -- look at the
join implementation in `lib/awkward_helper.py` for the actual bottleneck
inside it, since one call site can wrap a lot of eager array work").
