---
name: d0-smearing
description: Computing the d0 smearing correction for MC -- from finished analysis job coffea output, through merging, fitting, and final plots/tables. Use whenever a task touches d0 smearing, output/*_d0_smearing_v*, or merging d0 smearing coffea outputs.
---

# d0 smearing calculation

Goes from finished analysis job output (one coffea output set per channel: `emu`,
`mumu`, `ee`) to final smearing plots and tables. All three channels are needed for
the full calculation, but a partial calculation with only some channels present is
fine too.

This all happens in the `displaced_leptons` project on the FNAL LPC, at
`/uscms_data/d3/lnestor/displaced_leptons`. All file paths below are relative to that.

## 1. Locate outputs and merge

Each channel's job output lives in `output/{channel}_d0_smearing_v<N>/`, containing
many `output_{sample}.coffea` files (one per sample) that need to be merged into one.

1. For each of `emu`, `mumu`, `ee`, find the highest version directory
   `output/{channel}_d0_smearing_v<N>/` that exists.
2. Report the highest N found for each channel and ask the user to confirm it's the
   right one before proceeding -- don't just assume the highest version is correct.
3. Note any channel with no `output/{channel}_d0_smearing_v*` directory at all. If not
   all three channels are present, tell the user and confirm whether to proceed with a
   partial calculation using just the available channels.
4. Before merging, check each confirmed channel directory for any indication of job
   failures (e.g. an `error/` directory, `failed_jobs.json`, etc.). If you see any such
   indication, stop and tell the user what you found and ask what to do -- don't start
   investigating it yourself. These could be stale files left over from a previous run.
5. For each confirmed channel directory, merge its `output_*.coffea` files into
   `output_all.coffea` using the [[merge-coffea]] skill.

## 2. Run the fit

`scripts/calc_d0_smear_value.py` fits the merged coffea outputs and computes the
smearing sigma. Pass one flag per available channel, pointing at that channel's
`output_all.coffea` from step 1 -- only pass flags for channels that are actually
present for a partial calculation:

First, on the LPC, create a fresh temporary directory to hold this run's plots:

```bash
mktemp -d
```

Then run the fit, always passing `--plot`, `--latex`, and passing that temp directory
as `--output-dir`:

```bash
python3 scripts/calc_d0_smear_value.py --ee output/ee_d0_smearing_v<N>/output_all.coffea --mumu output/mumu_d0_smearing_v<N>/output_all.coffea --emu output/emu_d0_smearing_v<N>/output_all.coffea --fit-bounds <B> --plot --latex --output-dir <tmpdir>
```

- `--fit-bounds <B>` sets the fit range to (-B, B); it defaults to (-20, 20) if
  omitted. Always ask the user what bounds to use before running -- never assume the
  default or reuse a previous value without asking.
- The fit takes up to ~20 seconds to run; that's normal, not a hang.

## 3. Transfer plots and tables locally

Copy everything from the temp directory on the LPC back to this local project, via
scp, into `plots/d0_smearing/v<N>` (relative to the local `displaced_leptons/` directory of
this workspace, not the LPC). With `--latex` passed in step 2, the temp directory holds both the plot
PNGs and, per table, a `.tex` source and rendered `.png` -- transfer all of it.

- Use the same N as the channel output version(s) used in step 2. If the channels used
  in step 2 didn't all share the same version number, ask the user what N to use for
  the plots directory instead of guessing.
- If `plots/d0_smearing/v<N>` already exists locally, don't write into it -- ask the
  user where to place the new plots instead.
- Otherwise, create `plots/d0_smearing/v<N>` and scp all files from
  `fnal-claude:<tmpdir>/` (the directory created in step 2) into it.
- Once the scp succeeds, remove the temp directory on the LPC (`rm -rf <tmpdir>`).

## 4. Summarize

`scripts/calc_d0_smear_value.py` prints several tables; the last one holds the actual
smearing values. At the end, present to the user:

- That last table, with the actual smearing values.
- The local path where the plots and tables were stored (`plots/d0_smearing/v<N>` from
  step 3).
