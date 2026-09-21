---
name: merge-coffea
description: Merging per-dataset coffea outputs from PocketCoffea --process-separately (-ps) runs into a single output_all.coffea. Use whenever a task touches merging coffea outputs, output_all.coffea, scripts/merge_coffea.py, or combining output_*.coffea files.
---

# Merging coffea outputs

PocketCoffea's `--process-separately` (`-ps`) flag saves one `output_{dataset_or_group}.coffea`
file per dataset/group instead of a single `output_all.coffea`. This lets you inspect
or plot partial results while jobs are still running, but the per-dataset files need
to be merged into one before running any calculation/plotting script that expects a
single output file.

This happens in the `displaced_leptons` project on the FNAL LPC, at
`/uscms_data/d3/lnestor/displaced_leptons`. `scripts/merge_coffea.py` runs with plain
system `python3` -- coffea is installed in user packages there, no apptainer shell or
special environment needed.

## Merging

```bash
python3 scripts/merge_coffea.py <output_dir>/output_*.coffea -o <output_dir>/output_all.coffea
```

- Input arguments accept glob patterns (expanded and de-duplicated internally).
- Always name the merged file `output_all.coffea`
- The script accumulates raw coffea output with `coffea.processor.accumulate`; no
  postprocessing is applied at merge time.

### Safe to rerun

If `output_all.coffea` already exists in the target directory and gets picked up by
the input glob (e.g. re-merging to pick up newly finished jobs), the script detects
this and skips it automatically, printing a note. It's safe to rerun the same merge
command repeatedly as more per-dataset outputs land -- it never double-counts a
previous merge.

## After merging

Load the merged file and report which datasets are present, so a job that produced an
empty or malformed output doesn't silently pass through:

```python
from coffea.util import load
out = load("<output_dir>/output_all.coffea")
print(sorted(out["datasets_metadata"]["by_dataset"].keys()))
```

Compare against the datasets/groups expected for the run and flag any that are
missing.
