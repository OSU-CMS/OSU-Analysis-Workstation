---
name: milliqan-t3-working-area-setup
description: Create (or verify) the standardized milliqanOffline working area on the OSU T3 cluster -- ~/scratch0/MilliqanWorkstation/milliqanOffline -- for a new or existing user. Use whenever a task needs the milliqanOffline checkout to actually exist on cms-t3 and it isn't confirmed to be there yet, e.g. a first-time analysis setup or "clone milliqanOffline for me." Builds on osu-t3-remote-session for the VPN/SSH mechanics -- use that skill first/alongside this one, don't duplicate its login checks here.
---

# milliQan T3 Working-Area Setup

Standardizes where the `milliqanOffline` checkout lives on the OSU T3 so every
contributor's working area is in the same place, the way
`disapptrks-lpc-working-area-setup` standardizes CMSSW release areas on the LPC. This
skill only handles creating/locating the directory and the clone -- see
`osu-t3-remote-session` for VPN/SSH login mechanics and
`milliqan/CLAUDE.md`'s Active repos table for what the repo actually contains.

## Standard layout

```text
~/scratch0/MilliqanWorkstation/
  milliqanOffline/
```

`~/scratch0/` (not home, which has a ~1&nbsp;GB quota -- see `osu-t3-remote-session`)
is the standard base. Nest the clone inside a `MilliqanWorkstation/` directory rather
than directly under `~/scratch0/`, mirroring the disappearing_tracks
`AnalysisWorkstation/` convention, so other tooling can share that scratch area
without colliding with this analysis's own files.

## Setup steps

Assumes VPN is connected and `cms-t3` is reachable -- confirm via
`osu-t3-remote-session` first if that hasn't already been checked this session.

1. **Check what's already there before creating or cloning anything**:
   ```bash
   ssh cms-t3.mps.ohio-state.edu "ls -la ~/scratch0/MilliqanWorkstation/milliqanOffline 2>/dev/null"
   ```
   If `milliqanOffline/.git` already exists, this is a re-run or an already-set-up
   user -- don't re-clone or touch it. Report what's there (current branch, whether it
   has uncommitted changes) instead of proceeding.

2. **Create the workstation directory if missing**:
   ```bash
   ssh cms-t3.mps.ohio-state.edu "mkdir -p ~/scratch0/MilliqanWorkstation"
   ```

3. **Clone milliqanOffline into it** (only if step 1 found nothing there):
   ```bash
   ssh cms-t3.mps.ohio-state.edu "cd ~/scratch0/MilliqanWorkstation && git clone https://github.com/milliQan-sw/milliqanOffline.git"
   ```
   This is the public GitHub mirror (`milliQan-sw/milliqanOffline`, default branch
   `master`) -- plain HTTPS, no credentials needed. The original CERN GitLab repo
   (`gitlab.cern.ch/MilliQan/milliqanOffline`) caused authentication issues in
   practice (CERN GitLab SSH keys aren't usable from `cms-t3` without extra setup),
   so this GitHub mirror is the standard source now. If GitHub is unreachable for
   some reason, don't silently fall back to the GitLab URL -- ask the user first,
   since that reintroduces the auth problem this switch was meant to avoid.

4. **Confirm the clone succeeded**:
   ```bash
   ssh cms-t3.mps.ohio-state.edu "git -C ~/scratch0/MilliqanWorkstation/milliqanOffline status"
   ```

5. **Set up the Python analysis environment** (see below) -- the framework's
   `Run3Detector/analysis/tutorial/` needs a modern Python stack
   (`uproot`/`awkward`/`hist`) that the T3's system Python (3.6.8) can't provide, and
   the CVMFS Python/LCG mirror on this cluster is stale (see `milliqan/CLAUDE.md`).
   A user-space conda/mamba environment is the chosen path here, decided before
   Singularity's actual presence on this node was confirmed (see Gotchas below) --
   still a reasonable choice since it needs no admin involvement, but a
   Singularity-based approach (the repo has its own `Dockerfile`, pullable via
   `singularity exec docker://...`) is worth reconsidering later if the conda
   approach becomes hard to maintain.

## Python environment: Miniforge + pinned packages

Standard layout, alongside the working area:

```text
~/scratch0/MilliqanWorkstation/
  milliqanOffline/
  miniforge3/          <- the conda/mamba installation itself
```

1. **Check for an existing install first** -- don't reinstall over one:
   ```bash
   ssh cms-t3.mps.ohio-state.edu "ls -d ~/scratch0/MilliqanWorkstation/miniforge3 2>&1"
   ```

2. **Download and install Miniforge non-interactively** (only if step 1 found
   nothing). This is a public GitHub release, no CERN credentials needed, matching
   why the analysis repo itself moved to GitHub:
   ```bash
   ssh cms-t3.mps.ohio-state.edu "cd ~/scratch0/MilliqanWorkstation && curl -L -o miniforge.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh && bash miniforge.sh -b -p ~/scratch0/MilliqanWorkstation/miniforge3"
   ```

3. **Create the environment, then install packages via `conda`/conda-forge, not
   `pip`.** Matching the tutorial's versions
   (`Run3Detector/analysis/tutorial/MilliQanUprootTutorial2024.ipynb` -- Python 3.11,
   `uproot==5.5.1`, `awkward==2.7.1`; don't loosen these two pins without checking the
   tutorial again, since it explicitly warns older `awkward`/`uproot` don't work):
   ```bash
   ssh cms-t3.mps.ohio-state.edu "~/scratch0/MilliqanWorkstation/miniforge3/bin/conda create -y -n milliqan python=3.11"
   ssh cms-t3.mps.ohio-state.edu "~/scratch0/MilliqanWorkstation/miniforge3/bin/conda install -y -n milliqan -c conda-forge uproot=5.5.1 awkward=2.7.1 awkward-pandas hist pandas=2.2 matplotlib numpy=1.26"
   ```
   **`pip install` fails here** -- confirmed live: this login node runs CentOS 7 with
   system GCC 4.8.5, and `pip` falls back to building `numpy` from source (no wheel
   matches this old glibc for recent numpy) which needs GCC >= 9.3 and fails outright.
   `conda`/conda-forge ships prebuilt binaries, sidestepping the system compiler
   entirely -- use it for every package here, not just as a fallback.
   **The `numpy=1.26` and `pandas=2.2` pins are required, not optional**, for the
   same underlying reason: this login node's CPU is a 2008-era Xeon E5420 with no
   SSE4.2/AVX, but conda-forge's default (newer) builds of both packages assume the
   x86-64-v2 baseline and crash on import (`RuntimeError: NumPy was built with
   baseline optimizations... X86_V2`; pandas hit the same issue, confirmed live when
   a fresh session's tutorial run pulled in `pandas 3.0.6` and had to downgrade to
   `2.2.3` to get a working import) on this hardware. Both version pins above are
   confirmed working. **Any other compiled package added to this env later should be
   assumed guilty until checked** -- verify it actually imports on this specific
   node before trusting a version that works on a modern laptop or the LPC.

4. **Activate it by full path, not `conda activate`.** The login shell on `cms-t3`
   defaults to **tcsh, not bash** (confirmed) -- `conda init` sets up bash/zsh hooks by
   default and won't work correctly for tcsh users without extra `conda init tcsh`
   setup that hasn't been done here. The reliable way to use the environment, in any
   shell, is to call its interpreter/tools by full path directly:
   ```bash
   ~/scratch0/MilliqanWorkstation/miniforge3/envs/milliqan/bin/python3 some_script.py
   ```
   or, in an interactive session, source the env's own activation script rather than
   relying on `conda activate` being wired up:
   ```bash
   source ~/scratch0/MilliqanWorkstation/miniforge3/bin/activate milliqan
   ```

5. **Verify** -- write a small script and run it rather than an inline `python -c`,
   since nested quoting through tcsh (see the Gotchas below) is unreliable for
   anything beyond the simplest one-liner:
   ```bash
   cat > /tmp/verify_milliqan_env.py <<'EOF'
   import uproot, awkward, awkward_pandas, hist, pandas, matplotlib, numpy
   print("uproot", uproot.__version__)
   print("awkward", awkward.__version__)
   print("numpy", numpy.__version__)
   EOF
   scp /tmp/verify_milliqan_env.py cms-t3.mps.ohio-state.edu:~/scratch0/MilliqanWorkstation/verify_env.py
   ssh cms-t3.mps.ohio-state.edu '~/scratch0/MilliqanWorkstation/miniforge3/envs/milliqan/bin/python3 ~/scratch0/MilliqanWorkstation/verify_env.py'
   ```
   Confirmed working end-to-end on 2026-09-29: `uproot 5.5.1`, `awkward 2.7.1`,
   `numpy 1.26.4`, `pandas 3.0.6`, `hist 2.12.0`, `matplotlib 3.10.9`,
   `awkward_pandas 2023.8.0`.

## Adding PyROOT

Several tutorial/framework cells (`TH1F`, `TCanvas`, and the `milliqanProcessor`/
`milliqanPlotter` classes themselves) need PyROOT, which the packages above don't
include. Add it the same way, via conda-forge into the existing env (large install --
pulls in Jupyter, xrootd, and a big dependency tree, expect several minutes):

```bash
ssh cms-t3.mps.ohio-state.edu "~/scratch0/MilliqanWorkstation/miniforge3/bin/conda install -y -n milliqan -c conda-forge root"
```

Confirmed working on 2026-09-29: ROOT 6.40.02 imports and a basic `TH1F` fill
succeeds, unlike the default conda-forge `numpy` build -- ROOT's build didn't hit the
same CPU-baseline (x86-64-v2) crash. One cosmetic warning appears on import
(`cling::CIFactory::createCI(): cannot extract standard library include paths!`) --
a known conda-forge-ROOT quirk from a build-time compiler path not existing at
runtime. It didn't block basic histogram usage in testing, but if a cell fails
specifically while JIT-compiling custom C++ (`gInterpreter.Declare(...)`), this
warning is the first thing to revisit.

## Gotchas

- **Don't re-clone over an existing checkout.** If `milliqanOffline/` already exists
  with local changes or a non-default branch checked out, that's likely someone's
  active work -- report state, don't overwrite or reset it.
- **Use the public GitHub mirror, not the CERN GitLab repo.** The GitLab source
  (`gitlab.cern.ch/MilliQan/milliqanOffline`) needs a CERN GitLab SSH key usable
  *from cms-t3 itself*, which isn't set up by default and caused real auth failures --
  a working passwordless SSH login to `cms-t3` (see `osu-t3-remote-session`) says
  nothing about whether that machine can also authenticate to `gitlab.cern.ch`. The
  GitHub mirror sidesteps this entirely since it's public HTTPS.
- This skill does not cover building the C++/ROOT pieces of the framework (skim
  macros, `calculateTriggerEfficiencies.cpp`) -- those build steps aren't documented
  yet (see the open question in `milliqan/CLAUDE.md`).
- **Singularity 3.5.3 is actually installed** on the login node
  (`/usr/local/bin/singularity`) -- corrected from an earlier wrong claim here that
  no container runtime existed at all (that check's own command got mangled by the
  tcsh quoting bug below, producing a false negative; see `osu-t3-remote-session`'s
  Gotchas for the full story). `apptainer`/`docker`/`podman` are genuinely absent,
  but plain Singularity works (`docker://` pulls, `--fakeroot`). This doesn't change
  the current setup (conda/Miniforge), but it means a container-based approach using
  the repo's own `Dockerfile` is a real, viable alternative if the conda path ever
  becomes hard to maintain -- not a dead end. The CVMFS `sft.cern.ch` Python/LCG
  mirror is separately confirmed stale (only through `LCG_98`/`LCG_99`, ~2018-2019).
- **`cms-t3`'s default login shell is tcsh, not bash.** Don't write remote commands
  that assume bash is what runs when you `ssh host "some && command"` -- wrap
  anything with redirects/pipes as `ssh host bash -c '"...script..."'` (note the
  literal nested double-quotes) so tcsh doesn't mis-parse things like `2>&1` itself
  before bash ever sees them.
- **`df` has been observed to hang on this login node**, on both `~` and
  `~/scratch0` -- not specific to this analysis's directories. Avoid it in scripted
  checks; if disk space genuinely needs checking, expect it to sometimes need a
  retry or a generous timeout, and don't treat a hang as a sign anything here is
  broken.
- **The login node's CPU is old** (Xeon E5420, 2008, no SSE4.2/AVX) and **the OS is
  CentOS 7** (system GCC 4.8.5) -- both confirmed live. This affects package
  installs generically, not just this environment: prefer `conda`/conda-forge
  prebuilt binaries over `pip` for anything compiled (numpy, pandas, scipy, etc.),
  and don't assume a package version that works on a modern machine or the LPC will
  import here without checking.
- **Don't rely on an unquoted `~` in a locally-typed command that also appears
  inside an `ssh ... 'remote command'` argument.** A bare `~/scratch0/...` outside
  of any quotes gets tilde-expanded by *your own local shell* against your local
  home directory before it's ever sent to `ssh` -- confirmed to actually happen
  (`bash: /Users/<local-user>/scratch0/...: No such file or directory` even though
  the path was meant for the remote host). Either wrap the whole remote command in
  single quotes so `~` reaches the remote shell literally and gets expanded there,
  or use `$HOME` explicitly inside a double-quoted remote command.
