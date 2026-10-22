---
name: signal-mc
description: Generating, submitting, monitoring and validating the Run 3 stop -> lb signal MC (long-lived stop R-hadrons) with CRAB, from SLHA/fragment/config generation through MiniAOD+NanoAOD on EOS. Use whenever a task touches signal MC, DisplacedLeptonsSupplement/SignalMC, create_signal_configs.py, run_gen_to_nano.sh, StopToLB CRAB tasks, <eos-base>/signal_mc, R-hadron lifetime checks, or genParticlePlusGeant.
---

# Signal MC (stop -> lb)

Pair-produced long-lived stops hadronize into R-hadrons, are propagated through the
detector by Geant4, and decay in Geant4 via `RHadronPythiaDecayer` to b + lepton
(e/mu/tau, 1/3 each). One CRAB job runs the full chain LHE -> GEN-SIM -> DIGI/HLT ->
RECO -> MiniAOD+NanoAOD and keeps only `miniaod.root` and `nanoaod.root`.

## Where things live

Setup (LPC disk only):
`<cmssw14-src>/DisplacedLeptonsSupplement/SignalMC/`

| Path | What it is |
|---|---|
| `scripts/create_signal_configs.py` | Writes everything below from one grid definition |
| `data/slha/stop_to_lb_M_<m>_ctau_<c>mm.slha` | R-hadron masses + stop width/BRs |
| `python/stop_to_lb_M_<m>_ctau_<c>mm_cff.py` | Generator fragments |
| `python/randomize_seeds.py` | Per-job step2/3 seeds (incl. premix mixing seed) |
| `test/run_gen_to_nano.sh` | CRAB `scriptExe`: runs steps 1-4 |
| `test/check_step1.py` | Quick physics check (not for lifetimes, see Validation) |
| `test/2024/step1_*_cfg.py`, `step2_cfg.py`, `step3_cfg.py`, `step4_cfg.py` | cmsDriver configs |
| `test/2024/premix_files.txt` | Fixed random 10k-file subset of the premix library (seed 12345) |
| `test/2024/crab_stop_to_lb_M_<m>_ctau_<c>mm_cfg.py` | One CRAB config per point |
| `test/2024/crab_projects/` | CRAB project dirs |
| `test/2024/submit_batch1.sh` | Example submission loop |

## Physics settings and why

- **Releases**: steps 1-3 in CMSSW_14_0_25, step 4 (PAT+NANO) in CMSSW_15_0_10. This
  matches the official 2024 chain (DR/RECO in 14_0_X, MiniAODv6/NanoAODv15 in 15_0_X).
  `HLT:2024v14` only exists in 14_0_X. `RHadronPythiaDecayer` needs >= 14_0_23.
- **2024 conditions**: `140X_mcRun3_2024_realistic_v26`, era `Run3_2024`, beamspot
  `DBrealistic`, premix `/Neutrino_E-10_gun/RunIIISummer24PrePremix-Premixlib2024_140X_mcRun3_2024_realistic_v26-v1/PREMIX`.
  MiniAOD GT `150X_mcRun3_2024_realistic_v2`.
- **2022/2023**: need a private backport of the decayer (cms-sw/cmssw#50625) into
  12_4_X / 13_0_X. Without it these years can't be generated.
- **Hard process**: official T2bW stop-pair gridpacks
  (`/cvmfs/cms-griddata.cern.ch/phys_generator/gridpacks_tarball/pp/13p6TeV/madgraph/Stop_SMS-T2bW`).
  Use the el8 tarball below 600 GeV and slc7 above. MLM matching with the qCut table copied
  from the official RunIII2024Summer24 SMS-2Stop-T2bW fragments (`MATCH_PARAMS`).
  Tune CP5 13.6 TeV, plus the PS weights block.
- **R-hadrons**: Pythia makes the R-hadrons (`RHadrons:allow = on`, `allowDecay = off`,
  stop `mayDecay = off`). `Exotica_HSCP_SIM_cfi.customise` hands them to Geant4. Geant4
  sets the R-hadron lifetime to hbar/width, where the width is the stop width in our
  SLHA file (`particlesDef = SLHAFileForPythia8`). The SLHA width is
  `1.973269804e-13 GeV mm / ctau`. The R-hadron masses in the SLHA file are copied from
  the release's `hscppythiapdtstop<m>.tbl`, so Pythia, Geant4 and the SLHA file agree.
- **Grid**: masses 400-2200 GeV in 100 GeV steps, plus 2400, times ctau 0p1/1/10/100/1000 mm
  (100 points). Target 50k events/point after matching. `totalUnits` = LHE events =
  ceil(50000 / match_eff / 1000) * 1000.
- **Truth kept**: `genParticlePlusGeant` (gen particles plus Geant4-tracked particles,
  including the R-hadron decay products) goes into MiniAOD via
  `GenPlusSimParticles_cfi.customizeKeep`. NanoAOD has no R-hadron decay truth. That
  has to come from MiniAOD, for example via the supplement.

## Regenerating configs

`create_signal_configs.py` has four independent modes. Run it from `scripts/`
(`--package-dir` defaults to `..`). Each mode must run in a particular release:

```bash
# CMSSW_14_0_25 env
cd <cmssw14-src> && cmsenv
cd DisplacedLeptonsSupplement/SignalMC/scripts
python3 create_signal_configs.py --fragments                  # SLHA + fragments
scram b                                                       # first time only, so python/ is importable
python3 create_signal_configs.py --years 2024 --step-configs  # premix list, step1/2/3 (needs proxy for dasgoclient)
python3 create_signal_configs.py --years 2024 --crab --lfn-base <eos-base>/signal_mc_staging   # CRAB configs

# CMSSW_15_0_10 env, same scripts/ dir
cd <cmssw15-src> && cmsenv
cd <cmssw14-src>/DisplacedLeptonsSupplement/SignalMC/scripts
python3 create_signal_configs.py --years 2024 --step4-config
```

`--masses` and `--ctaus` restrict the points. `--version N` bumps the request name and
output tag (`2024_vN`). `premix_files.txt` is only written if it doesn't already exist.
`--crab` only rewrites the `crab_stop_to_lb_M_*_cfg.py` files.

`--lfn-base` sets the CRAB output directory and defaults to `<eos-base>/signal_mc`.
Always pass `--lfn-base <eos-base>/signal_mc_staging` with `--crab` (see Output on
EOS).

CRAB settings baked into the template, each with a reason:

- `PrivateMC`, `EventBased`, 1000 LHE events/job. That gives ~240 events per job after
  matching, and ~1.5-2.6 h per job.
- `numCores = 2`, `maxMemoryMB = 5000`. step2 peaks at ~4.4-4.5 GB with 2 threads, and
  CRAB caps 1-core jobs at 3000 MB.
- `maxJobRuntimeMin = 360`.
- `disableAutomaticOutputCollection = True`. Without it, CRAB also tries to stage out
  the PSet output `step1.root`, which the script deletes, and every job fails stage-out
  with 60302.
- No site whitelist. Restricting to FNAL left the pilot idle for 6+ hours (2-core 5 GB
  slots are scarce there).

## The job script

`run_gen_to_nano.sh` runs `cmsRun -e -j FrameworkJobReport.xml` on `PSet.py` (step1, as
CRAB rewrites it), then on step2 and step3, deleting each input as soon as it's used.
For step4 it creates a `CMSSW_15_0_10` area inside the job with `scram project` and runs
there. Don't pass `-p` to cmsRun: it isn't a valid option, and the job fails immediately.

## Submitting

`crab submit` works non-interactively only while the CRAB myproxy delegation is valid
(~30 days from the last renewal, done by the user). If it has lapsed, ask the user to
renew it. Run submissions in a tmux session on the LPC
(`signalmc-*`), not as a background ssh job. ~20 submissions take several minutes, and
background ssh jobs have died silently.

```bash
ssh cmslpc-claude 'tmux new -d -s signalmc-submit "bash -lc \"cd <cmssw14-src>/DisplacedLeptonsSupplement/SignalMC/test/2024 && export X509_USER_PROXY=<proxy> && bash submit_batchN.sh > submit_batchN.log 2>&1\""'
```

Copy `submit_batch1.sh` with the mass/ctau lists changed. It sources
`crab-setup.sh`, runs `cmsenv`, and greps the success/error lines from each
`crab submit`.

## Expected behavior

Typical values, as a baseline for judging whether a run looks healthy:

- Each job takes 1.5-2.6 h and peaks at ~4.4 GB RSS.
- Matching efficiency is ~23-25% (2364 of 10k LHE events at 1200 GeV).
- Output is ~211 kB/event for mini+nano together, so ~10 GB per point and ~1 TB for the
  full grid. The EOS quota is 2 TB.
- About 1% of jobs fail for site reasons. Resubmit with a blacklist.

## Output on EOS

Two areas, both under `<eos-base>/`. List files through the redirector (see
lpc-eos).

**`signal_mc_staging/`** is where CRAB writes (`outLFNDirBase`, set by `--lfn-base`).
It has the usual CRAB layout:

```
signal_mc_staging/StopToLB_M-<m>_CTau-<c>mm_TuneCP5_13p6TeV_madgraphMLM-pythia8/<tag>/<timestamp>/0000/{miniaod,nanoaod}_<job>.root
```

Tasks with more than 1000 jobs spill into `0001/`. Nothing downstream reads from here.

**`signal_mc/`** is the final area, with miniaod and nanoaod split into one directory each:

```
signal_mc/StopToLB_M-<m>_CTau-<c>mm_TuneCP5_13p6TeV_madgraphMLM-pythia8/<tag>/{miniaod,nanoaod}/{miniaod,nanoaod}_<job>.root
```

Once a task in staging is finished and checked, move its files into the final
layout with `eos mv` (a namespace rename, no data copy) and delete the `log/` directory
and the then-empty timestamp directories. Check that the mini and nano counts match
before and after. Filenames are unique within a point and tag, but a new tag or a
resubmission into an already-populated tag must not overwrite existing job numbers.

A submitted task keeps the `outLFNDirBase` it was submitted with, so a `crab resubmit`
stages out to that directory. Regenerating the config files does not change this.

## Monitoring and failures

General CRAB mechanics are in the lpc-crab skill. Check each task with
`crab status -d crab_projects/crab_StopToLB_M-<m>_CTau-<c>mm_2024_v1`. For many tasks,
loop over `crab_projects/crab_StopToLB_*_2024_v1` and grep `Jobs status` / `failed`.

Failures are normally site-specific, not physics. Resubmit, blacklisting the site if the
same one keeps failing. Don't raise memory or runtime limits unless the failure repeats
at every site. For an unexpected termination (8901), read the job log first.

```bash
crab resubmit -d crab_projects/crab_<request> --siteblacklist=<site1>,<site2>
```

## Validation

Run these checks on MiniAOD, for example with FWLite in the CMSSW_15_0_10 env over
xrootd URLs:

- **R-hadron count**: ~2 per event at gen level.
- **Gen-level stop decays**: the stop must not decay at gen level.
- **Lepton flavors**: products are e/mu/tau in equal shares. Taus decay inside the
  decayer, so `genParticlePlusGeant` shows only their charged/visible daughters.
- **NanoAOD content**: `LHEScaleWeight` (9), `LHEPdfWeight` (103), `PSWeight` (4), and
  `Pileup_nTrueInt` (mean ~46 for 2024).
- **Lifetime**: done correctly, it reproduces the nominal ctau, and the survival
  fraction follows exp(-x) with x in units of ctau.

### Measuring the lifetime correctly

- **Origin**: walk up the R-hadron's mothers while `status == 8` (Geant4 copies) to
  reach the gen-level R-hadron. Its vertex is the production point, and p/m is the boost.
- **R-hadron selection**: select R-hadrons in `genParticlePlusGeant` by the explicit ID
  list below, not `abs(pdgId) > 1e6`. The collection also contains nuclei
  (1000010020, ...) from material interactions.
- **Decay products**: take the daughters that are not R-hadrons.
- **Decay point**: use the closest product that lies **on the R-hadron flight line**.
  The plain closest product is biased ~1.3% low (growing to ~6% at 3-4 lifetimes). The
  decayer places products of B/tau/K0S decays at their own displaced vertices, and when
  such a parent goes backward, its products can sit closer to the origin than the
  R-hadron decay point. This happens in ~7% of decays. Products of the stop decay
  itself all start exactly at the decay point.

```python
RHADRON_IDS = {1000612, 1000622, 1000632, 1000642, 1000652, 1006113, 1006211, 1006213,
               1006223, 1006311, 1006313, 1006321, 1006323, 1006333}

o = gen_ancestor(rhadron)
u = (o.px() / o.p(), o.py() / o.p(), o.pz() / o.p())
dline = None
for q in products:
    d = (10. * (q.vx() - o.vx()), 10. * (q.vy() - o.vy()), 10. * (q.vz() - o.vz()))
    L = math.sqrt(sum(x * x for x in d))
    along = sum(a * b for a, b in zip(d, u))
    perp = math.sqrt(max(L * L - along * along, 0.))
    if along > 0 and perp < 1e-3 + 1e-4 * L:
        dline = L if dline is None else min(dline, L)
ctau = dline * o.mass() / o.p()
```

`test/check_step1.py` uses the plain closest product, so don't use it for lifetimes.

### Collection gotchas

- **Which gen collection**: on MiniAOD use `prunedGenParticles` (`genParticles` is
  AOD-only). Pruning reattaches some hadronization e+e- pairs to the status-102 stop, so
  "stop decays to leptons" at gen level is an artifact. Check the daughters' status and
  vertex before concluding that the stop decayed in Pythia.
- **What `genParticlePlusGeant` contains**: only particles Geant4 tracked, so no
  neutrinos and no taus, plus nuclei.
- **Lepton flavor from the hardest lepton**: inferring the flavor or the decay vertex
  from the hardest lepton is polluted by leptons from tau and B decays. Use the on-line
  method above for the vertex.
