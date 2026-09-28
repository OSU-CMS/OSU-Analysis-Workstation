---
name: dataset-handling
description: Creating and maintaining PocketCoffea dataset/supplement definition JSONs for the displaced leptons analysis -- the central NanoAOD file-list definitions and the supplement file mappings (central or skim-based), both generated from datasets/sources/datasets.yaml. Use whenever a task touches datasets.yaml, create_dataset_definition.py, create_supplement_definition.py, datasets/central, datasets/supplements, or datasets/skim_supplements.
---

# Dataset handling

PocketCoffea expects "dataset definition" JSON files -- metadata plus a file list -- as
input to a run. PocketCoffea ships its own tooling to build these from DAS, but it
didn't work well for this analysis, so a custom setup replaces it:

- `datasets/sources/datasets.yaml` -- single source of truth catalog of every dataset
  (data era/version and MC process) this analysis uses.
- `scripts/datasets/catalog.py` -- loads/filters `datasets.yaml` into `DatasetDefinition`
  objects, and is where the version/index-aware key scheme lives.
- `scripts/datasets/create_dataset_definition.py` -- replacement for PocketCoffea's
  built-in dataset definition tooling; queries DAS for each catalog entry's central
  NanoAOD file list, writing `datasets/central/<sample>.json`.
- `scripts/datasets/create_supplement_definition.py` -- matches each catalog entry's
  supplement ROOT files (on EOS) to central NanoAOD files by (run, lumi), writing
  `datasets/supplements/<sample>.json`. With `--skim-channel`, matches against a
  channel's skim files instead, writing `datasets/skim_supplements/<channel>/<sample>.json`
  -- see the skim-manager skill for why this exists.

## The catalog (`datasets/sources/datasets.yaml`)

A flat YAML list, one entry per physical dataset. Each entry becomes a
`DatasetDefinition` (`scripts/datasets/catalog.py`):

```yaml
- sample: Muon
  miniaod: /Muon0/Run2023C-22Sep2023_v1-v1/MINIAOD
  nanoaod: /Muon0/Run2023C-22Sep2023_v1-v1/NANOAOD
  year: 2023_preBPix
  era: C
  supplements_path: /store/user/lnestor/supplements/Muon0_Run2023C_v1
  is_mc: false
  index: 0
  version: 1
```

Required fields: `sample`, `miniaod`, `nanoaod`, `year`, `supplements_path`, `is_mc`.
Optional: `cross_section` (MC only), `era`/`index`/`version` (data only).

- `sample` -- the grouping name used for output filenames (`datasets/central/<sample>.json`).
  Data samples: `Muon`, `MuonEG`, `EGamma`, `MET`. MC samples: `DY`, `TTbar`,
  `SingleTop`, `Diboson`, `QCDEle`, `QCDMu`.
- `miniaod` / `nanoaod` -- the DAS dataset names for the same processing, MiniAOD (input
  to supplement production) and NanoAOD (input to the analysis) respectively.
- `era` -- data run era letter (`C`, `D`, ...).
- `index` -- which split primary dataset within an era, e.g. `Muon0` vs `Muon1`,
  `EGamma0` vs `EGamma1` (CMS sometimes splits a run's data across multiple primary
  datasets by trigger stream).
- `version` -- distinguishes multiple genuinely different datasets covering the same
  era/index. What this maps to in the DAS name depends on the naming convention, and
  differs by year:
  - Non-2025: the processing string has an embedded `_v<N>` before the trailing
    `-v<N>`, e.g. `Run2023C-22Sep2023_v1-v1` vs `Run2023C-22Sep2023_v2-v1`. The
    embedded `_v<N>` is what `version` tracks -- it marks a genuinely distinct dataset.
    The trailing `-v<N>` is DAS's own reprocessing-version suffix; a bump there (e.g.
    `-v1` to `-v2`) means the same dataset was reprocessed, not that it's a new one --
    that case just updates the `miniaod`/`nanoaod` DAS name in place, same `version`.
  - 2025: no embedded `_v<N>` (these are PromptReco datasets), so the trailing
    `-v<N>` is what `version` tracks instead, e.g. `Run2025C-PromptReco-v1` vs
    `Run2025C-PromptReco-v2` are distinct catalog entries with `version: 1` and
    `version: 2`.

`DatasetDefinition.key` is built from these fields:

- MC: `<short-name>_<year>`, where `<short-name>` is the first path component of
  `nanoaod` (e.g. `TTto2L2Nu_2022_preEE`).
- Data: `<sample>_<year>_Era<era>[_index<index>][_version<version>]`, e.g.
  `Muon_2023_preBPix_EraC_index0_version1`. `index`/`version` are only appended when set,
  so they're omitted for eras that were never split or reprocessed.

`DatasetCatalog(path).get(sample=, year=, era=, is_mc=)` filters entries by any of
these fields; each filter accepts a single value or a list of values.

## Adding a new dataset end-to-end

Run these on the LPC.

1. **Find the dataset on DAS.** Get the `miniaod` and `nanoaod` DAS names, and for data
   work out `era`/`index`/`version` from the naming convention (see the catalog section
   above).

2. **If it's MC, ask the user for the cross section.** It has to be set in the catalog
   entry before running `create_dataset_definition.py` -- it isn't something DAS can
   provide, and the script writes whatever `cross_section` is in the catalog straight
   into the dataset JSON's metadata.

3. **Add an entry to `datasets/sources/datasets.yaml`.** Include `supplements_path` even
   though nothing exists there yet -- it's the EOS destination supplement production will
   eventually write to.

4. **Build the central definition.**

   ```bash
   python3 scripts/datasets/create_dataset_definition.py --samples <sample> --years <year>
   ```

   Writes/updates `datasets/central/<sample>.json`.

5. **Build the supplement definition**, once supplement files for this dataset exist on
   EOS at `supplements_path`:

   ```bash
   python3 scripts/datasets/create_supplement_definition.py --samples <sample> --years <year>
   ```

   Writes/updates `datasets/supplements/<sample>.json`.

## `create_dataset_definition.py` reference

Builds the central NanoAOD dataset JSON(s) by querying DAS.

```bash
python3 scripts/datasets/create_dataset_definition.py \
    --samples <sample> [<sample> ...] \
    --years <year> [<year> ...] \
    [--definition-path datasets/sources/datasets.yaml] \
    [--output-dir datasets/central] \
    [--overwrite] \
    [--redirector root://cmsxrootd.fnal.gov/]
```

- `--samples`/`--years` filter the catalog (`DatasetCatalog.get`); omit either to match
  everything.
- For each matched catalog entry, writes/updates `<output-dir>/<sample>.json`, keyed by
  `DatasetDefinition.key`.
- **Skip-if-exists by default**: if a key already exists in the sample's JSON, it's left
  untouched and a message is printed -- pass `--overwrite` to replace it.
- For each entry actually processed, queries `dasgoclient` twice: `summary dataset=<nanoaod>`
  (for `nevents`/`size`) and `file dataset=<nanoaod>` (for the file list, each name
  prefixed with `--redirector`). Requires a valid `kinit` ticket on the LPC.
- Writes the result to disk immediately after each entry (not batched at the end), so an
  interrupted run doesn't lose progress on entries already completed.
- Metadata written per key: `das_names`, `sample`, `year`, `isMC`, `nevents`, `size`, plus
  `xsec` for MC or `era` for data. All values are stringified.

## `create_supplement_definition.py` reference

Matches supplement ROOT files on EOS to central NanoAOD files by (run, lumi).

```bash
python3 scripts/datasets/create_supplement_definition.py \
    --samples <sample> [<sample> ...] \
    --years <year> [<year> ...] \
    --eras <era> [<era> ...] \
    [--definition-path datasets/sources/datasets.yaml] \
    [--output-dir datasets/supplements] \
    [--skim-channel <channel>] \
    [--overwrite | --append]
```

- `--samples`/`--years`/`--eras` filter the catalog, same as above
- Matches supplement ROOT files to the other side's files using (run, lumi) keys read
  directly out of each file with `uproot` -- for supplement files always, and for the
  central/skim side too when in skim mode (see below).
- Without `--skim-channel`: the other side is central NanoAOD, discovered via a
  `dasgoclient` query (`file,lumi dataset=<nanoaod> run=<run>`) restricted to whatever
  runs the supplement files actually cover, since central NanoAOD is a registered DAS
  dataset. Output: `datasets/supplements/<sample>.json`.
- With `--skim-channel <channel>`: the other side is that channel's skim files instead.
  Skim files aren't registered in DAS, so there's no query to make -- the file list comes
  straight from the already-built `datasets/skims/<channel>/<sample>.json`, and each file
  is opened directly (`Events` tree) to read its own (run, lumi) content. A dataset is
  skipped if that channel's skim dataset definition doesn't have its key yet. Output:
  `datasets/skim_supplements/<channel>/<sample>.json`.
- Write-conflict handling is **stricter than `create_dataset_definition.py`**: if a key
  already exists in the output JSON, the script errors out and exits unless `--overwrite`
  (replace) or `--append` (merge, e.g. adding `EGamma1` files into an existing `EGamma0`
  entry) is given.
- Metadata written per key: `dataset` (the `nanoaod` DAS name -- same value in skim mode,
  since `create_skim_dataset_definition.py` copies it from central metadata unchanged),
  `sample`, `year`, `version`, and `era` if set. `files` maps each central-or-skim LFN to
  a list of `root://cmseos.fnal.gov/...` supplement file paths.

## How the outputs get consumed

`configs/common.py` globs both output directories for use in a PocketCoffea config:
`get_datasets("central")` -> `datasets/central/*.json` (the `"jsons"` list), and
`get_supplements()` -> `datasets/supplements/*.json` (`cfg.supplements`).

The two JSONs are **not** joined at runtime by their outer keys, even though both are
keyed with the same `DatasetDefinition.key` scheme by convention:

- **Central JSON keys are functionally meaningful.** They become PocketCoffea's fileset
  keys, which is what `--filter-datasets` (a comma-separated list) matches against when
  selecting which datasets to run.
- **Supplement JSON keys are not read at runtime.** `workflow.py`'s
  `load_metadata_extra` finds the right supplement entry by comparing
  `metadata["dataset"]` (the DAS name) against the central chunk's `das_names`
  metadata, then indexes `files` by the central LFN directly.

`datasets/skim_supplements/<channel>/*.json` isn't wired into any config yet --
a skim-based config needs to point `supplements` at it explicitly (e.g.
`get_supplements("skim_supplements/emu")`) instead of the central supplements dir.

## Gotchas

- The two scripts differ in default write-conflict behavior: `create_dataset_definition.py`
  silently skips an existing key (needs `--overwrite`), while
  `create_supplement_definition.py` errors out on one (needs `--overwrite` or `--append`).
