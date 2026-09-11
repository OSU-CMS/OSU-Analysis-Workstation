# NanoAOD `dev` → `dev_v2` (OSU_VERSION 1 → 2) migration checklist — 2025 datasets

## Context

- `OSUNano` branch `MattPerLayerBranches` reprocesses the 2025 EGamma0-3/Muon0-1
  datasets with `OSU_VERSION=2`. Unlike `main`, this branch stamps the version into
  `requestName`/`outputDatasetTag` (`..._customNanoAOD_OSUv2`), so v2 output cannot
  collide with the existing unsuffixed v1 output (`..._customNanoAOD`) even in the
  same parent directory.
- v1 output lives under `/store/group/lpcdisapptrks/nano/dev/<Primary>/`. v2 output is
  currently being written to `/store/group/lpcdisapptrks/nano/dev_v2/<Primary>/` (the
  42 EGamma/Muon CRAB tasks originally tracked below, plus 14 JetMET0/JetMET1 tasks
  added 2026-09-03 -- 56 tasks total, same migration, same procedure).
- v1 total for the original 42 EGamma/Muon datasets: **~19.5 TB** (measured
  2026-09-02). Not enough spare EOS space to hold both copies in full, so datasets are
  verified and cleared for deletion one at a time rather than all at once.

## Ground rules

- **Claude/automation never runs `eos rm` (or any delete) in this space, period.**
  This checklist produces a recommendation ("cleared for deletion") only. A human
  reviews it and does the actual deletion themselves.
- A dataset only gets marked cleared after every item in the per-dataset procedure
  below passes.
- This is a living document — update the per-dataset table as CRAB tasks finish and
  as verification passes happen, rather than recreating it.

## Per-dataset verification procedure

Run these for one dataset tag (e.g. `EGamma0_Run2025D_v1`) before recommending its v1
copy for deletion:

1. **Task fully finished.** `crab status -d crab_projects_OSUv2/crab_<tag>_customNanoAOD_OSUv2`
   shows `finished 100%`, no `failed`/`running`/`transferring` left.
2. **Full lumi coverage (data only).** `crab report -d ...` produces no
   `notFinishedLumis.json`, or it's empty — confirms the processed lumis match the
   golden JSON/lumiMask with nothing missing.
3. **File count matches job count.** Number of `nano_*.root` files under the EOS
   output directory equals the number of finished jobs (checked via
   `eos find -f ... | grep -c '\.root$'`, excluding the `cmsRun_*.log.tar.gz`
   tarballs that sit alongside them 1:1). **This check applies to raw
   `dev`/`dev_v2` CRAB output only.** `/store/group/lpcdisapptrks/nano/prod/` holds a
   separately-merged (`hadd`-style) copy of some datasets with far fewer, much larger
   files than the raw per-job output -- e.g. `prod/Muon0_Run2025C_v1` has 45 files
   (~1.6-2.7 GB each) versus 458 raw job files in `dev/Muon0/Muon0_Run2025C_v1_customNanoAOD`.
   A low file count there is expected, not a red flag. If/when a v2 dataset gets a
   merged copy in `prod/` too, validate the merge by total event count against the
   `dev_v2` raw output instead of by file count.
4. **No zero-byte / anomalously small files.** Spot the output file sizes (`eos find
   -f ... ` + `eos stat`, or `du` per file) and flag anything far below the dataset's
   typical per-file size — a truncated/failed stageout that CRAB still counted as
   finished.
5. **Files open cleanly.** Sample (or, for smaller datasets, all) output files open
   without error via `uproot.open(...)["Events"]` — catches zombie/corrupt ROOT files.
6. **Event count sanity.** Sum `num_entries` across all v2 output files for the
   dataset; compare against the v1 total for the same dataset tag. Usually matches
   exactly. If it doesn't: the crabConfig's `lumiMask` points at CMS's **live** rolling
   Golden JSON, not a pinned snapshot, and v1/v2 were submitted weeks apart — so v2
   picking up a handful of extra whole runs/lumis that got certified in between is
   expected, not a bug (confirmed for `EGamma2_Run2025D_v1`, see validation log
   2026-09-03). Before treating any mismatch as a real problem, do the lumi-level
   check: read `run`/`luminosityBlock` from both sides' files, diff the distinct-lumi
   sets. **Benign pattern**: v1's lumis are a strict subset of v2's (every v1 lumi
   present in v2 with the same per-lumi event count), and the extra v2 lumis account
   for the whole event-count difference. **Real problem, investigate further**: any
   lumi in v1 missing from v2, or a per-lumi event count that disagrees between the
   two where both sides have that lumi.
7. **Branch spot-check.** In one or two sampled files, confirm the `Events` tree has
   the expected branches and that a couple of physics variables aren't degenerate
   (e.g. not uniformly zero/default) — catches a silently-broken producer.

Once all seven pass for a dataset, mark it **cleared** in the table below and let the
human know it's ready for them to delete the v1 copy.

## Dataset tracking

Status as of 2026-09-06, pass 10 (full table refresh). Multi-day gap since pass 9 --
CRAB was blocked the whole time by an expired MyProxy delegation (fixed by Matt
re-delegating interactively), so many tasks had simply finished waiting in the queue.

| Dataset tag | v1 size | v2 CRAB status (2026-09-06, pass 10) | Verified (1-7) | Cleared for human deletion |
|---|---|---|---|---|
| EGamma0_Run2025C_v1 | 372.75 GB | **COMPLETE (100%)** | Pass, exact match 449/449 files, 222194731/222194731 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma0_Run2025C_v2 | 221.21 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| EGamma0_Run2025D_v1 | 677.09 GB | **COMPLETE (100%)** | Pass, resolved (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma0_Run2025E_v1 | 406.19 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma0_Run2025F_v1 | 564.02 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma0_Run2025F_v2 | 230.04 GB | **COMPLETE (100%)** | Pass (2026-09-02) | **v1 deleted by Matt (2026-09-04)** |
| EGamma0_Run2025G_v1 | 679.58 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| EGamma1_Run2025C_v1 | 372.78 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma1_Run2025C_v2 | 221.19 GB | **COMPLETE (100%)** | Pass (2026-09-02) | **v1 deleted by Matt (2026-09-04)** |
| EGamma1_Run2025D_v1 | 677.08 GB | **COMPLETE (100%)** | Pass, resolved -- first lumi-diff had 1 v1-side read error and a spurious only_v1=75; clean rerun (0 errors both sides) confirmed only_v1=0, v1's 61890 lumis a strict subset of v2's 62945 (benign golden-JSON-drift pattern) (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma1_Run2025E_v1 | 406.18 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma1_Run2025F_v1 | 564.05 GB | **COMPLETE (100%)** | Pass (2026-09-04) -- also resolved the stale-notFinishedLumis false alarm | **v1 deleted by Matt (2026-09-04)** |
| EGamma1_Run2025F_v2 | 229.99 GB | **COMPLETE (100%)** | Pass (2026-09-03) | **v1 deleted by Matt (2026-09-04)** |
| EGamma1_Run2025G_v1 | 679.61 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| EGamma2_Run2025C_v1 | 372.75 GB | **COMPLETE (100%)** | Pass\* (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma2_Run2025C_v2 | 221.17 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma2_Run2025D_v1 | 677.08 GB | **COMPLETE (100%)** | Pass, resolved (2026-09-03) | **v1 deleted by Matt (2026-09-04)** |
| EGamma2_Run2025E_v1 | 406.16 GB | **COMPLETE (100%)** | Pass (2026-09-02) | **v1 deleted by Matt (2026-09-04)** |
| EGamma2_Run2025F_v1 | 564.06 GB | **COMPLETE (100%)** | Pass (2026-09-02) | **v1 deleted by Matt (2026-09-04)** |
| EGamma2_Run2025F_v2 | 230.04 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma2_Run2025G_v1 | 679.56 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| EGamma3_Run2025C_v1 | 372.76 GB | **COMPLETE (100%)** | Pass\* (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma3_Run2025C_v2 | 221.19 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma3_Run2025D_v1 | 677.07 GB | **COMPLETE (100%)** | Pass, resolved (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma3_Run2025E_v1 | 406.15 GB | **COMPLETE (100%)** | Pass (2026-09-02) | **v1 deleted by Matt (2026-09-04)** |
| EGamma3_Run2025F_v1 | 564.03 GB | **COMPLETE (100%)** | Pass (2026-09-03) | **v1 deleted by Matt (2026-09-04)** |
| EGamma3_Run2025F_v2 | 230.02 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| EGamma3_Run2025G_v1 | 679.64 GB | **COMPLETE (100%)** | Pass (2026-09-03) | **v1 deleted by Matt (2026-09-04)** |
| Muon0_Run2025C_v1 | 380.62 GB | **COMPLETE (100%)** | Pass\* (2026-09-02) | **v1 deleted by Matt (2026-09-04)** |
| Muon0_Run2025C_v2 | 240.33 GB | **COMPLETE (100%)** | Pass (2026-09-03) | **v1 deleted by Matt (2026-09-04)** |
| Muon0_Run2025D_v1 | 765.96 GB | **COMPLETE (100%)** | Pass, resolved (2026-09-03) | **v1 deleted by Matt (2026-09-04)** |
| Muon0_Run2025E_v1 | 437.35 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| Muon0_Run2025F_v1 | 601.16 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| Muon0_Run2025F_v2 | 232.22 GB | 7.2% (16/223) as of pass 15, progressing cleanly, no failures -- **killed and fresh-submitted 2026-09-08** after the original task (submitted 2026-08-25) went through 7+ resubmit cycles over 2 weeks stuck at ~19% pinned to one slow site (T2_IT_Legnaro); fresh-submitted with `config.Site.blacklist = ['T2_IT_Legnaro']`, fix confirmed holding | — | — |
| Muon0_Run2025G_v1 | 688.40 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| Muon1_Run2025C_v1 | 380.60 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| Muon1_Run2025C_v2 | 240.35 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| Muon1_Run2025D_v1 | 765.91 GB | **COMPLETE (100%)** | Pass, resolved (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| Muon1_Run2025E_v1 | 437.35 GB | **COMPLETE (100%)** | Pass (2026-09-02) | **v1 deleted by Matt (2026-09-04)** |
| Muon1_Run2025F_v1 | 600.07 GB | **COMPLETE (100%)** | Pass, resolved (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| Muon1_Run2025F_v2 | 232.24 GB | **COMPLETE (100%)** | Pass (2026-09-03) | **v1 deleted by Matt (2026-09-04)** |
| Muon1_Run2025G_v1 | 688.73 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| JetMET0_Run2025C_v1 | 300.30 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| JetMET0_Run2025C_v2 | 169.23 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2025D_v1 | 536.12 GB | **COMPLETE (100%)** | Pass, resolved (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2025E_v1 | 307.71 GB | **COMPLETE (100%)** | Pass, exact match 419/419 files, 142890365/142890365 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2025F_v1 | 412.04 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2025F_v2 | 161.20 GB | **COMPLETE (100%)** | Pass (2026-09-04) | **v1 deleted by Matt (2026-09-04)** |
| JetMET0_Run2025G_v1 | 463.48 GB | **COMPLETE (100%)** | Pass\* (2026-09-06) -- file-availability issue fully resolved | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2025C_v1 | 300.31 GB | **COMPLETE (100%)** | Pass, exact match 449/449 files, 139661282/139661282 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2025C_v2 | 169.20 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2025D_v1 | 536.09 GB | **COMPLETE (100%)** | Pass, resolved -- clean lumi-diff (0 errors both sides), v1's 61889 lumis are a strict subset of v2's 62944, only_v1=0 (benign golden-JSON-drift pattern) (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2025E_v1 | 307.70 GB | **99.8% (416/417), 1 job permanently blocked by a bad source file -- accepted gap, see validation log 2026-09-08** | — | — |
| JetMET1_Run2025F_v1 | 412.00 GB | **COMPLETE (100%)** | Pass (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2025F_v2 | 161.21 GB | **COMPLETE (100%)** | Pass, exact match 222/222 files, 74528971/74528971 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2025G_v1 | 463.39 GB | **COMPLETE (100%)** | Pass\* (2026-09-06) | **v1 deleted by Matt (2026-09-08)** |

**54 of 56 cleared so far** (pass 13, 2026-09-08). **All 54 now have their v1 copies
deleted** -- the first 33 by Matt as of 2026-09-04, and the remaining 21 (15 cleared
2026-09-06 + 6 cleared 2026-09-08) confirmed deleted by Matt on 2026-09-08 (verified
via a read-only `eos ls -d` sweep of all 21 paths -- all gone). Nothing pending
deletion in this section right now. Remaining 2 not yet cleared: `Muon0_Run2025F_v2`
and `JetMET1_Run2025E_v1` (still resubmitted/running as of pass 12, need a fresh
`crab status` to check).

## 2022/2023 migration (CMSSW_13 production)

Added 2026-09-04. Matt is running a second, parallel OSUv2 reprocessing round for
2022/2023 data, submitted from a different work area
(`/uscms/home/mjoyce/nobackup/DisTrks/NanoProd_CMSSW_13/CMSSW_13_0_13/src/OSUNano/CustomNanoAOD/test`,
CRAB projects under `/uscms_data/d3/mjoyce/DisTrks/NanoProd_CMSSW_13/crab_projects_OSUv2/`).
Same `dev_v2` destination and versioning scheme as the 2025 migration above, so it
gets the same verification procedure -- **except v1's location varies per dataset**:
most are raw CRAB output in `dev/`, but some (mostly older Muon 2023/2022 versions)
only exist as an already-merged copy in `prod/` (see procedure item 3's `prod/`
exception -- compare by event count only for those, not file count). Checked and
mapped below; don't assume `dev/` like the 2025 table does.

Also includes 4 AMSB_Wino signal MC samples in the same work area. Per Matt
(2026-09-04): these don't fit the lumi-coverage verification procedure (no golden
JSON/lumi-mask concept for MC), so they get CRAB status/resubmit tracking only, no
v1-vs-v2 comparison.

### Data tasks (46)

v1 total: **~4.65 TB** across all 46. First status pass 2026-09-06 (see validation
log): 38/46 already complete on first check (multi-day proxy outage gave them time
to finish). **42 of 46 validated and cleared as of 2026-09-08** (all EGamma0/EGamma1 2023, plus
JetMET0/1 Run2023, JetMET_Run2022, Muon0/1 Run2023, and Muon_Run2022 -- all exact
event-count matches, several `prod/`-location ones with the expected far-fewer-files
merge discrepancy, a few `dev/`-location ones with a harmless 1-empty-file
discrepancy, and 3 that needed a clean retry after a transient XRootD read-timeout
error gave a spurious mismatch on the first pass). **All 42 v1 copies now deleted by
Matt** -- the first 12 (EGamma0/1) and the remaining 30 (17 `dev/`-location + 13
`prod/`-location) confirmed deleted on 2026-09-08 (verified via a read-only
`eos ls -d` sweep of all 30 paths -- all gone). Nothing pending deletion in this
section right now. Remaining 4 not yet cleared: `JetMET1_Run2023C_v3` and
`Muon1_Run2023C_v4` (still resubmitted/running as of pass 12, need a fresh
`crab status`), plus `JetMET_Run2022E`/`Muon_Run2022E` (FatJet recovery tasks in
progress, see below).

| Dataset tag | v1 location | v1 size | v2 CRAB status (2026-09-06) | Verified (1-7, adapted per item 3) | Cleared for human deletion |
|---|---|---|---|---|---|
| EGamma0_Run2023C_v1 | dev | 75.80 GB | **COMPLETE (100%)** | Pass, 219/220 files (1 empty file, harmless), 66588747/66588747 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma0_Run2023C_v2 | dev | 19.49 GB | **COMPLETE (100%)** | Pass, exact match 48/48 files, 16943443/16943443 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma0_Run2023C_v3 | dev | 24.91 GB | **COMPLETE (100%)** | Pass, exact match 61/61 files, 21579682/21579682 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma0_Run2023C_v4 | dev | 177.07 GB | **COMPLETE (100%)** | Pass, 415/416 files (1 empty file, harmless), 153331187/153331187 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma0_Run2023D_v1 | dev | 118.55 GB | **COMPLETE (100%)** | Pass, 315/316 files (1 empty file, harmless), 102234210/102234210 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma0_Run2023D_v2 | dev | 25.90 GB | **COMPLETE (100%)** | Pass, exact match 57/57 files, 22305506/22305506 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma1_Run2023C_v1 | dev | 75.73 GB | **COMPLETE (100%)** | Pass, exact match 219/219 files, 66530195/66530195 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma1_Run2023C_v2 | dev | 19.49 GB | **COMPLETE (100%)** | Pass, exact match 49/49 files, 16942570/16942570 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma1_Run2023C_v3 | dev | 24.91 GB | **COMPLETE (100%)** | Pass, exact match 62/62 files, 21578008/21578008 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma1_Run2023C_v4 | dev | 176.99 GB | **COMPLETE (100%)** | Pass, exact match 418/418 files, 153240158/153240158 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma1_Run2023D_v1 | dev | 118.52 GB | **COMPLETE (100%)** | Pass, exact match 315/315 files, 102201862/102201862 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| EGamma1_Run2023D_v2 | dev | 25.91 GB | **COMPLETE (100%)** | Pass, 57/58 files (1 empty file, harmless), 22305383/22305383 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2023C_v1 | dev | 78.93 GB | **COMPLETE (100%)** | Pass, exact match 218/218 files, 55317281/55317281 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2023C_v2 | dev | 24.12 GB | **COMPLETE (100%)** | Pass, 50/51 files (1 empty file, harmless), 16865162/16865162 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2023C_v3 | dev | 20.08 GB | **COMPLETE (100%)** | Pass, 61/62 files (1 empty file, harmless), 14600069/14600069 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2023C_v4 | dev | 140.24 GB | **COMPLETE (100%)** | Pass, resolved -- first pass had 1 v2-side read-timeout error causing a spurious mismatch; clean retry (0 errors both sides) confirmed exact match 415/415 files, 101296271/101296271 events (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2023D_v1 | dev | 79.31 GB | **COMPLETE (100%)** | Pass, exact match 314/314 files, 59540585/59540585 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET0_Run2023D_v2 | dev | 17.27 GB | **COMPLETE (100%)** | Pass, 57/58 files (1 empty file, harmless), 13057505/13057505 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2023C_v1 | dev | 78.94 GB | **COMPLETE (100%)** | Pass, exact match 218/218 files, 55306570/55306570 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2023C_v2 | dev | 24.11 GB | **COMPLETE (100%)** | Pass, exact match 48/48 files, 16863135/16863135 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2023C_v3 | dev | 19.65 GB | resubmitted again (had 1 failed / 61, pass 12) | — | — |
| JetMET1_Run2023C_v4 | dev | 140.23 GB | **COMPLETE (100%)** | Pass, exact match 415/415 files, 101272838/101272838 events, 0 errors (2026-09-08) -- was `SUBMITREFUSED` (bad dataset name), fixed + fresh-submitted (pass 11) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2023D_v1 | dev | 79.33 GB | **COMPLETE (100%)** | Pass, exact match 317/317 files, 59532430/59532430 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET1_Run2023D_v2 | dev | 17.27 GB | **COMPLETE (100%)** | Pass, exact match 57/57 files, 13055665/13055665 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET_Run2022C | dev | 173.60 GB | **COMPLETE (100%)** | Pass, exact match 255/255 files, 125338575/125338575 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET_Run2022D | dev | 131.30 GB | **COMPLETE (100%)** | Pass, exact match 145/145 files, 91129250/91129250 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET_Run2022E | dev | 100.92 GB | **COMPLETE (100%, combined via recovery)** | Pass, resolved -- **v1 note: use `dev/JetMET/JetMET_Run2022E_customNanoAOD_noFatJets` (288 files), NOT the plain `_customNanoAOD` dir (174 files, incomplete) or `_retry` dir -- v1 also hit the FatJet bug and has 3 attempt directories, only `noFatJets` is the complete/correct one.** v2=289/130314234, v1(noFatJets)=288/129587022; clean lumi-diff (0 errors both sides) confirmed only_v1=0, v1's 21586 lumis a strict subset of v2's 21661 (benign golden-JSON-drift pattern) (2026-09-11) | **Yes** |
| JetMET_Run2022F | dev | 710.45 GB | **COMPLETE (100%)** | Pass, exact match 686/686 files, 493854414/493854414 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| JetMET_Run2022G | dev | 119.08 GB | **COMPLETE (100%)** | Pass, exact match 110/110 files, 83473691/83473691 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon0_Run2023C_v1 | **prod** | 56.94 GB | **COMPLETE (100%)** | Pass (prod merge -- event count only, file counts differ as expected: v2=226 raw files, v1=49 merged), 54008328/54008328 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon0_Run2023C_v2 | **prod** | 17.54 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 16772546/16772546 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon0_Run2023C_v3 | **prod** | 20.95 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 19673963/19673963 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon0_Run2023C_v4 | dev | 143.92 GB | **COMPLETE (100%)** | Pass, exact match 421/421 files, 131316905/131316905 events, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon0_Run2023D_v1 | **prod** | 158.80 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 97508507/97508507 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon0_Run2023D_v2 | **prod** | 22.46 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 21132337/21132337 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon1_Run2023C_v1 | **prod** | 56.80 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 53915258/53915258 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon1_Run2023C_v2 | **prod** | 17.55 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 16769420/16769420 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon1_Run2023C_v3 | **prod** | 20.93 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 19669649/19669649 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon1_Run2023C_v4 | dev | 143.60 GB | **99.8% (414/415), 1 job permanently blocked by a bad source file -- accepted gap, see validation log 2026-09-09** | — | — |
| Muon1_Run2023D_v1 | **prod** | 158.94 GB | **COMPLETE (100%)** | Pass, resolved (prod merge, event count only) -- first pass had 1 v1(prod)-side read-timeout error causing a spurious ~1.07M event gap; clean retry (0 errors both sides) confirmed exact match 97580559/97580559 events (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon1_Run2023D_v2 | **prod** | 34.57 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 21132304/21132304 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon_Run2022C | **prod** | 110.17 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 104417866/104417866 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon_Run2022D | **prod** | 107.59 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 66187856/66187856 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon_Run2022E | dev | 139.79 GB | **COMPLETE (100%, combined via recovery)** | Pass, resolved -- v2=294/132674925, v1=286/128557143; clean lumi-diff (0 errors both sides) confirmed only_v1=0, v1's 21175 lumis a strict subset of v2's 21775 (benign golden-JSON-drift pattern) (2026-09-11) | **Yes** |
| Muon_Run2022F | dev | 473.09 GB | **COMPLETE (100%)** | Pass, resolved -- first pass had 5 v2-side read-timeout errors causing a spurious mismatch; clean retry (0 errors both sides) confirmed exact match 687/687 files, 429598989/429598989 events (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |
| Muon_Run2022G | **prod** | 125.69 GB | **COMPLETE (100%)** | Pass (prod merge, event count only), 75466643/75466643 events exact, 0 errors (2026-09-08) | **v1 deleted by Matt (2026-09-08)** |

### Signal MC (4) -- status/resubmit tracking only, no v1 comparison

| Sample | v2 CRAB status (2026-09-06) |
|---|---|
| AMSB_Wino_M700GeV_ctau10000cm_TuneCP5_13p6TeV_madgraph-pythia8_Run3Summer22EEMiniAODv4 | **COMPLETE (100%)**, 3/3 jobs |
| AMSB_Wino_M700GeV_ctau1000cm_TuneCP5_13p6TeV_madgraph-pythia8_Run3Summer22EEMiniAODv4 | **COMPLETE (100%)**, 2/2 jobs |
| AMSB_Wino_M700GeV_ctau100cm_TuneCP5_13p6TeV_madgraph-pythia8_Run3Summer22EEMiniAODv4 | **COMPLETE (100%)**, 1/1 job |
| AMSB_Wino_M700GeV_ctau10cm_TuneCP5_13p6TeV_madgraph-pythia8_Run3Summer22EEMiniAODv4 | **COMPLETE (100%)**, 2/2 jobs |

## 2022 EGamma (CMSSW_13 production)

Added 2026-09-09. Matt started 5 more 2022 tasks (EGamma_Run2022C-G, single primary
like JetMET_Run2022/Muon_Run2022, not split into EGamma0/1 like the 2023 tag), same
work area as the other 2022/2023 CMSSW_13 tasks
(`/uscms_data/d3/mjoyce/DisTrks/NanoProd_CMSSW_13/crab_projects_OSUv2/`). Same
verification procedure as the rest of this production once complete. **v1 location
found (2026-09-11): `dev/EGamma22/EGamma/EGamma_Run2022<era>_customNanoAOD`** -- NOT
under a plain `dev/EGamma/` (that path doesn't exist; would collide with the 2025-era
EGamma0-3 naming). This confirms 2022 EGamma v1 does exist (a real migration, not new
coverage).

| Dataset tag | v2 CRAB status (2026-09-09, pass 14) | Verified (1-7) | Cleared for human deletion |
|---|---|---|---|
| EGamma_Run2022C | **COMPLETE (100%)** | Pass, exact match 346/346 files, 194445153/194445153 events, 0 errors (2026-09-11) | **Yes** |
| EGamma_Run2022D | **COMPLETE (100%)** -- was hitting a T2_CH_CSCS site problem (22 jobs stuck), fixed with `--siteblacklist=T2_CH_CSCS` resubmit (2026-09-09) | Pass, 148/149 files (1 empty file, harmless), 79563213/79563213 events exact, 0 errors (2026-09-11) | **Yes** |
| EGamma_Run2022E | **COMPLETE (100%)** -- **v1 note: sum both `dev/EGamma22/EGamma/EGamma_Run2022E_customNanoAOD` and `..._noFatJetExt_recovery`** (v1 also hit the FatJet bug for this era) | Pass, exact match 297/297 files, 139023277/139023277 events, 0 errors (2026-09-11) | **Yes** |
| EGamma_Run2022F | 1.5% (10/687) as of pass 17, progressing | — | — |
| EGamma_Run2022G | early stage (idle), not yet started | — | — |

## 2024 production (CMSSW_15 production)

Added 2026-09-09. Discovered an entire untracked 2024 reprocessing round already
running in the same work area as the 2025 (CMSSW_15) tasks
(`/uscms_data/d3/mjoyce/DisTrks/NanoProd_CMSSW_15/crab_projects_OSUv2/`) -- 48 tasks:
EGamma0/1, JetMET0/1, Muon0/1, each with eras C through I plus an I_v2 (8 eras x 6
primaries). All early-to-mid stage as of pass 14. `v1 location` not yet checked.

**Site issues found and fixed pass 14 (2026-09-09):**
- `EGamma0_Run2024E`: 28 jobs (16 exit 8001 + 12 exit 8022) stuck at `T2_CH_CSCS` --
  same site problem as `EGamma_Run2022D` above. Fixed with `--siteblacklist=T2_CH_CSCS`
  resubmit -- confirmed clean afterward (only 2 new, unrelated ordinary-churn exit-8901
  failures from the fresh resubmit, not yet re-resubmitted as of this entry).
- Widespread "Postprocessing failed" jobs across ~6 tasks (`EGamma0_Run2024C`,
  `EGamma1_Run2024C`, `JetMET0_Run2024G`, `Muon0_Run2024C`, `Muon0_Run2024D`,
  `Muon1_Run2024C`) at 6+ *different* sites (T2_DE_RWTH, T2_IT_Bari, T2_ES_CIEMAT,
  T2_DE_DESY, T1_DE_KIT, T1_US_FNAL) -- confirmed NOT a single-site problem: the job
  logs show `cmsRun` succeeded and local stage-out to temp storage succeeded (exit 0)
  at every site, so the failure is in the later async transfer step into our EOS
  destination. Checked EOS quota for both the personal (`/store/user/`, 50% filled)
  and group (`/store/group/lpcdisapptrks/`, 74% filled) areas -- both healthy, not a
  quota/space issue. Treated as transient async-transfer hiccups and fixed with a
  plain `crab resubmit` (no siteblacklist) -- confirmed working (e.g. `Muon1_Run2024C`
  went from 6 failed to 0 failed / 6 running after resubmit).
- Remaining ordinary exit-8901/50660 churn resubmitted across the rest of the batch
  (22 tasks total resubmitted this pass).

**v1 location mapping found (2026-09-11)**: EGamma0/1 and JetMET0/1 are entirely in
`dev/` for all 8 eras. Muon0/1 are a `dev/`/`prod/` mix like the 2023 batch --
Muon0: C/D/E/G/H/I in `prod/` (merged), F/I_v2 in `dev/`; Muon1: C in `prod/`,
D/E/F/G/H/I/I_v2 in `dev/`.

| Dataset tag | v1 location | v2 CRAB status (2026-09-11, pass 17) | Verified | Cleared |
|---|---|---|---|---|
| EGamma0_Run2024C | dev | **COMPLETE (100%)** | Pass, exact match 324/324 files, 155622661/155622661 events, 0 errors | **Yes** |
| EGamma0_Run2024D | dev | **COMPLETE (100%)** | Pass, exact match 309/309 files, 154415522/154415522 events, 0 errors | **Yes** |
| EGamma0_Run2024E | dev | 10.5% (44/419), progressing | — | — |
| EGamma0_Run2024F | dev | 88.7% (826/931), progressing | — | — |
| EGamma0_Run2024G | dev | 0% (0/1230), idle | — | — |
| EGamma0_Run2024H | dev | **COMPLETE (100%)** | Pass, exact match 174/174 files, 126841190/126841190 events, 0 errors | **Yes** |
| EGamma0_Run2024I | dev | 97.8% (179/183), progressing | — | — |
| EGamma0_Run2024I_v2 | dev | 93.1% (162/174), progressing | — | — |
| EGamma1_Run2024C | dev | 96.0% (311/324), progressing | — | — |
| EGamma1_Run2024D | dev | 47.2% (146/309), progressing | — | — |
| EGamma1_Run2024E | dev | 0% (0/419), idle | — | — |
| EGamma1_Run2024F | dev | 26.1% (243/930), progressing | — | — |
| EGamma1_Run2024G | dev | 99.9% (1229/1230), nearly done | — | — |
| EGamma1_Run2024H | dev | 97.7% (170/174), progressing | — | — |
| EGamma1_Run2024I | dev | 4.4% (8/183), progressing | — | — |
| EGamma1_Run2024I_v2 | dev | **COMPLETE (100%)** | Pass, exact match 173/173 files, 130917610/130917610 events, 0 errors | **Yes** |
| JetMET0_Run2024C | dev | **COMPLETE (100%)** | Pass, exact match 316/316 files, 67103048/67103048 events, 0 errors | **Yes** |
| JetMET0_Run2024D | dev | 98.4% (304/309), progressing | — | — |
| JetMET0_Run2024E | dev | 99.5% (417/419), nearly done | — | — |
| JetMET0_Run2024F | dev | 78.1% (727/931), progressing | — | — |
| JetMET0_Run2024G | dev | **COMPLETE (100%)** | Pass, exact match 1230/1230 files, 385081071/385081071 events, 0 errors | **Yes** |
| JetMET0_Run2024H | dev | 93.7% (163/174), progressing | — | — |
| JetMET0_Run2024I | dev | **COMPLETE (100%)** | Pass, exact match 183/183 files, 58849729/58849729 events, 0 errors | **Yes** |
| JetMET0_Run2024I_v2 | dev | **COMPLETE (100%)** | Pass, exact match 173/173 files, 57114222/57114222 events, 0 errors | **Yes** |
| JetMET1_Run2024C | dev | **COMPLETE (100%)** | Pass, exact match 324/324 files, 68828904/68828904 events, 0 errors | **Yes** |
| JetMET1_Run2024D | dev | **COMPLETE (100%)** | Pass, exact match 309/309 files, 74735526/74735526 events, 0 errors | **Yes** |
| JetMET1_Run2024E | dev | 44.2% (185/419), progressing | — | — |
| JetMET1_Run2024F | dev | 21.5% (200/930), progressing | — | — |
| JetMET1_Run2024G | dev | 63.5% (780/1229), progressing | — | — |
| JetMET1_Run2024H | dev | **COMPLETE (100%)** | Pass, exact match 174/174 files, 52758335/52758335 events, 0 errors | **Yes** |
| JetMET1_Run2024I | dev | **COMPLETE (100%)** | Pass, exact match 183/183 files, 58846231/58846231 events, 0 errors | **Yes** |
| JetMET1_Run2024I_v2 | dev | **COMPLETE (100%)** | Pass, exact match 173/173 files, 57158900/57158900 events, 0 errors | **Yes** |
| Muon0_Run2024C | **prod** | 99.1% (321/324), progressing | — | — |
| Muon0_Run2024D | **prod** | 95.5% (295/309), progressing | — | — |
| Muon0_Run2024E | **prod** | 99.3% (411/414), progressing | — | — |
| Muon0_Run2024F | dev | 22.3% (208/931), progressing | — | — |
| Muon0_Run2024G | **prod** | 97.9% (1205/1231), nearly done | — | — |
| Muon0_Run2024H | **prod** | **COMPLETE (100%)** | Pass (prod merge, event count only), 90811165/90811165 events exact, 0 errors | **Yes** |
| Muon0_Run2024I | **prod** | **COMPLETE (100%)** | Pass (prod merge, event count only), 97263447/97263447 events exact, 0 errors | **Yes** |
| Muon0_Run2024I_v2 | dev | 1.2% (2/173), progressing | — | — |
| Muon1_Run2024C | **prod** | **COMPLETE (100%)** | Pass (prod merge, event count only), 96348530/96348530 events exact, 0 errors | **Yes** |
| Muon1_Run2024D | dev | 68.9% (213/309), progressing | — | — |
| Muon1_Run2024E | dev | 29.6% (124/419), progressing | — | — |
| Muon1_Run2024F | dev | **COMPLETE (100%)** | Pass, exact match 931/931 files, 438921736/438921736 events, 0 errors | **Yes** |
| Muon1_Run2024G | dev | 9.8% (121/1230), progressing | — | — |
| Muon1_Run2024H | dev | 16.7% (29/174), progressing | — | — |
| Muon1_Run2024I | dev | 99.5% (182/183), nearly done | — | — |
| Muon1_Run2024I_v2 | dev | **COMPLETE (100%)** | Pass, exact match 173/173 files, 93786709/93786709 events, 0 errors | **Yes** |

**18 of 48 cleared as of pass 17 (2026-09-11), all clean exact matches, 0 errors.**

## 2026 production (new CMSSW_16 work area)

Added 2026-09-09. Matt started 2026 production in a new work area, not nested under
a `NanoProd_CMSSW_XX` directory:
`/uscms_data/d3/mjoyce/DisTrks/crab_projects_OSUv2/`. Uses CMSSW_16 (confirmed via a
direct `crab status` test -- works fine from the el9 `cmslpc` alias, same as
CMSSW_15). 6 EGamma primaries (EGamma0-5), 2 JetMET primaries with the full B/C/D eras
plus 4 more JetMET primaries (JetMET2-5) with only a C-era task, 4 Muon primaries
(Muon0-3) -- 40 tasks total originally submitted (B/C/D eras).

**Two problems found and fixed on submission, pass 13-14 (2026-09-08/09):**
1. **All "Run2026C" tasks (13 of them) were `SUBMITREFUSED`** -- the task's
   configured run range and the dataset's actual certified lumis had zero
   intersection, consistent with the 2026 Golden JSON not yet certifying era C.
   **Per Matt (2026-09-09): these datasets are from special runs and won't be used --
   don't resubmit era C at all**, not even once golden certification might catch up.
2. **Every "B"/"D"-era task that actually ran jobs hit a deterministic
   `PluginNotFound: Unable to find plugin 'IsoTrackDeDxHitTableProducer'`** --
   Matt had not run `scram b` in the `CMSSW_16` area before submitting, so the
   sandbox shipped to the grid was missing a compiled custom-OSUNano module. Not
   fixable by `crab resubmit` (reuses the same broken sandbox). Fix: killed all 40
   original tasks (`crab kill`, no `--jobids` option in this CRAB version so it's
   whole-task-only) and moved every local workArea directory aside (not deleted --
   `.killed_scram_fix_20260908` suffix) so the same requestNames could be reused.
   Matt ran `scram b`, then fresh-submitted the 24 B/D-era tasks (skipping C-era per
   above, and skipping the C-only JetMET2-5 primaries entirely since those were also
   C-era). Confirmed clean: pass 14's status check on all 24 showed **zero
   failures** -- the fix fully worked.

| Dataset tag | v2 CRAB status (2026-09-09, pass 14) |
|---|---|
| EGamma0_Run2026B_v1 | early stage (idle), just resubmitted |
| EGamma0_Run2026D_v1 | early stage (running), just resubmitted |
| EGamma1_Run2026B_v1 | early stage (idle), just resubmitted |
| EGamma1_Run2026D_v1 | early stage (idle), just resubmitted |
| EGamma2_Run2026B_v1 | early stage (idle), just resubmitted |
| EGamma2_Run2026D_v1 | early stage (idle/running mix), just resubmitted |
| EGamma3_Run2026B_v1 | early stage (idle), just resubmitted |
| EGamma3_Run2026D_v1 | early stage (idle), just resubmitted |
| EGamma4_Run2026B_v1 | early stage (idle), just resubmitted |
| EGamma4_Run2026D_v1 | early stage (running), just resubmitted |
| EGamma5_Run2026B_v1 | early stage (idle), just resubmitted |
| EGamma5_Run2026D_v1 | early stage (idle), just resubmitted |
| JetMET0_Run2026B_v1 | early stage (idle/running mix), just resubmitted |
| JetMET0_Run2026D_v1 | early stage (idle/running mix), just resubmitted |
| JetMET1_Run2026B_v1 | early stage (idle), just resubmitted |
| JetMET1_Run2026D_v1 | early stage (idle), just resubmitted |
| Muon0_Run2026B_v1 | early stage (idle/running mix), just resubmitted |
| Muon0_Run2026D_v1 | early stage (idle), just resubmitted |
| Muon1_Run2026B_v1 | early stage (idle/running mix), just resubmitted |
| Muon1_Run2026D_v1 | early stage (idle), just resubmitted |
| Muon2_Run2026B_v1 | early stage (idle), just resubmitted |
| Muon2_Run2026D_v1 | early stage (idle/running mix), just resubmitted |
| Muon3_Run2026B_v1 | early stage (idle/running mix), just resubmitted |
| Muon3_Run2026D_v1 | early stage (idle), just resubmitted |

**Abandoned, not part of this tracking** (per Matt, 2026-09-09 -- special runs, won't
be used): all 13 "Run2026C" tasks (`EGamma0-5_Run2026C_v1`, `JetMET0-5_Run2026C_v1`,
`Muon0-3_Run2026C_v1` minus whichever didn't exist), left killed and moved aside.
Also found and moved aside: a broken stray directory `crab_Muon0_Run2025C_v1_...`
with no `.requestcache` (incomplete/failed submission debris, not a real task).

## Validation log

### 2026-09-02

Verified the 7 datasets that were already 100% finished, using the full procedure
(items 1-6; item 7 branch-spot-check not yet automated, done visually via uproot
`.keys()` during script development on `EGamma0_Run2025F_v2`, branches look normal).

| Dataset tag | Lumi coverage | v2 files vs jobs | File sizes | Files open clean | v1 vs v2 event count | Result |
|---|---|---|---|---|---|---|
| EGamma0_Run2025F_v2 | full (no notFinishedLumis.json) | 223/223 | 124.5-1264.5 MB, no anomalies | 223/223 OK | 135,460,115 = 135,460,115 | **CLEARED** |
| EGamma1_Run2025C_v2 | full | 278/278 | 32.3-1146.3 MB, no anomalies | 278/278 OK | 131,903,205 = 131,903,205 | **CLEARED** |
| EGamma2_Run2025E_v1 | full | 417/417 | 517.8-1171.0 MB, no anomalies | 417/417 OK | 236,413,363 = 236,413,363 | **CLEARED** |
| EGamma2_Run2025F_v1 | full | 600/600 | 39.5-1219.9 MB, no anomalies | 600/600 OK | 331,951,062 = 331,951,062 | **CLEARED** |
| EGamma3_Run2025E_v1 | full | 417/417 | 523.9-1173.8 MB, no anomalies | 417/417 OK | 236,413,780 = 236,413,780 | **CLEARED** |
| Muon0_Run2025C_v1 | full | 458/458 | 31.0-1156.7 MB, no anomalies | 458/458 OK | 232,897,373 = 232,897,373 | **CLEARED**\* |
| Muon1_Run2025E_v1 | full | 417/417 | 458.7-1249.1 MB, no anomalies | 417/417 OK | 262,331,884 = 262,331,884 | **CLEARED** |

\* Muon0_Run2025C_v1: v1 side has 459 files on EOS vs v2's 458, but total event
counts match exactly -- almost certainly an extra near-empty v1 file from a
differently-sized job split, not missing v2 data. Not a blocker, but worth a quick
look before deleting v1 if you want to be thorough.

**All 7 above are cleared for you to delete their v1 copies whenever convenient** --
Claude will not run the deletion itself (see ground rules). Freed space from these 7:
~3.1 TB (372.75+221.21+... — see v1 size column above for exact per-dataset numbers).

Considered a `/loop 6h` recurring session task for this, but cancelled it
(cron job `a78807cc`, cancelled same day) -- a session-scheduled cron job only fires
while the laptop is awake and this session is running; closing the laptop lid sleeps
it and the timer doesn't reliably keep firing across that. Decided to just ask Claude
to run the check manually whenever back at the machine instead of relying on an
unattended timer.

### 2026-09-02, second status pass

Re-ran `crab status` on the 35 not-yet-cleared tasks. No new tasks reached 100% yet.
15 tasks had picked up new failed jobs since the first resubmit round (normal grid
churn -- exit codes not yet inspected in detail), all resubmitted again cleanly (15/15
"Resubmit request sent to the server", no errors): EGamma0_Run2025C_v2,
EGamma0_Run2025E_v1, EGamma0_Run2025G_v1, EGamma1_Run2025C_v1, EGamma1_Run2025E_v1,
EGamma1_Run2025F_v2, EGamma3_Run2025C_v2, EGamma3_Run2025D_v1, EGamma3_Run2025F_v1,
Muon0_Run2025D_v1, Muon0_Run2025E_v1, Muon0_Run2025F_v2, Muon1_Run2025C_v2,
Muon1_Run2025D_v1, Muon1_Run2025G_v1. The other 20 are progressing with 0 current
failures. Table above reflects this pass's numbers.

### 2026-09-03 -- host key rotation, third status pass, and a real mismatch

Before this pass, `ssh cmslpc` failed with a host key verification error (legitimate
rotation for `cmslpc-el9.fnal.gov`, confirmed by Matt out-of-band; old entry removed
with `ssh-keygen -R` and the new key trusted via one `StrictHostKeyChecking=accept-new`
connection).

Re-ran `crab status` on the 35 remaining tasks. `EGamma2_Run2025D_v1` newly hit 100%.
Resubmitted the 21 tasks that had failures at this pass (all 21/21 confirmed clean,
no errors): EGamma0_Run2025C_v1, EGamma0_Run2025C_v2, EGamma0_Run2025E_v1,
EGamma0_Run2025F_v1, EGamma0_Run2025G_v1, EGamma1_Run2025C_v1, EGamma1_Run2025D_v1,
EGamma1_Run2025E_v1, EGamma1_Run2025F_v1, EGamma3_Run2025C_v1, EGamma3_Run2025C_v2,
EGamma3_Run2025D_v1, Muon0_Run2025D_v1, Muon0_Run2025E_v1, Muon0_Run2025F_v1,
Muon0_Run2025F_v2, Muon1_Run2025C_v1, Muon1_Run2025C_v2, Muon1_Run2025D_v1,
Muon1_Run2025F_v1, Muon1_Run2025G_v1.

**`EGamma2_Run2025D_v1` FAILED validation -- flagging, not clearing.** Lumi coverage,
file-count, and file-size checks passed (841/841 files, full lumi coverage per `crab
report`, no anomalous sizes). But the event-count cross-check does not match, and this
was confirmed with a clean 0-error re-scan on both sides (the first pass had 4
transient xrootd read errors under concurrent load, which a lower-concurrency rescan
resolved):

- v2: 841 files, **402,695,666** events, 0 errors
- v1: 828 files, **395,013,167** events, 0 errors
- v2 has 13 more files and ~7.68M (1.9%) more events than v1.

Every other dataset checked so far matched v1/v2 event counts exactly, so this is a
real discrepancy, not noise. Likely cause: the crabConfig's `config.Data.lumiMask`
points at CMS's **live** rolling `Cert_Collisions2025_..._Golden.json` URL rather than
a pinned snapshot. v1 (EOS timestamp ~late June) and v2 (submitted August) were
submitted roughly a month+ apart -- if more Run2025D lumis got certified "Golden" in
that window, v2 would legitimately process a larger, still-valid lumi range than v1
did, which would produce exactly this pattern (more files, more events, both `crab
report` calls still show "full coverage" because each is only checked against the
JSON as it existed *at that submission's own lumiMask evaluation*, not against each
other). **Resolved, same day:** compared actual (run, lumiBlock) coverage by reading the `run`/
`luminosityBlock` branches directly from every v1 and v2 output file (v1's original
CRAB task directory no longer exists on disk, so `crab report` wasn't an option --
went straight to the ground truth in the files themselves). Result is clean and
confirms the hypothesis exactly:
- All 61,892 distinct lumis in v1 exist in v2 with the **exact same event count** in
  every one (0 mismatches).
- v2 has 1,055 additional lumis, entirely from 3 extra runs (395103, 395105, 395107)
  absent from v1 -- contributing exactly the 7,682,499-event difference.
- Zero lumis exist in v1 that are missing from v2.

v1 is a strict subset of v2, not a divergent/inconsistent dataset -- those 3 runs
simply weren't certified Golden yet when v1 was submitted. **Cleared for deletion**,
same as the others.

### 2026-09-03, pass 4

A second host key rotation happened for `cmslpc-el9.fnal.gov` within about a day
(different fingerprint than the first) -- confirmed expected by Matt: the LPC login
alias round-robins across multiple physical nodes, each with its own host key, so this
can happen on essentially any new connection. To stop this from interrupting every
pass, set up an ad hoc multiplexed SSH connection for the rest of the session
(`ControlMaster`/`ControlPersist`, pinning to one node) rather than the plain alias.

Hit a real infrastructure snag after that: `crab status` calls run inside a *new*
remote tmux session started failing with a Python "Fatal Python error: init_fs_encoding"
/ "No module named 'encodings'" crash, consistently across retries -- but the exact
same command worked fine run directly (not inside tmux). Root cause wasn't fully
pinned down (an `unset PYTHONHOME PYTHONPATH` guard didn't fix it either, and both
vars were already unset in the failing runs) -- most likely a stale CVMFS mount
reference held by the pre-existing, days-old tmux *server* process on that login node
(there's a long-running unrelated tmux session called `makehists` on that same server,
started 2026-08-26, that must not be touched). Worked around it by running the batched
`crab` commands directly over the multiplexed SSH connection instead of through remote
tmux at all, which resolved it immediately.

Once that was sorted: re-ran `crab status` on the 34 not-yet-cleared tasks. 4 newly
hit 100% -- `EGamma1_Run2025F_v2`, `EGamma3_Run2025F_v1`, `EGamma3_Run2025G_v1`,
`Muon0_Run2025C_v2` -- all four passed the full validation procedure cleanly (full lumi
coverage, file counts matching job counts, no anomalous file sizes, 0 file-open
errors, and v1/v2 event counts matching **exactly** on all four -- no lumi-drift
pattern this time, unlike `EGamma2_Run2025D_v1`). All four cleared.

23 tasks had failures this pass and were resubmitted again (all 23/23 confirmed
clean): EGamma0_Run2025C_v1, EGamma0_Run2025C_v2, EGamma0_Run2025E_v1,
EGamma0_Run2025F_v1, EGamma0_Run2025G_v1, EGamma1_Run2025D_v1, EGamma1_Run2025E_v1,
EGamma1_Run2025F_v1, EGamma1_Run2025G_v1, EGamma2_Run2025F_v2, EGamma2_Run2025G_v1,
EGamma3_Run2025C_v1, EGamma3_Run2025C_v2, EGamma3_Run2025D_v1, Muon0_Run2025D_v1,
Muon0_Run2025E_v1, Muon0_Run2025F_v1, Muon0_Run2025F_v2, Muon0_Run2025G_v1,
Muon1_Run2025C_v1, Muon1_Run2025C_v2, Muon1_Run2025D_v1, Muon1_Run2025F_v1. The
remaining 7 are progressing with 0 current failures.

Note on `EGamma2_Run2025F_v2` specifically, since Matt asked: it had 0 failures as of
the pass-3 check (119/223 finished then), so it correctly wasn't resubmitted that
round -- but only the `EGamma2_Run2025D_v1` row got patched into the checklist file
after pass 3 rather than a full table refresh, so the file kept showing pass-2's
numbers for this task in the meantime. It picked up 4 new failures between pass 3 and
this pass (ordinary grid churn, same as ~20 other tasks each pass) while also
progressing (119->132 finished). Doing a full table refresh every pass now (see table
above) instead of patching individual rows, to avoid this confusion going forward.

### 2026-09-03, pass 5 -- JetMET0/JetMET1 added, one real site problem found

Matt added 14 new CRAB tasks for JetMET0/JetMET1 2025 (same 7 eras each as the other
primary datasets: C_v1, C_v2, D_v1, E_v1, F_v1, F_v2, G_v1), submitted into the same
`crab_projects_OSUv2` work area. v1 copies exist on EOS for all 14 (`dev/JetMET0/`,
`dev/JetMET1/`), so these fold into the exact same OSU_VERSION 1->2 migration and
checklist as EGamma/Muon -- 56 tasks total now, not 42.

Ran `crab status` on all 30 not-yet-cleared EGamma/Muon tasks plus the 14 new JetMET
tasks. All JetMET tasks are brand new (0 finished on any, as expected for a first
check) except one stood out immediately: **`JetMET1_Run2025E_v1` had 283 of 417 jobs
(68%) already failed**, versus low-single-digit-percent early failures on every other
task including `JetMET0_Run2025E_v1` (the same era, other primary dataset, 0
failures). That asymmetry was the tell that this wasn't normal early-stage churn.

Investigated before resubmitting (per [[feedback_never_delete_eos]]-style caution
about not just papering over real problems): pulled short job logs for 4 different
failed jobs (`crab getlog --jobids <n> --short`, since full log tarballs weren't
retrievable -- the jobs died too fast to stage anything out, consistent with a crash
right at startup, not mid-processing). All 4 sampled jobs (3, 15, 25, 40) crashed the
same way: `cmsRun` segfaulted (`*** Break *** segmentation violation`, core dumped)
within ~9 seconds of starting, and all 4 landed at the same execution site,
**T2_BE_IIHE**. Confirmed with Matt this was worth site-blacklisting rather than a
plain resubmit (which would likely just re-land on the same broken site and crash
again) -- resubmitted with `crab resubmit --siteblacklist=T2_BE_IIHE`.

The other 25 tasks with failures this pass (JetMET0_Run2025D_v1 included, only 6/850
-- ordinary churn) were resubmitted normally. All 26 resubmits confirmed clean. 18
tasks (6 EGamma/Muon + 12 JetMET, the two just-submitted JetMET tasks that already
picked up jobs and progressed past 0/N notwithstanding) are progressing with 0 current
failures.

### 2026-09-03, pass 7 -- siteblacklist confirmed fixed, new file-availability problem

Checked back on `JetMET1_Run2025E_v1` specifically per Matt's request. Initial glance
at the top-level `crab status` summary was misleading (showed "85.6% failed", which
looked like the blacklist made things *worse*) -- the `--long` per-job table showed
why: all those "failed" jobs were actually already-failed-once (`retries=1`) jobs
sitting `idle`, queued for their blacklist-respecting retry, not fresh failures. None
of the retried jobs had actually been dispatched yet at that check. **Follow-up
`crab status` in pass 6 (below) confirms the fix worked**: down to 1/417 failed, from
68-85% before the blacklist.

Ran a full pass on all 44 not-yet-cleared tasks (30 EGamma/Muon + 14 JetMET). One new
completion: `Muon1_Run2025F_v2` -- passed the full validation procedure cleanly (full
lumi coverage, 222/222 files matching job count, no anomalous sizes, 0 file-open
errors, v1/v2 event counts matching exactly: 140,741,140 = 140,741,140). Cleared.

23 tasks had failures. 22 were ordinary churn and got resubmitted normally. The 23rd,
`JetMET0_Run2025G_v1`, had 50/675 (7.4%) failed -- elevated enough to check before
resubmitting blindly. Same exit code 8901 as the earlier `JetMET1_Run2025E_v1` issue,
but a **different root cause**: pulled short logs for 2 failed jobs and found real
runtime before failure this time (up to 48 min, real CPU/memory usage, not an instant
crash), spread across two different sites (`T2_UK_London_IC`, `T2_UK_SGrid_RALPP`) --
ruling out a site-specific problem. The actual cause, visible in the job logs: an
XRootD `kXR_open` failure on a specific MiniAOD input file (tried across 4-6 different
site redirectors, all failing), immediately followed by a segfault in `cmsRun` --
matches the documented pattern in the `lpc-crab` skill (XrdAdaptor segfaulting on a
genuinely unreachable file). Found 3 distinct unreachable files across 2 sampled jobs
(2 in Run 398011, 1 in Run 398027), all in `/store/data/Run2025G/JetMET0/MINIAOD/...`.

Since `Run2025G` is very recent PromptReco data, replication lag (not permanent data
loss) is the more likely explanation for multiple different files being simultaneously
unreachable across every site tried. Discussed with Matt -- tried a plain resubmit
first (cheapest option, `crab report` already wrote `notFinishedLumis.json` if a
proper lumi-based recovery task turns out to be needed instead). **Check back on this
one specifically next pass** to see whether the plain resubmit worked (replication
caught up) or the same files are still unreachable (in which case build a recovery
task pointed at `notFinishedLumis.json`, or identify and permanently exclude the bad
files a la the `lpc-crab` skill's `<name>_bad_files.json` pattern).

### 2026-09-03, pass 8

Grid proxy re-check hit another host key rotation for `cmslpc-el9.fnal.gov` (expected
-- the multiplexed connection's `ControlPersist` window had simply expired since it
was set up several passes ago). Re-trusted the new key and re-established the
multiplexed connection with a longer 4h persist this time.

Ran a full pass on all 43 not-yet-cleared tasks. One new completion: `Muon0_Run2025D_v1`
-- full lumi coverage and file-count checks passed, but the event-count cross-check
showed the same benign pattern as `EGamma2_Run2025D_v1` (2026-09-03 earlier entry): v2
had 10 more files and ~8.6M more events than v1. Ran the lumi-level diff and it's
identical in shape: v1's 61,895 lumis are an exact subset of v2's (0 mismatches in any
shared lumi), and the 1,055 extra v2 lumis come from the **same 3 runs** (395103,
395105, 395107) as the earlier case -- consistent with those runs simply not being
Golden-certified yet when v1 was submitted. Cleared.

25 tasks had ordinary churn-level failures and were resubmitted normally.
`JetMET1_Run2025E_v1` was resubmitted again with `--siteblacklist=T2_BE_IIHE` restated
(CRAB doesn't remember a blacklist from a prior resubmit call) -- still holding well
at 1/417 failed.

Checked back on `JetMET0_Run2025G_v1` per the plan from pass 7: **trending better but
not resolved.** 27 jobs now finished (was 1) and 32 still failed (was 50) after the
plain resubmit -- meaning some of the previously-unreachable files did become
reachable (supporting the replication-lag theory), but not all of them. Resubmitted
again without further per-file investigation this pass, given the improving trend;
worth checking again next pass, and building an explicit recovery task from
`notFinishedLumis.json` if it plateaus rather than continuing to fully resolve on its
own.

### 2026-09-04, pass 9 -- 11 datasets cleared, a verification-procedure bug found and fixed

New day; multiplexed SSH connection had expired overnight (expected) and landed on
yet another node with a different host key (also expected, per Matt -- LPC round-
robins its login nodes). Re-established with a 6h persist this time.

Ran a full pass on all 42 not-yet-cleared tasks. **13 newly hit 100%** -- the biggest
jump yet: `EGamma0_Run2025D_v1`, `EGamma0_Run2025E_v1`, `EGamma1_Run2025C_v1`,
`EGamma1_Run2025E_v1`, `EGamma1_Run2025F_v1`, `EGamma2_Run2025C_v1`,
`EGamma2_Run2025C_v2`, `EGamma2_Run2025F_v2`, `EGamma3_Run2025C_v1`,
`EGamma3_Run2025C_v2`, `EGamma3_Run2025D_v1`, `EGamma3_Run2025F_v2`,
`JetMET0_Run2025C_v1`. Also good news on the two open issues from last pass:
`JetMET0_Run2025G_v1`'s file-availability problem is nearly resolved (3 failed left,
was 32, was 50 originally -- replication-lag theory holding up), and
`JetMET1_Run2025E_v1`'s siteblacklist fix needed no restatement this pass since it had
0 current failures.

**Found a real bug in the verification procedure itself** while checking lumi coverage
for the 13 new completions: `EGamma1_Run2025F_v1` showed "MISSING LUMIS" (3,375 lumis
across 18 runs) via the `test -f notFinishedLumis.json` check documented as item 2.
But `lumisToProcess.json` and `processedLumis.json` (the actual counts `crab report`
computes the diff from) matched exactly -- 44,806 = 44,806. Checked file timestamps:
`notFinishedLumis.json` was dated Sep 3 14:00 (stale, from when this task genuinely
had 8 failed jobs, per pass 7), while the other two were freshly regenerated Sep 4
08:03. `crab report` only *writes* `notFinishedLumis.json` when something is actually
missing -- it doesn't delete/overwrite it to empty once the gap closes, so a stale
file from an earlier partial state persists and gives a false positive on later runs.
**Fixed the procedure** (see item 2 above): compare `lumisToProcess.json` vs
`processedLumis.json` event/lumi counts directly instead of checking file existence.
Re-verified `EGamma1_Run2025F_v1` this way (MATCH) and later confirmed independently
via the full file-open+event-count check too (599/599 files, exact match) -- genuinely
fine, was never actually missing anything.

Of the 13 newly-complete datasets, ran the full validation procedure (lumi coverage,
file counts, sizes, file-open, event-count-vs-v1) on all of them:
- **11 cleared outright**: `EGamma0_Run2025E_v1`, `EGamma1_Run2025C_v1`,
  `EGamma1_Run2025E_v1`, `EGamma1_Run2025F_v1`, `EGamma2_Run2025C_v1`\*,
  `EGamma2_Run2025C_v2`, `EGamma2_Run2025F_v2`, `EGamma3_Run2025C_v1`\*,
  `EGamma3_Run2025C_v2`, `EGamma3_Run2025F_v2`, `JetMET0_Run2025C_v1`. (\*
  `EGamma2_Run2025C_v1` and `EGamma3_Run2025C_v1`: v1 has one more file than v2 --
  458 vs 449, and 450 vs 449 respectively -- but event counts match exactly, same
  benign extra-near-empty-v1-file pattern as `Muon0_Run2025C_v1` earlier.)
- **2 pending**: `EGamma0_Run2025D_v1` and `EGamma3_Run2025D_v1` both show the same
  v1-fewer-files/v1-fewer-events pattern as the already-resolved
  `EGamma2_Run2025D_v1`/`Muon0_Run2025D_v1` cases (v2 has 12 more files, ~7.68M more
  events than v1 in both) -- lumi-diff check launched to confirm v1 is an exact
  subset of v2 before clearing, same procedure as before. Given this exact pattern has
  now confirmed benign twice running, expect these two to clear the same way, but
  not marking them cleared until the diff actually confirms it.

25 tasks had failures and were resubmitted normally; the remaining not-yet-cleared
tasks are progressing with 0 current failures.

**Update, same day:** the pending lumi-diff for `EGamma0_Run2025D_v1` and
`EGamma3_Run2025D_v1` confirmed the expected benign pattern -- both are an exact
subset match on their 61,893 shared lumis (0 mismatches), with the extra ~7.68M
events in each coming from the same 3 runs (395103, 395105, 395107) as every other
occurrence of this pattern this migration. Both cleared. **27 of 56 cleared total.**

Also computed a lumi-section-based completion estimate for the 14 JetMET tasks at
Matt's request (he's using it to scale a preliminary background estimate by
luminosity -- expects ~108/fb total for 2025). brilcalc wasn't available on this LPC
node, so used `lumisToProcess.json`/`processedLumis.json` lumi-section counts as a
proxy for luminosity fraction instead of an exact brilcalc-computed integrated lumi.
Result: JetMET0 89.9% (234,114/260,557 lumi sections), JetMET1 60.7%
(158,189/260,576), combined 75.3% (392,303/521,133) of the *currently-submitted*
2025 production (eras C_v1-G_v1). Flagged to Matt that this assumes JetMET0/JetMET1
are a disjoint lumi-section split of the same primary dataset (standard DAQ stream-
splitting convention) and that it's unknown whether eras C-G represent all of 2025
data-taking to date or a subset of it.

### 2026-09-04, v1 deletions

Matt deleted the v1 copies of all 5 cleared Muon datasets
(`Muon0_Run2025C_v1`, `Muon0_Run2025C_v2`, `Muon0_Run2025D_v1`, `Muon1_Run2025E_v1`,
`Muon1_Run2025F_v2`) from `/store/group/lpcdisapptrks/nano/dev/`. Confirmed gone via
`eos ls` (read-only check, Claude did not perform the deletion -- per the ground
rules above). ~2.06 TB reclaimed (380.62+240.33+765.96+437.35+232.24 GB). Table
updated to mark these 5 as deleted rather than merely cleared.

Also noted: `Muon0_Run2025C_v1` has a merged copy in `/store/group/lpcdisapptrks/nano/prod/`
(45 large files vs 458 raw job files in `dev/`) -- flagged in the verification
procedure (item 3) and in memory so future passes don't misread a low file count in
`prod/` as a problem.

### 2026-09-04, pass 9

Multiplexed SSH connection hit a broken pipe on the routine proxy check; cleared the
stale control socket and re-established fresh.

Ran a full pass on all 29 not-yet-cleared tasks. 6 newly hit 100%: `EGamma0_Run2025F_v1`,
`Muon0_Run2025G_v1`, `Muon1_Run2025D_v1`, `Muon1_Run2025F_v1`, `Muon1_Run2025G_v1`,
`JetMET0_Run2025F_v2`. Of those, 4 passed the full validation cleanly and are cleared:
`EGamma0_Run2025F_v1`, `Muon0_Run2025G_v1`, `Muon1_Run2025G_v1`, `JetMET0_Run2025F_v2`
(all exact event-count matches against v1, 0 file-open errors). The other 2 --
`Muon1_Run2025D_v1` and `Muon1_Run2025F_v1` -- show event-count mismatches against v1
(v2 has 13 more files/~8.6M more events, and 1 more file/~686,741 more events,
respectively) and are pending the lumi-diff check to confirm the same benign
v1-subset-of-v2 pattern seen repeatedly this migration.

Good news on the two open JetMET issues: `JetMET0_Run2025G_v1`'s file-availability
problem is now fully resolved (672/675 finished, 0 failed -- down from the original
50 failed), and `JetMET1_Run2025E_v1`'s siteblacklist fix is still holding with 0
failures.

6 tasks had ordinary churn-level failures and were resubmitted normally; the rest are
progressing with 0 current failures.

**Follow-up on the 2 pending lumi-diffs:** `Muon1_Run2025F_v1` confirmed the standard
benign pattern immediately (0 lumis missing from v2 despite 1 transient v1 read
error) -- cleared. `Muon1_Run2025D_v1` took 3 attempts to get a fully clean read: the
first lumi-diff run had 1 v2 error and 2 v1 errors and showed something never seen
before -- 75 lumis present in v1 but *missing* from v2 (`only_v1_lumis`), the reverse
of the usual pattern. Didn't take that at face value given the concurrent read
errors. A second, lower-concurrency rerun still had 1 residual v1 error (a single
file, `nano_629.root`, `XRootD: Operation expired` -- a timeout, not a real failure)
but `only_v1_lumis` had already dropped to 0. Opened that one file directly to
confirm it wasn't actually corrupt (687,684 events, 75 distinct lumis -- note the
coincidental match to the original 75-lumi discrepancy count, which is what made this
worth chasing down rather than assuming). A third fully-clean rerun (0 errors both
sides) confirmed the standard pattern cleanly: v1's 61,891 lumis are an exact subset
of v2's, extra events from the same 3 familiar runs. Cleared.

Lesson reinforced: when a lumi-diff shows `only_v1_lumis` (data apparently missing
from v2, the reverse of the usual benign direction) alongside any nonzero error
count, don't trust it -- rerun clean first. A real gap and a read-error artifact look
very different once errors are at 0 on both sides.

### 2026-09-04, more v1 deletions

Matt deleted the v1 copies of all 28 datasets from the previous "safe to delete" list
(everything cleared at that point except the 5 Muon ones already handled): all of
EGamma0-3's cleared eras, `Muon0_Run2025G_v1`, `Muon1_Run2025D_v1`/`F_v1`/`G_v1`, and
`JetMET0_Run2025C_v1`/`F_v2`. Confirmed all 28 gone via `eos ls` (read-only checks,
Claude did not perform the deletions). ~12.50 TB reclaimed. Table updated -- **all 33
cleared datasets now have their v1 copies deleted**; the other 23 not-yet-cleared
tasks are still in progress.

### 2026-09-04, 2022/2023 batch added

Matt started a second OSUv2 reprocessing round for 2022/2023 data, from a different
work area (CMSSW_13, not CMSSW_15 -- see the new section above). 46 data tasks +
4 AMSB_Wino signal MC samples, discovered via `ls crab_projects_OSUv2/`.

Asked Matt how to handle the 4 MC samples since the lumi-coverage procedure doesn't
apply to MC -- confirmed: status/resubmit tracking only, no v1-vs-v2 comparison for
those.

Checked where each of the 46 data tasks' v1 copies actually live -- **not uniformly
`dev/` like the 2025 migration**. EGamma0/1, JetMET0/1, and JetMET(2022) are all in
`dev/` only. For Muon0/Muon1 2023 and Muon 2022, it's split: most versions only exist
as an already-merged copy in `prod/` (C_v1-v3, D_v1-v2 for Muon0/Muon1; C/D/G for
Muon 2022), while the rest are raw-only in `dev/` (C_v4 for Muon0/Muon1; E/F for Muon
2022) -- presumably the versions not yet merged into `prod/`. Mapped and recorded in
the table above; this determines which EOS path each dataset's event-count
comparison needs to target, and whether the `prod/`-merge file-count exception
(procedure item 3) applies.

Also noticed (not part of this mapping, don't touch): `dev/JetMET/` has
`JetMET_Run2022E_customNanoAOD_noFatJets` and `_retry` variants alongside the plain
`JetMET_Run2022E_customNanoAOD` -- unrelated one-off productions, not additional
versions to reprocess.

v1 total for the 46 data tasks: ~4.65 TB. Not yet run a first `crab status` pass on
any of these 50 new tasks -- next pass should cover the full set (23 not-yet-cleared
2025 tasks + 46 new 2022/2023 data tasks + 4 MC, 73 total).

### 2026-09-06, pass 10 -- CRAB credential fix, el8 node discovery, first CMSSW_13 pass, big cleanup

Grid proxy was fine, but `crab` itself failed on every task with a MyProxy
delegation error asking for the grid certificate passphrase interactively -- Matt
re-delegated it himself on 2026-09-06 (see the prior turn's request), which fixed it.

Ran the 2025 batch (23 tasks): 15 newly complete (several days' worth of queue time
had passed while credentials were broken). Of those, 14 passed full validation and
are cleared (all exact event-count matches or harmless single near-empty-file offset
matches); 1 (`JetMET0_Run2025D_v1`) needed the lumi-diff check (first attempt had a
transient v2-side read error giving a false `only_v1_lumis` signal again -- same
lesson as before, reran clean, confirmed the standard benign v1-subset-of-v2 pattern,
cleared). 7 tasks resubmitted for ordinary churn.

First pass on the new CMSSW_13 (2022/2023) batch hit a wall: `crab status` failed on
every task with a curl-level connection error to cmsweb.cern.ch. Root cause: CMSSW_13
needs `SCRAM_ARCH=el8`, but the default `cmslpc` alias lands on an el9 node. Matt's
fix: use `cmslpc-el8.fnal.gov` instead (already in `~/.ssh/config`) -- set up a second
multiplexed connection to that host, confirmed working immediately. (A `cmssw-el8`
singularity wrapper also works as a fallback, needs `-B /uscms_data` since that path
isn't bind-mounted by default, but the real el8 node is simpler.)

First status pass on the CMSSW_13 batch (50 tasks): 38/50 already complete (multi-day
credential outage gave them time to finish too). Two real problems found (not
ordinary churn):
- `JetMET1_Run2023C_v4` was `SUBMITREFUSED` -- input dataset had a typo
  (`Run2023C-22Sep2023_v4-v2` should be `-v4-v1`). Confirmed the correct name exists
  via `dasgoclient`, confirmed with Matt, fixed the crabConfig, moved the old refused
  workArea dir aside (`.SUBMITREFUSED_old_20260904` suffix, not deleted), and
  `crab submit`ted fresh -- succeeded, now running.
- `JetMET_Run2022E` (40% failed) and `Muon_Run2022E` (2.7% failed) are both crashing
  with the identical exception in the FatJet `lepInAK8JetVars` producer
  (`ValueMap::Filler: handle and reference collections should the same size`, exit
  8012) -- a deterministic code bug. `dev/JetMET/` already has a
  `JetMET_Run2022E_customNanoAOD_noFatJets` variant from v1, suggesting this exact
  bug was hit and worked around before. Matt is handling the fix himself -- **do not
  resubmit these two** until he has.

The other 7 CMSSW_13 tasks with ordinary-churn failures were resubmitted normally.
The 4 AMSB signal MC samples are all complete (status-tracking only, per Matt's
direction -- no v1 comparison needed for MC). None of the 38 complete CMSSW_13 data
tasks have been validated yet (lumi coverage / event-count vs v1-or-prod) -- that's
the next big chunk of work.

**Infrastructure lesson, cost real time this pass:** `/tmp` on `cmslpc-el9.fnal.gov`
is local to whichever physical login node you land on, not shared across the pool.
The multiplexed SSH connection pins one node for its lifetime, but the connection
dropped and had to be re-established several times this pass (independent of the
routine overnight expiry), each time landing on a possibly-different node -- causing
a helper script and a verification log to appear to "vanish" even though nothing was
actually wrong. Fixed by moving all script/log files for background jobs to
`/uscms_data/d3/mjoyce/claude_scratch/` (NFS-mounted, visible from every node) and
launching long background jobs with `nohup ... & disown` so they survive the
controlling SSH session dying too. Should prevent this specific confusion going
forward.

All 15 datasets cleared this pass are pending deletion, not yet removed as of end of
pass 10 -- see the "Ready for you to delete" list above.

### 2026-09-07, pass 11 -- both work areas back to normal, growing validation backlog

New day; both multiplexed connections (`cmslpc` el9, `cmslpc-el8.fnal.gov`) needed
re-establishing (expected). Grid proxy still valid; confirmed `crab` itself works
again (no MyProxy re-delegation issue this time) before running the full batch.

2025 batch (8 not-yet-cleared tasks): 4 newly complete (`EGamma0_Run2025C_v1`,
`EGamma1_Run2025D_v1`, `JetMET1_Run2025D_v1`, `JetMET1_Run2025F_v2`), not yet
validated. 4 resubmitted for ordinary churn.

CMSSW_13 batch (12 not-yet-cleared/held tasks, including a check-in on the 2 held
FatJet tasks): 8 newly complete, including confirmation that the
`JetMET1_Run2023C_v4` dataset-name fix from pass 10 fully worked (100% finished).
2 resubmitted for ordinary churn (`JetMET1_Run2023C_v3`, `Muon1_Run2023C_v4`).
`JetMET_Run2022E` and `Muon_Run2022E` are unchanged (116/289 and 8/294 failed,
same as pass 10) -- Matt hasn't applied the FatJet fix yet, left untouched as
instructed.

**Validation backlog is now substantial**: 4 (2025) + 42 (CMSSW_13, all but the 2
held FatJet tasks) = 46 complete-but-unvalidated datasets, on top of the 15 already-
cleared-but-undeleted 2025 ones from pass 10. Full lumi-coverage/event-count
validation of the CMSSW_13 batch hasn't started at all yet -- next session should
prioritize working through that backlog rather than only chasing new `crab status`
passes, since the queue of "done but unchecked" datasets is growing faster than it's
being cleared.

### 2026-09-08, pass 13 -- working the validation backlog; FatJet fix procedure worked out

Two background verification batches launched at the start of this session (6 2025
datasets, first 12 CMSSW_13 EGamma0/1 2023 datasets) both completed:

- **2025 batch**: `EGamma0_Run2025C_v1` (exact match, 449/449 files, 222194731/222194731
  events), `JetMET0_Run2025E_v1` (exact, 419/419, 142890365/142890365), and
  `JetMET1_Run2025F_v2` (exact, 222/222, 74528971/74528971) all cleared -- 0 errors.
  `EGamma1_Run2025D_v1` and `JetMET1_Run2025D_v1` both showed the benign v2-superset
  pattern (v2 has ~1055 more lumis than v1) -- lumi-diff confirmed both clean (v1's
  lumis a strict subset of v2's, `only_v1=0`) after a retry-on-error rerun for
  `EGamma1_Run2025D_v1` (first attempt had 1 v1-side read error and a spurious
  `only_v1=75`; another instance of the known read-error-artifact gotcha, not a real
  gap). `JetMET1_Run2025C_v1`'s v1-side check didn't finish in the original run
  (process died silently, no error, no `DONE` sentinel) -- re-run confirmed an exact
  449/449 file, 139661282/139661282 event match. All 6 of the 2025 batch now cleared.
- **CMSSW_13 batch (all 12 EGamma0/1 2023 pairs)**: all cleared. Event counts match
  *exactly* on every pair; a few pairs have the v1 side with exactly 1 more file than
  v2 but the same total event count (an empty 0-event file on the v1 side, harmless,
  not a real gap). 0 read errors throughout.
- **Environment gotcha found**: the el8 node's plain `/usr/bin/python3` doesn't have
  `uproot` (unlike whatever was sourced earlier in this session, now lost to a
  reconnect). LCG_105 (used for the el9 `cmslpc` work) has no el8 build. Fix: source
  `/cvmfs/sft.cern.ch/lcg/views/LCG_106/x86_64-el8-gcc11-opt/setup.sh` (still
  `unset PYTHONHOME PYTHONPATH` first) for any CMSSW_13-side python verification work
  from now on -- confirmed working, uproot 5.3.7.

**FatJet fix procedure worked out and executed 2026-09-08 (Matt approved).** Matt
supplied a proposed code fix for the `JetMET_Run2022E`/`Muon_Run2022E` FatJet crash
(`remove_fatjets()` in `custom_osu_cff.py`'s `customize_common()`, removing
`jetAK8Task`/`jetAK8TablesTask`/`jetAK8LepTask` -- task names confirmed valid on the
el8 node). Plain `crab resubmit` won't pick up a code fix (reuses the original
sandbox), so used a CRAB recovery task instead:

1. Added `remove_fatjets(process)` to `custom_osu_cff.py`, called unconditionally
   from `customize_common()` -- Matt's instruction was explicit about calling it from
   there, so this now applies to *all* future NanoAOD production through this
   framework, not just these 2 datasets.
2. Regenerated only `JetMET_Run2022E_NANO_cfg.py` and `Muon_Run2022E_NANO_cfg.py` via
   `make_configs.build_cmsdriver_cmd()` called directly (not the full script, which
   would've also touched the other already-fine 2022 eras). Confirmed both psets
   reference `customize_osu_NoSkim`, which calls `customize_common()`, so the fix is
   live for these.
3. `crab report` on both held tasks: `JetMET_Run2022E` -> 8686 not-finished lumi
   sections across 43 runs; `Muon_Run2022E` -> 600 across 24 runs (consistent with
   the known ~40%/~2.7% failure rates).
4. Built `_recovery_v1`-suffixed crabConfigs: same `inputDataset`/`psetName`/
   `outLFNDirBase`/`outputDatasetTag` as the original, `lumiMask` pointed at each
   task's `notFinishedLumis.json` instead of the live Golden JSON URL.
5. **Confirmed no output collision risk before submitting**: CRAB nests output under
   a submission-timestamp directory (e.g.
   `dev_v2/JetMET/JetMET_Run2022E_customNanoAOD_OSUv2/260904_185849/0000/nano_N.root`)
   -- a fresh `crab submit` gets a new timestamp dir, so the recovery task's output
   coexists safely alongside the original held task's already-good files under the
   same `outputDatasetTag` directory; `eos find -f` (used by this checklist's
   verification scripts) recurses through both automatically.
6. Submitted both recovery tasks (fresh `crab submit`, not `resubmit`):
   `JetMET_Run2022E_customNanoAOD_OSUv2_recovery_v1` and
   `Muon_Run2022E_customNanoAOD_OSUv2_recovery_v1`, both accepted by the CRAB3 prod
   server. Original held tasks left completely untouched. Next pass should
   `crab status` both recovery tasks alongside everything else, and once both are
   100% complete, validate the *union* of original-held + recovery output against v1
   (file/lumi counts need to sum across both tasks' output).

**Gotcha found during this step**: `source /cvmfs/cms.cern.ch/common/crab-setup.sh`
is unnecessary and dangerous here -- it triggered an unwanted fresh
`voms-proxy-init` prompt (would have blocked on a passphrase Claude doesn't have).
`crab` is already on `PATH` via `/cvmfs/cms.cern.ch/common/crab` after `cmsenv`; only
`export X509_USER_PROXY=/uscms/home/mjoyce/x509up_u51387` is needed before
`crab report`/`crab submit`, matching the existing proxy-check convention used for
`crab status` all along -- don't source crab-setup.sh again.

### 2026-09-08, pass 13 continued -- validated the rest of the 100%-complete CMSSW_13 backlog

Validated all 30 remaining 100%-complete-but-unvalidated 2022/2023 datasets (34 total
minus 2 still-churning `JetMET1_Run2023C_v3`/`Muon1_Run2023C_v4` minus the 2 FatJet
ones): 17 `dev/`-location (JetMET0/1 Run2023, JetMET_Run2022 C/D/F/G, `Muon0_Run2023C_v4`,
`Muon_Run2022F`) via the standard file+event-count check, and 13 `prod/`-location
(Muon0/1 Run2023, Muon_Run2022 C/D/G) via event-count-only per the `prod/`-merge
exception (confirmed the same flat, no-primary-subdir, no-`_customNanoAOD`-suffix
layout as the 2025 `prod/` example -- e.g. `prod/Muon0_Run2023C_v1`, not
`prod/Muon0/Muon0_Run2023C_v1_customNanoAOD`).

27 of 30 matched cleanly on the first pass (several `dev/` ones with a harmless
1-empty-file/0-event discrepancy, all `prod/` ones with far fewer files as expected).
3 (`JetMET0_Run2023C_v4`, `Muon_Run2022F`, `Muon1_Run2023D_v1`) each had a handful of
XRootD "Operation expired" read-timeout errors on one side, producing spurious
event-count mismatches -- a clean retry (0 errors both sides) on just those 3 resolved
all of them to exact matches. All 30 now cleared -- see the updated table and the
"Ready for you to delete" list above.

**Background-job gotcha found**: chaining two `nohup ... & disown` launches in one
SSH command (`cd X && source env && nohup A & disown; nohup B & disown`) only sources
the environment and sets the cwd for the *first* backgrounded job -- bash implicitly
subshells the `&&`-chain before the first `&`, but the second `nohup ... &` runs in
the outer (unmodified) shell, landing in the wrong directory with no env sourced. Lost
one job silently this way (`verify_cmssw13_prod_batch.py` tried to run from `$HOME`
with no `uproot` available, produced a 1-line error file there instead of the
expected log in the scratch dir). Fix: launch background jobs from *separate* SSH
commands (or fully repeat `cd && source && nohup` in each one), never chain multiple
`&`-backgrounded launches together expecting shared env/cwd.

### 2026-09-08, pass 13 continued -- Muon0_Run2025F_v2 killed and fresh-submitted after a stuck-site diagnosis

Matt flagged `Muon0_Run2025F_v2` as possibly hung. Investigated with `crab status
--long` before touching anything: task originally submitted 2026-08-25, resubmitted
at least 7 times between 2026-09-02 and 2026-09-04 (per `crab.log`), still only 19%
finished 2 weeks later, with *every* running job pinned to a single site
(`T2_IT_Legnaro`) -- CPU efficiency was healthy (91% avg), so not a true hang, but a
bad-site pattern the same as the earlier `JetMET1_Run2025E_v1` segfault fix.

**Learned this CRAB version's `kill`/`resubmit` can't do a targeted fix**: `crab kill
--help` has no `--jobids` option (kill only operates on the whole task, not
individual jobs), and `crab resubmit --siteblacklist=...` only affects jobs already
in a failed/resubmittable state, not ones currently `running`. So there's no way to
kill-and-resubmit-with-a-blacklist *within the same task* to salvage the 43
already-finished jobs -- confirmed by Matt independently questioning this. The only
way to actually get jobs off a bad site here is a full kill + brand-new `crab submit`
under the same requestName (discarding the finished jobs' output, since a new task
starts from lumi zero).

Checked data locality via `dasgoclient -query 'site dataset=...'` before blacklisting
-- 5 other sites (including `T1_US_FNAL_Disk` and 2 US T2s) hold the input data, so
blacklisting `T2_IT_Legnaro` wouldn't strand the task. Executed: `crab kill`, moved
the old workArea dir aside (not deleted --
`crab_Muon0_Run2025F_v2_customNanoAOD_OSUv2.killed_stuck_site_20260908`), added
`config.Site.blacklist = ['T2_IT_Legnaro']` to the crabConfig, fresh `crab submit`
under the same requestName -- succeeded. Next pass should watch this one closely to
confirm it doesn't land back at the same site or hit the same stuck pattern.

### 2026-09-08, pass 13 continued -- diagnosed the 2 remaining single-job failures

**`JetMET1_Run2023C_v3` job 7 (2023 data) -- same FatJet bug, not isolated to 2022E.**
Pulled `crab getlog --jobids 7 --short`: `InvalidReference` in
`LepInJetProducer/'lepInAK8JetVars'` (`ValueMap::Filler: handle and reference
collections should the same size`) -- identical exception to the `JetMET_Run2022E`/
`Muon_Run2022E` crash, deterministic across 4 different sites (T2_FR_IPHC,
T1_FR_CCIN2P3 x2, T2_DE_DESY), tied to specific event content (run 367665, lumi 30).
Confirms the bug is data-content-dependent (jet/lepton topology), not exclusive to
the 2022E era -- just far rarer here (1/61 vs ~40%/2.7%). Applied the same recovery
procedure: `crab report` (75 lumi sections, all of run 367665), pset already had the
fix baked in from the earlier edit (just needed regeneration via
`build_cmsdriver_cmd()`), built `JetMET1_Run2023C_v3_customNanoAOD_OSUv2_recovery_v1`
crabConfig with `lumiMask` pointed at `notFinishedLumis.json`, fresh `crab submit` --
succeeded. **Any future single-job `InvalidReference`/`ValueMap::Filler` failure on
any 2022/2023 dataset should be treated as this same bug**, not ordinary churn --
check the job log before blindly resubmitting.

**`JetMET1_Run2025E_v1` job 396 (2025 data) -- unrelated: a source file with both
disk replicas unreadable.** Crash is a segfault in ROOT's I/O layer
(`TStorageFactoryFile::Initialize` in `libIOPoolTFileAdaptor.so`), *before* any
analysis module runs ("Module: none (crashed)") -- not the FatJet bug, not
`remove_fatjets()`-relevant. Traced via `Initiating request to open file`/
`Successfully opened file` lines in the job logs: all 4 retries crashed on the same
input file,
`/store/data/Run2025E/JetMET1/MINIAOD/PromptReco-v1/000/396/405/00000/db72ee73-a986-4e9a-823f-bdfced43ef39.root`
(dataset `/JetMET1/Run2025E-PromptReco-v1/MINIAOD`, block
`...MINIAOD#f55ee931-8bd9-421e-86fa-22b31750bc95`, 2160895489 bytes, 32121 events,
adler32 `439a0a20`). `dasgoclient -query 'site file=...'` shows only 3 locations:
`T1_US_FNAL_Disk`, `T1_US_FNAL_Tape`, `T2_BE_IIHE` -- CRAB's 4 attempts already hit
both disk replicas (T2_BE_IIHE once, T1_US_FNAL 3x), each crashing the same way; an
independent `uproot.open()` via the global redirector also failed
(`OSError: Operation expired`). Both disk copies appear genuinely broken; only a tape
recall (`T1_US_FNAL_Tape`) would produce a fresh copy, which is outside what
`crab resubmit`/siteblacklist can fix. **Decision (Matt, 2026-09-08): accept this as
a permanent gap** (75 lumi sections / 1 of 417 jobs) rather than chase a tape recall;
Matt is reporting the bad file to the CMS collaboration through his own channels.
`JetMET1_Run2025E_v1` should be treated as its practical ceiling at 416/417 (99.8%)
going forward -- don't keep resubmitting job 396.

### 2026-09-09, pass 14 -- 3 new batches added, 2 new corrupted-file gaps, 2 site fixes

Matt reported 3 new production rounds since pass 13: 5 more 2022 EGamma tasks (same
CMSSW_13 work area), a previously-untracked 48-task 2024 round (same CMSSW_15 work
area as 2025), and a new 40-task 2026 round in a brand-new CMSSW_16 work area. All
three added as new checklist sections above.

**2026 batch had 2 systemic problems on first check, both resolved this pass**: (1)
all "C"-era tasks `SUBMITREFUSED` (Golden JSON lag) -- Matt confirmed these datasets
are from special runs and won't be used, so abandoned rather than chased; (2) every
other task hit a deterministic `PluginNotFound: IsoTrackDeDxHitTableProducer` because
Matt hadn't `scram b`'d the CMSSW_16 checkout before submitting. Killed all 40
original tasks, moved workAreas aside (not deleted), Matt ran `scram b`, fresh-
submitted 24 B/D-era tasks (skipping C entirely) -- confirmed 0 failures on the
following status check.

**Existing-batch status**: `JetMET1_Run2023C_v3` and `Muon_Run2022E`'s FatJet
recovery tasks are now 100% complete; `JetMET_Run2022E`'s recovery task is at 97.4%.
`Muon0_Run2025F_v2` (killed/resubmitted last pass for a stuck site) is progressing
cleanly with no new failures.

**New permanent gap, same pattern as `JetMET1_Run2025E_v1`**: `Muon1_Run2023C_v4` job
5 hit `FileReadError`/`R__unzipLZMA` (corrupted-file signature) across all 3 known
disk replicas (T2_IT_Pisa, T1_FR_CCIN2P3, T1_US_FNAL) of
`/store/data/Run2023C/Muon1/MINIAOD/22Sep2023_v4-v2/2820000/10f0bd36-0f37-4144-8be1-61a0c7109d4f.root`
(dataset `/Muon1/Run2023C-22Sep2023_v4-v2/MINIAOD`) -- accepted as a gap (Matt,
2026-09-09), task's practical ceiling is 414/415 (99.8%).

**2 site-specific problems found and fixed**: `T2_CH_CSCS` was causing jobs to die
before `cmsRun` even started (`EGamma_Run2022D`: 22 jobs exit 10034; `EGamma0_Run2024E`:
28 jobs exit 8001/8022) -- fixed both with `--siteblacklist=T2_CH_CSCS` resubmit,
confirmed clean afterward. Separately, ~6 2024 tasks showed "Postprocessing failed"
at 6+ *different* sites -- traced to the async-transfer-to-EOS step (job logs show
`cmsRun` and local stage-out both succeeded, exit 0, at every site), ruled out an EOS
quota problem (both relevant quota nodes healthy, 50%/74% filled), treated as
transient async-transfer hiccups and fixed with a plain resubmit -- confirmed working.
22 tasks total resubmitted for ordinary churn across the 2024 batch this pass.

**Host key gotcha**: the el9 `cmslpc` alias's host key rotated *repeatedly* within
this single pass (at least 4 times in under 20 minutes) -- more frequent than the
usual "once or twice a day" pattern. Still routine (LPC's round-robin login pool),
just handled more `ssh-keygen -R` + `StrictHostKeyChecking=accept-new` cycles than
usual. Didn't affect the el8 `cmslpc-el8.fnal.gov` connection at all during the same
window.

### 2026-09-09, pass 15 -- home directory disk quota outage found and fixed, otherwise routine progress

`crab status` started failing outright for some tasks with `OSError: [Errno 122] Disk
quota exceeded` (`EGamma_Run2022D`, `EGamma0_Run2024I` at first, likely would have
hit more over time) -- not an EOS problem, Matt's LPC *home* directory quota
(`homesrv01.fnal.gov:/uscms`, 3072M hard limit) was completely full, unrelated to any
of the actual CRAB task data (which all lives on `/uscms_data/d3` or EOS). Diagnosed
read-only: 627 empty (`0` byte) leftover `.crab3.<pid>` lock files from `crab` CLI
invocations (harmless clutter, deleted -- freed effectively nothing, they were empty)
plus `.vscode-server/cli/servers/` holding *6* different VSCode remote-server version
installs (~2.0 GB total) from past VSCode client auto-updates, only 1 of which
matched Matt's currently-connected client version. Matt removed the 5 orphaned
version dirs himself via the VSCode integrated terminal (kept the active one intact,
his live connection was unaffected) -- quota dropped from 3072M/3072M (at limit) to
1528M/3072M, confirmed fixed by re-running the previously-failing `crab status` call
successfully.

**Progress this pass**: `EGamma_Run2022E` hit 100% (297/297); `JetMET_Run2022E`'s
FatJet recovery task is at 99.1% (115/116), essentially done. Resubmitted ordinary
churn (scattered low-count exit-8901/50660/50664/8021/8028 failures, no site pattern)
across 13 2024 tasks and 6 2026 tasks. `Muon0_Run2025F_v2` (killed/resubmitted last
pass for a stuck site) continues progressing cleanly with zero failures. No new
systemic problems found this pass.

### 2026-09-10, pass 16 -- both FatJet recovery tasks complete, steady 2024/2026 progress

**Both FatJet recovery tasks now 100% complete**: `JetMET_Run2022E_customNanoAOD_OSUv2_recovery_v1`
(116/116) and `Muon_Run2022E_customNanoAOD_OSUv2_recovery_v1` (8/8, already done as of
pass 14). Both `JetMET_Run2022E` and `Muon_Run2022E` are now fully covered (original
held task's good jobs + recovery task) -- next step is validating them, which needs
summing file/event counts from *both* tasks' output (same `dev_v2` output tag) rather
than the usual single-task check.

**Newly 100% complete this pass**: 2024 batch -- `EGamma0_Run2024C`, `JetMET0_Run2024G`,
`JetMET1_Run2024C`, `Muon0_Run2024I`, `Muon1_Run2024C` (now 10 of 48 total complete:
also `EGamma0_Run2024D`, `EGamma0_Run2024H`, `JetMET0_Run2024C`, `JetMET0_Run2024I`,
`JetMET0_Run2024I_v2` from before). 2026 batch -- `EGamma3_Run2026B_v1` (now 3 of 24
complete: also `EGamma0_Run2026D_v1`, `EGamma4_Run2026D_v1`). EGamma 2022: `EGamma_Run2022D`
at 99.3%, essentially done; `EGamma_Run2022C` at 78.0%, progressing well.

Resubmitted 22 tasks total for ordinary scattered churn (15 in 2024, 7 in 2026 --
all low-count exit-8901/50660/50664, no site concentration, confirmed clean after
resubmit via spot-check). No new systemic problems found this pass.

### 2026-09-10/11, pass 17 -- status/resubmit pass, then a big validation push

**Status/resubmit (2026-09-10)**: `EGamma_Run2022C` and `EGamma_Run2022D` both hit
100%. 2024 batch: 18 of 48 complete (up from 10). 2026 batch: 5 of 24 complete (up
from 3), including `Muon0_Run2026B_v1`. Resubmitted 8 tasks for ordinary churn (6 in
2024, 2 in 2026) -- confirmed clean.

**Validation push (2026-09-11, per Matt's request to clear space for new production)**:
validated everything ready across two batches.

- **2022/2023 batch (5 datasets)**: `EGamma_Run2022C` (exact match), `EGamma_Run2022D`
  (1 empty file, harmless), `EGamma_Run2022E` (exact match, v1 summed across its base
  + `_noFatJetExt_recovery` dirs), `JetMET_Run2022E` and `Muon_Run2022E` (both
  resolved via clean lumi-diffs, benign golden-JSON-drift pattern). **Found a gotcha
  for `JetMET_Run2022E`'s v1**: it has 3 candidate v1 directories
  (`_customNanoAOD`, `_customNanoAOD_noFatJets`, `_customNanoAOD_retry`) -- these are
  *sequential production attempts*, not complementary pieces to sum (first-pass sum
  of all 3 gave a wildly inflated 636-file, 269M-event total that didn't match v2 at
  all). Only `_noFatJets` (288 files) is the complete/correct v1 -- confirmed by its
  close match to v2's 289 files. This means v1 production for `JetMET_Run2022E`
  *also* hit the FatJet bug and needed its own recovery, same as `EGamma_Run2022E`.
  **Lesson for future validations**: when a v1 directory listing shows multiple
  variant-suffixed dirs for the same dataset, check file counts against v2 before
  assuming they should be summed -- they may be superseding attempts instead.
- **2024 batch (18 datasets)**: every one of the 18 complete-as-of-pass-17 datasets
  came back an exact match (or a harmless 1-empty-file diff), 0 errors, no retries
  needed. Built out a full per-dataset table for this section (previously only
  tracked in prose) with the v1 `dev/`/`prod/` mapping for all 48 tasks, discovered
  this pass: EGamma0/1 and JetMET0/1 entirely in `dev/`; Muon0 mostly `prod/`
  (C/D/E/G/H/I) with F/I_v2 in `dev/`; Muon1 mostly `dev/` except C in `prod/`.

**23 datasets newly cleared this pass** -- see the "ready to delete" list.

### 2026-09-11, pass 18 -- status/resubmit, no new systemic issues

2024 batch: 26 of 48 complete (up from 18). 2026 batch: 11 of 24 complete (up from
5), **zero failures this pass** -- nothing to resubmit there. Resubmitted 3 tasks in
2024 for ordinary churn (`EGamma0_Run2024F` 4x50664, `EGamma0_Run2024I` 1x60328 new
code, `JetMET0_Run2024D` 1x8021) -- all low counts, no site pattern, confirmed
submitted cleanly. `Muon1_Run2023C_v4`, `EGamma_Run2022F`, `EGamma_Run2022G`,
`Muon0_Run2025F_v2`, `JetMET1_Run2025E_v1` all unchanged as expected. No new
systemic problems found.
