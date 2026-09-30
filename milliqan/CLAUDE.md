# milliQan Analysis

(SCAFFOLD -- outline only, filled in by whoever leads this analysis)

## Getting started

milliQan analysis work runs on the **OSU T3 cluster** (`T3_US_OSU`), not the FNAL
LPC -- this is the one thing in this workspace that doesn't follow the LPC-based
pattern the other analyses use, so don't assume `lpc-remote-session`/EOS/CRAB-on-LPC
conventions apply here.

New to this analysis? Just ask Claude in plain language, e.g. "connect me to the OSU
T3 cluster" or "help me set up SSH key access to cms-t3" -- this triggers the
`osu-t3-remote-session` skill (`.claude/skills/osu-t3-remote-session/`), which covers:

- Checking (not establishing) the OSU VPN connection -- required off-campus, via
  Cisco Secure Client/AnyConnect; connecting it is always the user's own action
- SSH login mechanics (`cms-t3.mps.ohio-state.edu` for analysis work vs.
  `cmshead.mps.ohio-state.edu` for account admin only)
- One-time SSH key setup so you're not typing a password on every connection
- Storage areas, HTCondor batch submission, and CMSSW/CRAB environment setup

Prerequisite Claude can't help with: an actual OSU T3 account. That's created by the
cluster admins (see the analysis maintainer/group), not something this workspace can
provision.

Once you have cluster access, ask Claude to set up your working area (e.g. "set up my
milliqanOffline working area" or "clone milliqanOffline for me") -- this triggers the
`milliqan-t3-working-area-setup` skill, which creates the standardized
`~/scratch0/MilliqanWorkstation/milliqanOffline` checkout on `cms-t3` (or verifies one
that's already there, without touching it).

With the working area and conda env in place, ask Claude for the tutorial (e.g. "walk
me through the milliqan analysis tutorial") -- this triggers the
`milliqan-uproot-tutorial` skill, a staged, hands-on walkthrough of the uproot-based
framework on real v36 beam skims: opening files, per-pulse vs. per-event cuts,
histograms (hist/matplotlib and PyROOT), the milliqanCuts/Scheduler/Processor/Plotter
framework, and separating beam muons from cosmics. Each stage's script is saved to
`~/scratch0/MilliqanWorkstation/tutorial/` so you can rerun and adapt it afterward.

## Active repos

| Repo | Kind | OSU T3 work area |
| --- | --- | --- |
| [milliqanOffline](https://github.com/milliQan-sw/milliqanOffline) | Analysis framework: Python (PyROOT-based core classes) + some standalone ROOT/C++ macros for skims, not CMSSW-based | Standardized layout: `~/scratch0/MilliqanWorkstation/milliqanOffline` on `cms-t3` -- see the `milliqan-t3-working-area-setup` skill to create/verify it. |

**Python analysis environment**: `Run3Detector/analysis/` (the uproot-based tutorial
and most of `backgroundEstimation/`, `goodRunTools/`, etc.) needs a modern Python
stack (`uproot`/`awkward`/`hist`) the T3's system Python (3.6.8) can't provide. Set up
via the `milliqan-t3-working-area-setup` skill, which installs a user-space
Miniforge conda environment at `~/scratch0/MilliqanWorkstation/miniforge3` (env name
`milliqan`) -- no admin involvement needed. (Singularity 3.5.3 is actually installed
on this cluster, correcting an earlier wrong claim otherwise -- see the skill's
Gotchas -- so a container-based approach using the repo's own `Dockerfile` remains a
live alternative, just not the one currently set up.) Confirmed working
end-to-end on 2026-09-29 with `uproot==5.5.1`, `awkward==2.7.1`, `numpy==1.26.4`,
`pandas==2.2.3` (these exact numpy/pandas pins matter -- newer conda-forge builds of
both crash on the login node's old CPU; pandas 3.0.6 was the confirmed failure, see
the skill's Gotchas), `hist`, `matplotlib`, `awkward_pandas`.

**Open questions, not yet resolved:**
- Build steps (ROOT version, any external dependencies) for the C++/ROOT pieces
  (skim macros, `calculateTriggerEfficiencies.cpp`) -- not yet documented here.
- Which branch to track for active analysis work.

### `Run3Detector/analysis/` layout

The bar-detector analysis code (2025 milliQan bar detector paper) lives under
`Run3Detector/analysis/` in the repo. Key subdirectories:

| Dir | Purpose |
| --- | --- |
| `backgroundEstimation/` | Main background-estimate/signal-selection scripts (`backgroundCutFlow.py` and its Condor variant), ABCD/N-1/cutflow plotting, unblinding |
| `goodRunTools/` | Builds the good-run-list JSON that determines which offline files enter the analysis (`checkMatching.py`, Condor-submitted via `run_createGoodRunList.py`) |
| `limits/` | Higgs Combine datacard creation (`makeCards.py`) and weight extraction from `backgroundCutFlow.py` sim output -- a separate, repo-specific Combine setup, not the group's `pocketcoffea-datacards-limits` skill (that's PocketCoffea-specific) |
| `pmt-calibration/` | PMT nPE/energy calibration notebooks |
| `simConversion/` | Converts sim files to offline-processed files (pulse injection), Condor-submitted |
| `skim/` | ROOT/C++ skim macros (beam-muon, cosmic, signal, zero-bias) run via `do_skim.py` |
| `timingCalibration/` | Panel timing-correction notebooks |
| `triggerEfficiency/` | Per-channel trigger efficiency vs. pulse height/nPE |
| `tutorial/` | milliQan analysis tutorial notebooks -- good starting point for a new user |
| `utilities/` | Core framework classes: `milliqanCuts` (selections), `milliqanPlotter`/`milliqanProcessor` (histogramming/processing), `milliqanScheduler` (selection/plot ordering), plus `condorProcessor.py` (the shared Condor-submission helper most other scripts build on) |

**Input data convention**: offline files live on the OSU T3 under
`/store/user/milliqan/trees/v36/bar/<primary dir>/<secondary dir>/` -- note this is
the shared `milliqan` group account's `/store` area, not each user's own
`/store/user/$USER/` (see `osu-t3-remote-session` for the general storage
conventions). `goodRunTools/checkMatching.py -d <primary dir> -s <secondary dir> -c
<config path>` is how those primary/secondary dirs get resolved into a good-run list.

**Batch processing**: heavy use of HTCondor throughout (background cutflow on sim,
good-run-list building, pulse-injection/sim conversion) via the shared
`condorProcessor.py` helper -- consistent with the general "use Condor, not the login
node, for anything heavy" guidance in `osu-t3-remote-session`.

Would still contain, once decided:

- One-paragraph analysis blurb
- Reference clones (`ref/`) table
- Storage: personal subdirectory conventions for this analysis (`/data/users/$USER`,
  `/store/user/$USER` on the OSU T3 -- see `osu-t3-remote-session` for what these are)
- Scratch dirs
