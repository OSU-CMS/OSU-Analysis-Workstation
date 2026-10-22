---
name: supplement-creation
description: Creating supplement files for the displaced leptons analysis on the FNAL LPC -- generating CRAB configs from the dataset definitions with create_crab_configs.py, the per-channel supplement psets, submitting, and getting finished output onto EOS (check_crab_jobs.py). Use whenever a task touches supplement production, SupplementCreation, create_crab_configs.py, SupplementTreeAnalyzer, supplement_*_cfg.py, or datasets_full.yaml.
---

# Creating supplement files

A supplement file carries variables that central NanoAOD lacks (muon/electron isolation,
muon time, `Muon_dxybsErr`, in-material vertices, beamspot x/y, and for MC the gen
production vertex). It is produced from the central MiniAOD with a CMSSW analyzer run
through CRAB, then matched to central NanoAOD files by (run, lumi) at analysis time.

All of this happens on the LPC, in the uncommitted working tree below. The local `ref/`
clones are not the source of truth -- the LPC copy has changes that were never committed.

## Where things live

`/uscms_data/d3/lnestor/CMSSW_15_0_10/src/DisplacedLeptonsSupplement/SupplementCreation/`
(local sshfs mount: `mnt/lpc-supplement-cmssw-15/`).

| Path | What it is |
|---|---|
| `plugins/SupplementTreeAnalyzer.cc` | The analyzer. Writes `supplementTree/Events` and `supplementTree/Runs` (run + package `version`) |
| `data/datasets_full.yaml` | Input to `create_crab_configs.py` (see below) |
| `data/datasets.yaml` | Legacy, superseded by `datasets_full.yaml`. Don't use |
| `scripts/create_crab_configs.py` | Writes one CRAB config per dataset plus `test/submit.sh` |
| `scripts/check_crab_jobs.py` | Checks finished tasks and moves output to `/store/user/lnestor/supplements` |
| `scripts/reshuffle_supplements.py` | Optional, unused: rewrites per-job files into one file per input file (`--reorder`) |
| `test/supplement_{ee,mumu,emu,met,mc}_cfg.py` | The psets, shared across eras/years |
| `test/<request>_cfg.py` | Generated CRAB configs (gitignored) |
| `test/crab_projects/` | CRAB project dirs |

Run the scripts from `scripts/` (their defaults are relative paths like `../test/`).

## Environment

Run in the `CMSSW_15_0_10` area (`cmsenv` from `src/`) with a valid grid proxy (check, never
create -- see lpc-remote-session) and the CRAB environment (see lpc-crab). After changing
`plugins/SupplementTreeAnalyzer.cc`, rebuild with `scram b` from `src/` before submitting.
Changing the branches written changes the supplement schema -- consider bumping `version` in
the psets.

## Dataset definitions

`data/datasets_full.yaml` is a flat list, one entry per MiniAOD dataset:
`sample`, `miniaod`, `nanoaod`, `year`, `era`, `supplements_path`, `is_mc`,
`global_tag` (MC only; null for data), and `cross_section` for MC. Years are written
`2022_preEE`, `2022_postEE`, `2023_preBPix`, `2023_postBPix`, `2024`, `2025`.

It is the same 409 entries as the analysis repo's `datasets/sources/datasets.yaml`
(see dataset-handling) with `global_tag` filled in for MC. Update the analysis repo's file
first and keep the two in step. Nothing generates `datasets_full.yaml` automatically.

Samples: data `EGamma`, `MET`, `Muon`, `MuonEG`; MC `DY`, `Diboson`, `TTbar`, `SingleTop`,
`QCDEle`, `QCDMu`.

**2026 is not supported yet.** It appears in `LOWERED_MUON_PT_YEARS` but has no golden JSON,
no data global tag and no `datasets_full.yaml` entries. Asking for it fails with a KeyError.

## Generating configs

```bash
cd .../SupplementCreation/scripts
python create_crab_configs.py --samples DY --years 2024 --version 1 --priority 10
```

- `--samples` / `--years` default to all. `--version N` sets the `_supplement_vN` suffix.
  `--priority` sets `config.JobType.priority` (higher runs first among your own tasks) and
  can be used to stagger resubmissions behind more important tasks.
- Request names: data `<primary>_<era>[_vN]_supplement_v<version>` (the era gets the
  reprocessing/version suffix only when needed to keep requests unique); MC
  `<short name>_<year>_supplement_v<version>` (`short name` = primary dataset before
  `_TuneCP5`). The year here has no underscore (`2022postEE`).
- Regenerating overwrites configs with the same name and rewrites `test/submit.sh`, so
  move or rename the old `submit.sh` first if it is still needed.
- Data tasks: `LumiBased`, 400 lumis/job, golden JSON per year. MC tasks: `FileBased`,
  35 files/job, `maxJobRuntimeMin = 200`. Both use 1 core, 3000 MB, `supplement.root` as the
  only output, `outLFNDirBase = /store/user/lnestor/`, storage `T3_US_FNALLPC`.

### pyCfgParams set per config

| Param | Set for | Meaning |
|---|---|---|
| `globalTag` | all | Data: per-year map in the script. MC: `global_tag` from the yaml. 2025 MC uses the 2024 tag |
| `lowerMuonPtThreshold` | data | True for 2025 (and 2026): loose-muon pt cut 2 GeV instead of 3, matching central NanoAOD's 2025 era modifier |
| `egamma2025PtBoundaryFix` | EGamma 2025 only | Strict `>` pt cuts become `>=`, because central keeps objects exactly at the boundary and the supplement join breaks otherwise |
| `recomputeMuonIds` | MC | True for 2022/2023 campaigns (pre-14.2 MiniAOD): recompute the cut-based muon ID bits in `PATMuonUpdater` |

CRAB runs over the whole dataset (`config.Data.inputDataset`), splits it into jobs, and
supplies each job's input files itself. The single file hardcoded in each pset's `source`
is only a placeholder for local tests. Only the ee and mc psets also accept `inputFiles`
(and ee `lumisToProcess`), for local test and manual recovery runs outside CRAB.

### Psets

All five load the same analyzer with different HLT paths and `doMuMu`/`doEE`/`doEMu` flags.
Event-level trigger filtering is done in the pset, so a supplement only contains events that
fired one of the channel's triggers. The MC pset uses the union of all channels' triggers
and adds the gen-particle vertex matching. To test a pset locally, run
`cmsRun supplement_<channel>_cfg.py globalTag=<tag>` (ee and mc: add `inputFiles=<file>`;
the others use their hardcoded placeholder file).

## Submitting and monitoring

`test/submit.sh` holds one `crab submit -c <config>` per line. Submit, monitor, resubmit and
recover failed tasks following lpc-crab (including its Recovery jobs section -- a
`<name>_bad_files.json` next to the config is where files excluded as unreadable are tracked).
Tasks with 1000 or more jobs write output into more than one `000N/` subdirectory and need
manual handling.

## Getting output onto EOS

From `scripts/` with the CMSSW environment and a proxy:

```bash
python check_crab_jobs.py --dry-run
python check_crab_jobs.py
```

For every directory in `../test/crab_projects` it checks `crab status`; a task is only
handled when 100% finished. It moves the output to
`/store/user/lnestor/supplements/<request name minus crab_ prefix and _supplement_vN suffix>`
(removing any existing destination first), then deletes the local CRAB project directory.
`--reverse` reverses the order tasks are checked in.

The plain move is the normal path. Existing supplements on EOS keep the raw CRAB names
(`supplement_<N>.root`), and the analysis matches them to central files by (run, lumi) in
`create_supplement_definition.py`, so no reordering is needed. The manual steps are in
supplement-transfer.

`--reorder` is an unused optional step. It runs `reshuffle_supplements.py`, which rewrites the
per-job files into one file per input file, so analysis-time reads are 1:1 instead of
re-reading shared supplement files. Its `--dataset` is the config's `inputDataset` (the
MINIAOD dataset), so the output is named after MiniAOD files, not NanoAOD ones. Don't use it
unless asked.

## After the files exist

Build the supplement definition JSONs with dataset-handling
(`create_supplement_definition.py`).
