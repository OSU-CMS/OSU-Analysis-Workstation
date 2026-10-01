---
name: d0-correction
description: Computing the d0 correction for MC -- from finished analysis job coffea output, through merging, fitting, and the final correction file and plots. Use whenever a task touches the d0 correction, output/*_d0_correction_v*, or merging d0 correction coffea outputs.
---

# d0 correction calculation

Goes from finished analysis job output (one coffea output set per channel: `emu`,
`mumu`, `ee`) to the final correction file and fit plots. All three channels are needed for
the full calculation, but a partial calculation with only some channels present is
fine too.

This all happens in the `displaced_leptons` project on the FNAL LPC, at
`/uscms_data/d3/lnestor/displaced_leptons`. All file paths below are relative to that.

## 1. Locate outputs and merge

Each channel's job output lives in `output/{channel}_d0_correction_v<N>/`, containing
many `output_{sample}.coffea` files (one per sample) that need to be merged into one.

1. For each of `emu`, `mumu`, `ee`, find the highest version directory
   `output/{channel}_d0_correction_v<N>/` that exists.
2. Report the highest N found for each channel and ask the user to confirm it's the
   right one before proceeding -- don't just assume the highest version is correct.
3. Note any channel with no `output/{channel}_d0_correction_v*` directory at all. If not
   all three channels are present, tell the user and confirm whether to proceed with a
   partial calculation using just the available channels.
4. Before merging, check each confirmed channel directory for any indication of job
   failures (e.g. an `error/` directory, `failed_jobs.json`, etc.). If you see any such
   indication, stop and tell the user what you found and ask what to do -- don't start
   investigating it yourself. These could be stale files left over from a previous run.
5. For each confirmed channel directory, merge its `output_*.coffea` files into
   `output_all.coffea` using the [[merge-coffea]] skill.

## 2. Run the fit

`scripts/commands/calc_d0_correction.py` fits the data and MC d0 distributions for each
year with a double gaussian and builds the d0 correction from the fits. It writes
`d0_correction_fit<B>.json.gz` (a correctionlib file with `electron_d0_correction_<year>` and
`muon_d0_correction_<year>` for each year) plus fit plots (`combined_distributions_*.png`,
`single_data_*.png`, `single_mc_*.png`) to `--output-dir`. Pass one flag per available
channel, pointing at that channel's `output_all.coffea` from step 1. `--emu` is always
required, along with at least one of `--ee` or `--mumu`; the electron corrections use
`--ee` and the muon corrections use `--mumu`:

First, on the LPC, create a fresh temporary directory to hold this run's plots:

```bash
mktemp -d
```

Then run the fit, passing that temp directory as `--output-dir`:

```bash
python3 scripts/commands/calc_d0_correction.py --ee output/ee_d0_correction_v<N>/output_all.coffea --mumu output/mumu_d0_correction_v<N>/output_all.coffea --emu output/emu_d0_correction_v<N>/output_all.coffea --fit-bounds <B> --output-dir <tmpdir>
```

- `--fit-bounds <B>` sets the fit range to (-B, B); it defaults to (-80, 80) if
  omitted. Always ask the user what bounds to use before running -- never assume the
  default or reuse a previous value without asking.
- The fit takes up to ~20 seconds to run; that's normal, not a hang.

## 3. Transfer plots and correction file locally

Copy everything from the temp directory on the LPC back to this local project, via
scp, into `plots/d0_correction/v<N>` (relative to the local `displaced_leptons/` directory of
this workspace, not the LPC). Transfer everything in the temp directory.

- Use the same N as the channel output version(s) used in step 2. If the channels used
  in step 2 didn't all share the same version number, ask the user what N to use for
  the plots directory instead of guessing.
- If `plots/d0_correction/v<N>` already exists locally, don't write into it -- ask the
  user where to place the new plots instead.
- Otherwise, create `plots/d0_correction/v<N>` and scp all files from
  `fnal-claude:<tmpdir>/` (the directory created in step 2) into it.
- Once the scp succeeds, remove the temp directory on the LPC (`rm -rf <tmpdir>`).

## 4. Summarize

`scripts/commands/calc_d0_correction.py` prints nothing on success. At the end, present
to the user:

- The fit bounds used.
- The local path where the plots and `d0_correction_fit<B>.json.gz` were stored
  (`plots/d0_correction/v<N>` from step 3).
