---
name: supplement-transfer
description: Manually transferring finished CRAB supplement job output from EOS into /store/user/lnestor/supplements. Use whenever a task touches supplement output transfer, check_crab_jobs.py, or moving CRAB supplement job output on EOS.
---

# Transferring supplement output files

Supplement CRAB jobs write their output to EOS under the raw CRAB output path. Once a
task finishes, its output needs to be moved into `/store/user/lnestor/supplements/<name>`
where the rest of the analysis expects to find it. `check_crab_jobs.py` (in
`SupplementCreation/scripts/`) automates this; the steps below are what it does, for
doing it by hand.

## 1. Determine the destination name

The destination name is derived from the crab project directory name: strip the leading
`crab_` prefix and the trailing `_supplement_v<N>` suffix.

```
crab_projects/crab_DYto2L-4Jets_MLL-50_2022postEE_supplement_v1
  -> DYto2L-4Jets_MLL-50_2022postEE
```

Destination: `/store/user/lnestor/supplements/DYto2L-4Jets_MLL-50_2022postEE`

## 2. Get the source directory

Run `crab getoutput --dump` (see the lpc-crab skill) to get the LFN of the task's output
files, and take the parent directory. There should only be a `0000/` subdirectory -- if
there's also a `0001/`, the task has 1000 or more jobs and needs to be handled manually
rather than following this simple move (see lpc-crab's Retrieving output section).

## 3. Check the destination

Check whether `/store/user/lnestor/supplements/<name>` already exists (see lpc-eos). If
it does, always ask before deleting it.

```bash
eos root://cmseos.fnal.gov/ ls /store/user/lnestor/supplements/<name>
```

If confirmed, remove it:

```bash
eos root://cmseos.fnal.gov/ rm -r /store/user/lnestor/supplements/<name>
```

## 4. Move

```bash
eos root://cmseos.fnal.gov/ mv <source 0000/ dir> /store/user/lnestor/supplements/<name>
```

## 5. Cleanup

- Remove the local crab project directory: `crab_projects/crab_<requestName>`
- Remove the now-empty EOS parent directory chain left behind above `0000/`:
  `<outLFNDirBase>/<outputDatasetTag>/<timestamp>/`

```bash
eos root://cmseos.fnal.gov/ rm -r <outLFNDirBase>/<outputDatasetTag>/<timestamp>
```
