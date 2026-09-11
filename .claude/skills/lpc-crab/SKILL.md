---
name: lpc-crab
description: Submitting, monitoring, and retrieving output from CRAB jobs on the FNAL LPC. Use whenever a task touches crab, crabConfig, crab submit/status/resubmit/kill/getoutput/report, or CRAB task output on EOS.
---

# CRAB on the FNAL LPC

## Environment setup

CRAB requires a CMSSW environment (`cmsenv`) and a valid grid proxy. `crab` commands
must be run from the `test/` directory of the relevant CMSSW project -- that's where
crabConfig files live and where `crab_projects/` gets created.

A grid proxy (`X509_USER_PROXY`) must be set for `crab` to work. Check its validity
(`voms-proxy-info --exists --valid 1:00`) rather than assuming -- see
`lpc-remote-session` for the general check-never-create pattern. Never create or
refresh the proxy yourself; ask the user to run `voms-proxy-init` if it's missing or
expiring.

- **When Claude runs `crab` itself over SSH:** the SSH session is non-interactive and
  doesn't inherit the proxy, so set it explicitly. Resolve the actual proxy path live
  via `lpc-remote-session`'s check-never-create sequence (the `voms-proxy-init`
  default, then the LPC home-directory convention) rather than a path recorded once in
  `CLAUDE.local.md` -- it isn't stored there, and a stored one could go stale after a
  renewal. The CMSSW release path (for whichever release this CRAB work targets) is
  still machine/person-specific and does come from `CLAUDE.local.md`:

  ```bash
  ssh <lpc-host-alias> "X509_USER_PROXY=<resolved-proxy-path> cd <path-to-CMSSW-release>/src/.../test && cmsenv && crab status -d <dir>"
  ```

- **When Claude gives the user a command to run themselves:** assume the proxy is
  already set and the user is already in the `test/` directory -- just give the bare
  `crab` command, e.g. `crab status -d <dir>`.

## Config basics

Configs are built with `CRABClient.UserUtilities.config()`. Key fields:

- `config.General.requestName` / `workArea` / `transferOutputs` / `transferLogs`
- `config.JobType.pluginName` (usually `'Analysis'`), `psetName`, `outputFiles`,
  `maxMemoryMB`, `numCores`, `maxJobRuntimeMin`
- `config.Data.inputDataset` (central DBS dataset) or `config.Data.userInputFiles` (an
  explicit list of LFNs, e.g. when chaining private production steps)
- `config.Data.splitting` -- `'FileBased'`, `'LumiBased'` (data, needs
  `config.Data.lumiMask` pointing at a golden JSON), or `'EventAwareLumiBased'`
- `config.Data.unitsPerJob`, `publication`, `outLFNDirBase`, `outputDatasetTag`
- `config.Site.storageSite`, optionally `whitelist`/`blacklist`

## Submitting

```bash
crab submit -c <config>_cfg.py
```

## Monitoring & managing tasks

- `crab status -d crab_projects/crab_<requestName>` -- shows the task's current job
  states and progress. The output has a `Jobs status:` block with per-state
  percentages, e.g. `finished 100.0% (400/400)`.
- `crab resubmit -d crab_projects/crab_<requestName>` -- resubmits failed/killed jobs.
  Can override job parameters from the original config without editing and
  resubmitting the crabConfig -- e.g. `--maxmemory`, `--maxjobruntime`,
  `--sitewhitelist`/`--siteblacklist`. Useful when a task is failing because the
  original memory/time/site settings were wrong, rather than because of bad input.
- `crab kill -d crab_projects/crab_<requestName>` -- stops a task, killing any
  running/queued jobs. A killed task can never be resubmitted -- recovering its
  unprocessed lumis/files requires a new recovery task (see
  [Recovery jobs](#recovery-jobs) below).
- `crab report -d crab_projects/crab_<requestName>` -- gets the list of good
  (successfully processed) lumis and files for the task, and writes a summary of
  what's been processed and what hasn't. See [Recovery jobs](#recovery-jobs) below.

## Recovery jobs

If a task's failures are unrecoverable through `crab resubmit` -- e.g. the task was
killed, or resubmitting hasn't fixed the failures -- submit a new "recovery" task to
process just the unprocessed lumis/files instead. `crab report` (see above) identifies
what's still missing, and writes its output into a `results/` directory inside the crab
project directory.

- **Lumi-based splitting** (data): `crab report` writes `results/notFinishedLumis.json`.
  Point the recovery task's `config.Data.lumiMask` at that file, keeping
  `config.Data.inputDataset` the same as the original task:

  ```python
  config.Data.inputDataset = '/EGamma0/Run2024E-MINIv6NANOv15-v1/MINIAOD'
  config.Data.lumiMask = 'crab_projects/crab_<requestName>/results/notFinishedLumis.json'
  ```

- **File-based splitting** (MC): `crab report` writes `results/failedFiles.json`. Load
  it directly into `config.Data.userInputFiles`:

  ```python
  import json
  config.Data.userInputFiles = json.load(open('crab_projects/crab_<requestName>/results/failedFiles.json'))
  ```

  When specifying a list of user input files instead of a dataset, a whitelist must be
  provided. The following sites can be a good list for a whitelist:

  ```
  T1_US_FNAL, T1_FR_CCIN2P3, T1_DE_KIT,
  T2_IT_Rome, T2_FI_HIP, T2_IT_Bari, T2_FR_IPHC, T2_IT_Legnaro, T2_DE_RWTH,
  T2_UK_London_IC, T2_CH_CSCS, T2_DE_DESY, T2_UK_SGrid_RALPP, T2_US_Caltech,
  T2_US_Wisconsin, T2_US_Purdue,
  T3_UK_London_QMUL, T3_UK_London_RHUL, T3_UK_SGrid_Oxford
  ```

### Naming convention

Recovery crabConfig filenames follow `{original name, with trailing `_cfg` stripped}_recovery_v1_cfg.py`
-- e.g. `foo_v2_cfg.py` recovers as `foo_v2_recovery_v1_cfg.py`. If a second recovery
round is needed on the same original task, bump to `_recovery_v2_cfg.py`, and so on.

A recovery config should otherwise be identical to the original -- only the request name
and the lumi mask/input file list differ.

### Running a recovery locally instead of via CRAB

For a small number of leftover files/lumis (e.g. one or two failed jobs out of a large
task), running `cmsRun` directly on an LPC interactive node is often faster than
submitting another CRAB task and waiting in the grid queue.

1. **Get the failed input list.** Same as above: `crab report`'s `results/failedFiles.json`
   (file-based/MC) or `results/notFinishedLumis.json` (lumi-based/data). For a single
   failed job, `crab status --long` (grep the job's row) confirms retry count, memory,
   and runtime -- useful for telling a real crash apart from a resource/timeout issue
   before spending time on a local run.

2. **Make sure the pset accepts a file list from the command line.** Configs built with
   `VarParsing.VarParsing("analysis")` already register an `inputFiles` option, but a
   pset may not actually wire it into `process.source.fileNames` if it was only ever
   run through CRAB (CRAB overrides `fileNames` itself at runtime, independent of
   whatever default is in the pset, so this is usually never noticed). If needed, add a
   fallback:

   ```python
   process.source = cms.Source("PoolSource",
       fileNames = cms.untracked.vstring(
           options.inputFiles if options.inputFiles else [<original placeholder file>]
       ),
   )
   ```

   This is safe to leave in permanently -- it changes nothing about how CRAB runs the
   pset.

3. **Run it**, passing the same `pyCfgParams` the original crabConfig used and pointing
   `inputFiles_load` at a text file with one `/store/...` LFN per line:

   ```bash
   cmsRun <pset>_cfg.py <pyCfgParam1>=<val> <pyCfgParam2>=<val> inputFiles_load=<files>.txt
   ```

   `/store/...` paths resolve automatically through the site's local xrootd config --
   no redirector prefix needed. Run it with `nohup ... > out.log 2>&1 &` over SSH, since
   it can take tens of minutes to hours; note that the `ssh` command itself may not
   return promptly even after backgrounding (sshd can wait on the child's inherited
   file descriptors), so also verify independently with `pgrep -af cmsRun` and by
   tailing the log. To block until it exits either way, `tail -n +1 --pid=<PID> -f
   out.log` on the remote returns once that PID is gone.

4. **A crash reproduces locally the same way it failed in CRAB.** CMSSW's XrdAdaptor
   retries a failed file open on the site redirector (`cmsxrootd-site.fnal.gov`), then
   falls back to the global redirector (`cmsxrootd.fnal.gov`) after a few minutes --
   this is normal and usually resolves. If a specific file fails at both and the
   process dies with a segfault ("A fatal system signal has occurred: segmentation
   violation") inside `XrdAdaptor`/`XrdFile::open`, that file is genuinely unreachable,
   not a transient hiccup -- matching a `50664`/`50660`/`8901` pattern that persisted
   across CRAB's own retries at different sites. Drop that file from the input list and
   rerun; a per-sample `<name>_bad_files.json` alongside the crabConfig is a reasonable
   place to track files excluded this way, so future task/recovery configs know to skip
   them too.

5. **Place the output.** `TFileService`'s output name is whatever the pset hardcodes
   (not necessarily job-id-specific), so rename it to match the finished task's
   convention (`<outputFiles pattern>_<jobid>.root`) before it's used anywhere
   downstream -- e.g. dropped into the raw CRAB output directory (see
   [Retrieving output](#retrieving-output)) alongside the other jobs' outputs so the
   normal output-transfer process picks it up along with everything else.

   Note that CRAB's own bookkeeping for the task is untouched by this -- `crab status`
   will keep reporting the recovered job as `failed` forever, since nothing was
   resubmitted through CRAB. Any tooling that gates on `crab status` reaching 100%
   finished won't recognize the task as done even though the output is complete on EOS;
   the final output-transfer step needs to be done by hand in that case -- check
   whether the analysis has its own skill or script for that.

## Retrieving output

Output is written directly to EOS (`transferOutputs = True`), not pulled to local disk.

```bash
crab getoutput -d crab_projects/crab_<requestName> --dump --jobids 1
```

`--jobids` does not actually filter the dump -- it prints the LFN (and PFN) for every
job in the task regardless of what's passed.

The output path has the form:

```
<outLFNDirBase>/<outputDatasetTag>/<timestamp>/0000/<file>_<jobid>.root
```

The `<outputDatasetTag>` and `<timestamp>` segments are how different task submissions
(including resubmissions/recoveries under a new requestName) are told apart. `0000`,
`0001`, ... subdirectories each hold the outputs of up to 1000 jobs (if a job produces
multiple output files, they all land together in the same subdirectory) -- a task with
1000 or more jobs will span multiple subdirectories, not just `0000`.

## Common gotchas

- `crab status`/`getoutput`/`resubmit`/`kill`/`report` all take `-d <crab project dir>`,
  not the config file.
- `crab getlog --jobids <N>` has the same quirk as `getoutput`: `--jobids` does not
  filter, so it downloads every job's log tarball in the task, not just the one asked
  for.
- A failed job's log tarball may not be retrievable via `crab getlog` at all -- if the
  job crashed before it could stage out, there's nothing on storage to fetch. Running
  the failure locally (see [Running a recovery locally](#running-a-recovery-locally-instead-of-via-crab))
  is often the only way to see the actual error.
- A stuck or repeatedly-failing task doesn't always mean something is actually wrong --
  it can be a transient site/network issue, but it can also persist. If it persists, a
  recovery job or running the remaining files/lumis locally (see
  [Recovery jobs](#recovery-jobs)) may be more effective than continuing to resubmit.
  Setting `maxJobRuntimeMin` low enough that a genuinely stuck job gets auto-killed
  quickly, rather than sitting for hours, keeps this loop fast to iterate on.
- Common job exit codes seen in `crab status` error summaries:
  - `50664` -- application terminated by wrapper for using too much wall clock time
    (raise `maxJobRuntimeMin` via `crab resubmit --maxjobruntime`).
  - `50660` -- application terminated by wrapper for using too much RAM/RSS (raise
    `maxMemoryMB` via `crab resubmit --maxmemory`).
  - `8901` -- `UnexpectedJobTermination`, probably an uncaught exception in the job.
    This is NOT an OOM kill -- don't assume memory is the cause just because max memory
    usage happens to be high in the same status output; that's a distinct code (50660).
    Check the actual job logs/FJR for the real error before attributing it to memory.
