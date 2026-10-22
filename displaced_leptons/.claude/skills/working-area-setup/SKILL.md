---
name: working-area-setup
description: Create a new LPC working area for a displaced_leptons contributor who doesn't have one yet, or is missing pieces of one -- the displaced_leptons folder in their nobackup disk, the PocketCoffea analysis checkout, and the CMSSW_15_0_10 and CMSSW_14_0_25 areas with DisplacedLeptonsSupplement. Use when asked to set up someone's LPC working area, create the CMSSW areas, or clone the analysis, or when scripts/setup.py's displaced_leptons prompts point at areas that don't exist yet. Always checks what already exists before creating anything, and confirms before each expensive step.
---

# LPC working-area setup (displaced_leptons)

Builds on `lpc-remote-session` for the SSH and tmux mechanics. `cmsrel` and `scram b` can
take a long time, so they run inside tmux and are checked on rather than blocked on.
Never creates or refreshes a grid proxy. None of these steps need one.

## Standard layout

```text
/uscms_data/d3/<lpc-username>/displaced_leptons/
  analysis/                                       PocketCoffea checkout
  CMSSW_15_0_10/src/DisplacedLeptonsSupplement/   supplement creation, signal MC step 4
  CMSSW_14_0_25/src/DisplacedLeptonsSupplement/   signal MC steps 1-3
```

Below, `<root>` is `/uscms_data/d3/<lpc-username>/displaced_leptons`. The pieces map to the
placeholders in `CLAUDE.md` as `<analysis-dir>` = `<root>/analysis`, `<cmssw15-src>` =
`<root>/CMSSW_15_0_10/src` and `<cmssw14-src>` = `<root>/CMSSW_14_0_25/src`.

This layout is for setting up someone new. Don't move or rename an existing contributor's
differently laid out area to match it. If they already have the areas somewhere else,
skip creation and just record their paths (see the last section).

## Node and `SCRAM_ARCH`

Everything here runs on an el9 node (`cmslpc`). Both releases use `el9_amd64_gcc12`, the
el9 node's default arch, as confirmed against existing areas' `.SCRAM/` directories.
Export it explicitly anyway. Before creating a release, confirm it is still available:

```bash
ssh <alias> "source /cvmfs/cms.cern.ch/cmsset_default.sh && SCRAM_ARCH=el9_amd64_gcc12 scram list CMSSW_<version>"
```

tmux sessions live on one login node but the `cmslpc` alias is load-balanced. Record the
node once (`ssh <alias> hostname`) and run every later command on it with
`ssh <lpc-username>@<node>.fnal.gov`, as `lpc-remote-session` describes.

## Ask what's needed before creating anything

Don't assume "set up my working area" means everything. Ask which of these the user needs:

1. The analysis (PocketCoffea) checkout -- needed for running jobs and post-processing.
2. Supplement creation -- needs the `CMSSW_15_0_10` area.
3. Signal MC production -- needs both the `CMSSW_14_0_25` and `CMSSW_15_0_10` areas.

Then check what already exists, for each requested piece:

```bash
ssh <lpc-username>@<node>.fnal.gov "test -d <root>/analysis/.git && echo ANALYSIS; for r in CMSSW_15_0_10 CMSSW_14_0_25; do test -d <root>/\$r/src/DisplacedLeptonsSupplement/.git && echo \$r-HAS-PACKAGE || (test -d <root>/\$r && echo \$r-RELEASE-ONLY); done"
```

Report what exists and only do what is missing. Never overwrite or re-clone into an
existing directory.

## Analysis checkout

Confirm first, then clone `main`:

```bash
ssh <lpc-username>@<node>.fnal.gov "mkdir -p <root> && cd <root> && git clone --branch main git@github.com:lnestor/displaced_leptons.git analysis"
```

If the clone fails with a permission error, the user's LPC account has no GitHub SSH key
set up. Say so and stop, since fixing it is the user's step.

Then run the checkout's own bootstrap, which creates `shell` and `.bashrc`. It is safe to
re-run:

```bash
ssh <lpc-username>@<node>.fnal.gov "cd <root>/analysis && ./setup_lpc.sh"
```

Check that `shell` and `.bashrc` now exist. The environment itself is entered with
`./shell` from `<root>/analysis`.

## Each CMSSW area (only for requested releases)

Do this once per requested release (`<version>` = `CMSSW_15_0_10` or `CMSSW_14_0_25`),
inside one tmux session on the recorded node.

1. **Confirm before starting.** Even a bare `cmsrel` has a real disk and time cost.
2. **Create the release and clone the package:**

   ```bash
   ssh <lpc-username>@<node>.fnal.gov "tmux new -d -s setup-dl 'bash'"
   ssh <lpc-username>@<node>.fnal.gov "tmux send-keys -t setup-dl \
     'mkdir -p <root> && cd <root> && \
      source /cvmfs/cms.cern.ch/cmsset_default.sh && \
      export SCRAM_ARCH=el9_amd64_gcc12 && \
      cmsrel <version> && cd <version>/src && cmsenv && \
      git clone --branch main git@github.com:lnestor/DisplacedLeptonsSupplement.git' Enter"
   ```

   If the release exists but the package doesn't, skip `cmsrel` and clone only.
3. **Ask separately whether to build now or defer.** `scram b` is the expensive part:

   ```bash
   ssh <lpc-username>@<node>.fnal.gov "tmux send-keys -t setup-dl 'scram b -j 8' Enter"
   ```

   Check progress with `ssh <lpc-username>@<node>.fnal.gov "tmux capture-pane -t setup-dl -p"`
   rather than attaching or blocking. Confirm scram's final summary with no errors before
   calling the area ready. A last line of `>> Entering Package ... Building ...` means the
   build is still running or died mid-package. If the build fails, report the error and
   stop. Don't edit the package to work around it.

   If the build is deferred, say plainly that the package isn't usable until `scram b` is
   run from that `src/`, so it isn't mistaken for a finished setup. The
   `supplement-creation` skill needs the built plugin in `CMSSW_15_0_10`, and `signal-mc`
   needs `scram b` run once in `CMSSW_14_0_25` so that `python/` is importable.

## Completion report

State plainly, for each requested piece, whether it already existed or was newly created,
and call out anything deferred (an unbuilt package) or skipped (a failed clone). Don't
report the whole setup as finished if any piece wasn't.

Then point the user at `scripts/setup.py`: choose `displaced_leptons` and accept the
defaults, or type the paths if their areas are elsewhere. It records the six placeholder
values in `CLAUDE.local.md` and writes `.mount-config`. After that, `scripts/mount.sh
mount` mounts the areas locally if sshfs works on their machine.
