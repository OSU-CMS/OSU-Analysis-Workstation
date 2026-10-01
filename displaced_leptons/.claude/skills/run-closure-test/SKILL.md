---
name: run-closure-test
description: Producing the closure test results for one channel and sample from finished closure test job output -- merging, running scripts/commands/run_closure_test.py (ABCD sweep ratios, extrapolation fits, tables) and scripts/commands/plot_closure_test.py (histogram and independence-check plots), then transferring everything to plots/closure_test/<channel>/<sample>/. Use whenever a task touches the closure test results, run_closure_test.py, plot_closure_test.py, sweep_table/points_table, or output/*_closure_test_v*.
---

# Closure test results

Goes from finished closure test job output (see `run-analysis-jobs` for producing it,
with `configs/specific/config_<channel>_closure_test.py`) to the closure plots and
tables. Two scripts, both in `scripts/commands/` and both run from the root of the work
area, `/uscms_data/d3/lnestor/displaced_leptons` on the LPC. All paths below are
relative to that unless stated.

| Script | Produces |
|---|---|
| `run_closure_test` | Actual/estimate ratios for the sweep and point regions, the pol1 extrapolation fit and confidence bands, `sweep_table` and `points_table` (`.tex` table body and `.png`), and with `--plot` one extrapolation plot per sweep |
| `plot_closure_test` | One PNG per closure histogram, summed over the requested samples and years, plus `lxy_vs_lxy_independence_check.png` (actual, expected if independent, pull) |

## Environment

Both scripts run outside `./shell`, in the CMSSW environment. `run_closure_test` needs
ROOT from CMSSW for the extrapolation: a pol1 fit to the sweep ratios vs d0, evaluated
at the extrapolation point, with its confidence intervals giving the uncertainty on the
extrapolated ratio and the 1 and 2 sigma bands on the plots.

Run them from the work area root, in the foreground; no grid proxy or tmux is needed:

```bash
ssh fnal-claude "cd /uscms_data/d3/lnestor/CMSSW_15_0_10/src && eval \`scramv1 runtime -sh\` && \
cd /uscms_data/d3/lnestor/displaced_leptons && python3 scripts/commands/<script>.py ..."
```

## 1. Locate the output and merge

Closure output lives in `output/<channel>_closure_test_v<N>[_<sample>]/`, with
`<channel>` one of `ee`, `emu`, `mumu` and an optional `<sample>` suffix, containing
one `output_<dataset>.coffea` per dataset.

1. Find the highest `v<N>` for the requested channel and sample. Report it and ask the
   user to confirm before proceeding; don't assume the highest version is right.
2. If `failed_jobs.json` or `failed_files.csv` exists in the directory, stop, report
   what is listed and ask whether to proceed. Don't resubmit on your own.
3. Merge into `output_all.coffea` with the `merge-coffea` skill.

## 2. Find the sample names

`--samples` takes the sample names exactly as stored in the coffea file. List them with
`inspect_coffea.py`, which needs only bare python (no CMSSW), from the work area root:

```bash
ssh fnal-claude "cd /uscms_data/d3/lnestor/displaced_leptons && \
python3 scripts/commands/inspect_coffea.py output/<dir>/output_all.coffea"
```

It prints the samples with their type and years, the categories and the histogram
names. Add `--datasets` to list the dataset keys, `--hist <name>` for one histogram's
sample/dataset/year tree and axes, or `--json` for machine-readable output.

DY is split into three subsamples, `DY__ee`, `DY__mumu` and `DY__tautau`; there is no
bare `DY` sample. Use every sample listed for the run, space-separated, unless the user
names a subset.

## 3. Run `run_closure_test`

First create a temp directory in the work area's `tmp/` to hold everything from this
run:

```bash
mktemp -d -p tmp/
```

Then, in the environment from the Environment section:

```bash
python3 scripts/commands/run_closure_test.py --<channel> output/<dir>/output_all.coffea \
  --samples <sample1> <sample2> --plot --output-dir <tmpdir> > <tmpdir>/run.log 2>&1
```

- `--years` defaults to all years; pass it only if the user names a subset.
- Give only the requested channel's file; the local layout below is per channel.
- `--samples` takes the space-separated names from step 2.
- Always pass `--plot`; without it the extrapolation plots are not written.
- Always pass `--output-dir` as the temp directory; the default is `plots/closure_test`.

Read the tail of `run.log`. It prints, per channel, the ratio in each d0 bin for both
sweeps, the extrapolated value, the averaged sweep ratio, and the point ratios. A ratio
of `None` means the ABCD estimate or its "a" region was exactly zero, so the ratio is
undefined rather than measured. Report any `None` ratio or `nan` uncertainty to the
user; don't interpret them.

## 4. Run `plot_closure_test`

In the same environment, send its output to the same temp directory so all of the
run's files end up together:

```bash
python3 scripts/commands/plot_closure_test.py output/<dir>/output_all.coffea \
  --samples <sample1> <sample2> --output-dir <tmpdir> > <tmpdir>/plot.log 2>&1
```

- `--samples` must match step 3.
- `--years` defaults to all years; if step 3 was given a subset, pass the same one.
- Always pass `--output-dir` as the temp directory; the default writes into a `plots/`
  directory inside the job output.

## 5. Transfer plots and tables locally

Copy the files to `<dest>` = `plots/closure_test/<channel>/<sample>/` in the local
`displaced_leptons/` directory (`plots/closure_test/<channel>/` if the output directory
has no sample suffix). If `<dest>` already exists and is not empty, ask the user where
to put the files instead.

```bash
mkdir -p <dest>
scp 'fnal-claude:/uscms_data/d3/lnestor/displaced_leptons/<tmpdir>/*' <dest>/
rm <dest>/*.log
```

Once the transfer succeeds, remove the temp directory on the LPC:

```bash
ssh fnal-claude "rm -rf /uscms_data/d3/lnestor/displaced_leptons/<tmpdir>"
```
