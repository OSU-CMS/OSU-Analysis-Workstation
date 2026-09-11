---
name: disapptrks-nano-production-pass
description: Run a monitoring "pass" over the OSUv2 custom-NanoAOD CRAB production/migration tracked in disappearing_tracks/nano_v2_migration_checklist.md -- check the grid proxy, run crab status across every tracked work area (2022-2026, CMSSW_13/el8 and CMSSW_15/el9), diagnose failures (ordinary churn vs. a real site/code/data problem) before resubmitting, validate completed datasets against their v1 counterparts when asked, and keep the checklist current. Use this whenever asked to "do a pass", "check status and resubmit", "validate what's ready", or "what's safe to delete from EOS" for this production -- as opposed to `disapptrks-job-submission`/`disapptrks-lpc-execution`, which are about running PocketCoffea analysis jobs, not CRAB custom-NanoAOD production.
---

# OSUv2 NanoAOD production pass

This is the CRAB production/migration side of the disappearing-tracks group's
custom NanoAOD (OSUNano), reprocessing `OSU_VERSION=1` (`dev/`, `prod/`) to
`OSU_VERSION=2` (`dev_v2/`, tag suffix `_OSUv2`), plus fresh same-version
production for newer eras (2024, 2026) that never had a v1. Tracked entirely in
`disappearing_tracks/nano_v2_migration_checklist.md` -- **read that file's current
state before doing anything**; it's the source of truth for what's already
validated/cleared, what's a known permanent gap, and what site/code issues have
already been diagnosed and fixed. Don't re-derive state that's already documented
there.

**Ground rule, never violated**: Claude never deletes anything from EOS. Only
give the human a path list; they do the `eos rm`. After they confirm deletion,
verify with a read-only `eos ls -d` sweep and update the checklist.

## Environment

Two separate CMSSW/SCRAM_ARCH environments, each needs its own SSH connection and
`cmsenv`:

- **el9** (`ssh cmslpc`) for CMSSW_15 work areas -- 2024, 2025, 2026 production.
- **el8** (`ssh cmslpc-el8.fnal.gov`) for CMSSW_13 work areas -- 2022, 2023
  production. CMSSW_13 breaks on el9 with a curl/SSL error.

Both use multiplexed SSH (`-o ControlPath=~/.ssh/controlmasters/%r@%h:%p -o
StrictHostKeyChecking=accept-new`) -- pass both `-o` flags directly in the ssh
command, not bundled into one shell variable (bundling them into a single `"-o
X -o Y"` string and reusing that variable breaks argument parsing).

Grid proxy lives at a non-default path: `/uscms/home/mjoyce/x509up_u51387` (not
`/tmp/x509up_u<uid>`). Check with `voms-proxy-info --exists --valid 1:00 -file
<path>` -- **never run `voms-proxy-init` or otherwise create/refresh it**, that's
the human's job (needs an interactive passphrase). Also never source
`/cvmfs/cms.cern.ch/common/crab-setup.sh` before `crab report`/`submit`/`resubmit`
-- it can trigger an unwanted fresh `voms-proxy-init` prompt. `crab` is already on
`PATH` via `/cvmfs/cms.cern.ch/common/crab` after `cmsenv`; just
`export X509_USER_PROXY=<path>` first.

Shared scratch for scripts/logs: `/uscms_data/d3/mjoyce/claude_scratch/` (NFS,
visible from every node). **Never use `/tmp`** for anything that needs to survive
across SSH calls -- `cmslpc`'s el9 alias round-robins across physical login nodes,
each with its own local `/tmp`; a file written in one SSH call can be invisible
(not erroring, just gone) in the next.

Host key rotation warnings ("REMOTE HOST IDENTIFICATION HAS CHANGED") are routine
on this LPC pool, not a security incident -- `ssh-keygen -R <host>` then retry with
`-o StrictHostKeyChecking=accept-new`.

## The pass workflow

1. **Check the grid proxy** (read-only).
2. **Run `crab status`** on every not-yet-cleared task across all tracked work
   areas, batched per work area into a script (loop over tasks, `crab status -d
   <dir> 2>&1 | grep -E 'Jobs status|failed|finished|running|idle|transferring'`),
   deployed via `scp` + `nohup ... & disown` so it survives the SSH session and
   keeps running if the connection drops. **Launch each work area's script as its
   own separate SSH command** -- chaining multiple `nohup ... & disown` launches
   together in one SSH call only carries the sourced environment/cwd to the
   *first* one; later ones in the same chain silently run in the wrong directory
   with no environment.
3. **Diagnose every failure before resubmitting** -- don't blindly `crab resubmit`
   everything with `failed` status. Pull a short job log (`crab getlog --jobids
   <n> --short`) for anything with more than a couple of failed jobs, or an
   unfamiliar exit code, and check:
   - **Ordinary churn**: scattered, low single-digit-to-low-teens counts, common
     codes (8901 segfault, 50660 OOM, 50664 timeout). Plain `crab resubmit`, no
     investigation needed.
   - **Site-specific**: many failures concentrated at one site (`crab status
     --long` shows the site per job) -- e.g. jobs dying before `cmsRun` even
     starts. Fix with `crab resubmit --siteblacklist=<site>`, not a plain
     resubmit (which just lands back on the same bad site).
   - **Corrupted source file**: `FileReadError`/`R__unzipLZMA` or a segfault deep
     in ROOT's I/O layer (`TStorageFactoryFile::Initialize`, "Module: none
     (crashed)") *before* any analysis module runs, happening identically across
     multiple different sites/retries. Check `dasgoclient -query 'site
     file=<LFN>'` -- if CRAB has already tried every disk replica listed there
     and failed on all of them, this is unrecoverable by resubmitting. Get the
     human to accept it as a permanent gap (note the exact LFN, dataset, block,
     size, adler32 for them to report to CMS) and stop resubmitting that job.
   - **Systemic code/build problem**: identical deterministic failure (e.g.
     `PluginNotFound`) on literally every job of a task. Not fixable by
     resubmitting at all -- the sandbox itself is broken (e.g. forgot `scram b`
     before submitting). Needs `crab kill` + a fresh `crab submit` after the
     human fixes the underlying code, not `crab resubmit` (which reuses the same
     broken sandbox). `crab kill` in this CRAB version has no `--jobids`, it's
     whole-task only -- move the old local workArea dir aside (never delete) so
     the same requestName can be reused.
   - **`SUBMITREFUSED`**: check the warning text. A zero-intersection between the
     task's configured run range and the dataset's actual certified lumis usually
     means the Golden JSON hasn't caught up yet for very recent data -- not
     fixable now, just wait (or per the human's call, abandon it if the era is
     known not to be needed).
   - **Local CRAB client errors** (not job failures): `OSError: [Errno 122] Disk
     quota exceeded` from `crab status` itself means the LPC *home* directory
     quota is full (a separate quota from `/uscms_data`) -- check with `quota -s`,
     find what's eating it (`.vscode-server` accumulating old client versions is
     a common culprit, `du -sh` its `cli/servers/*/` subdirs and compare against
     the currently-connected version before assuming anything is safe to touch),
     and let the human clear it (their call, may affect an active VSCode
     connection).
   - A recovery task (used for the FatJet code-fix pattern) needs the *combined*
     original-held + recovery task output summed for validation, not either one
     alone.
4. **Resubmit** whatever's confirmed to be ordinary churn or has a diagnosed
   site fix, as separate SSH commands per work area (same chaining caveat as
   step 2).
5. **Give the condensed completion table unprompted, every pass** -- rows = era
   groups (`2022CD`, `2022EFG`, `2023C`, `2023D`, `2024`, `2025`, `2026`, ...),
   columns = dataset type (`EGamma`, `Muon`, `JetMET`, ...). Each cell = percent
   of CRAB jobs finished, aggregated across all primaries/versions/eras in that
   group, weighted by job count (or GB size where that's what the checklist
   tracks). Footnote anything held back by a recovery-combined dataset, a
   permanently-capped task, or an abandoned dataset. If asked to give it right
   after the status check specifically (before resubmitting), do that.
6. **Update the checklist**: per-dataset status cells, a dated validation-log
   entry summarizing what changed and any gotchas found, and the aggregate
   cleared-count/ready-to-delete list.

## Validating a completed dataset against v1

Only when asked (or when the human wants to know what's safe to delete). Compare
total event count (and file count, except see the `prod/` exception below) between
`dev_v2/<Primary>/<tag>_customNanoAOD_OSUv2` and the v1 location, via `uproot`
(needs an LCG view sourced -- `LCG_106/x86_64-el8-gcc11-opt` on el8,
`LCG_105/x86_64-el9-gcc11-opt` on el9; plain `python3` has no `uproot`).

- **Exact match, 0 errors**: clear.
- **v2 has a few more files/events than v1**: don't assume benign -- confirm with
  a lumi-level (run, luminosityBlock) diff. Benign pattern (the data-taking
  lumiMask is a live rolling Golden JSON, not a pinned snapshot, so a v2
  submission weeks after v1 can pick up newly-certified runs): v1's lumis are a
  strict subset of v2's (`only_v1=0`). Real problem: any lumi only in v1, or a
  per-lumi event-count mismatch.
- **A lumi-diff shows `only_v1 > 0` but there were nonzero read errors on either
  side**: don't trust it -- rerun with retries until both sides are 0 errors
  first. A read-error artifact can look exactly like a real gap.
- **v1 has a much smaller total than v2 (tens of percent short, not a few
  percent)**: before concluding v1 is incomplete, check whether there are
  *multiple* v1 directories for the same dataset (e.g. a base attempt plus
  `_retry`/`_noFatJets`/-suffixed variants) -- these are usually **sequential
  production attempts, not complementary pieces to sum**. Summing all of them
  inflates the v1 total and produces a nonsensical comparison. Check each
  variant's file count against v2's before deciding which one (usually just one)
  is the real, complete v1.
- **`prod/` location**: some v1 datasets exist only as an already-`hadd`-merged
  copy in `prod/<tag>` (flat, no primary subdirectory, no `_customNanoAOD`
  suffix) instead of raw CRAB output in `dev/`. Far fewer, larger files than
  `dev_v2` is expected there -- compare by event count only, don't apply the
  file-count check.
- Once validated, mark it cleared in the checklist and give the human the exact
  EOS path(s) to delete -- never delete them yourself. After they confirm
  deletion, do a read-only `eos ls -d` sweep on every path to confirm before
  updating the checklist's cleared/deleted state.
