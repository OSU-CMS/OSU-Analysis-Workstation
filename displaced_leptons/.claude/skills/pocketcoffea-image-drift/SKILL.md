---
name: pocketcoffea-image-drift
description: A PocketCoffea/coffea/awkward job behaves differently than it used to (a previously-working feature silently breaks, output is missing fields, results changed) with no corresponding change in this repo's own code. Also worth checking any time behavior differs between "the container" and a bare/non-containerized python environment, or between two runs days/weeks apart. Use to diagnose whether the CVMFS pocketcoffea container image changed underneath us, and to find exactly what changed.
---

# PocketCoffea container image drift

## The problem

`./shell` (and any script that replicates it) defaults to:

```bash
export COFFEA_IMAGE=/cvmfs/unpacked.cern.ch/gitlab-registry.cern.ch/cms-analysis/general/pocketcoffea:lxplus-el9-latest
```

`pocketcoffea:lxplus-el9-latest` is a **moving tag**, not a fixed release. CVMFS
publishes a new build under this same tag on an ongoing basis (roughly every few
days, sometimes daily) as PocketCoffea's upstream repo advances. Every session
that runs `./shell` with no argument picks up whatever `latest` happens to point
to *that day* -- there is no version pinning by default.

**Critically: `pocket_coffea.__version__` (and the other pinned package
versions -- coffea, awkward, uproot) can be identical between two `latest`
builds taken weeks apart, while the actual `.py` source files inside the
package differ.** The version string is not bumped for every upstream commit,
so do not trust it to rule out a change. Confirmed case: two images weeks
apart both reported `pocket_coffea==0.9.13`, `coffea==0.7.29`,
`awkward==1.10.5`, but `pocket_coffea/workflows/base.py` and
`pocket_coffea/utils/skim.py` had different content (different md5sums).

This means a script or workflow that worked when last run can start behaving
differently on a later run with **zero changes to this repo**, purely because
`latest` was rebuilt in between. If you've been debugging a regression for a
while by only looking at this repo's git history/diffs and coming up empty,
suspect this.

## How to check

### 1. List available image tags and their build dates

```bash
ssh fnal-claude "ls -la /cvmfs/unpacked.cern.ch/gitlab-registry.cern.ch/cms-analysis/general/ | grep -i pocketcoffea"
```

Each tag is a symlink; the `ls -la` timestamp is roughly the build/publish
date. You'll see both semantic-version tags (`pocketcoffea:lxplus-el9-0.9.13`)
and commit-hash tags (`pocketcoffea:lxplus-el9-<8-hex-chars>`), the latter
appearing every few days. `pocketcoffea:lxplus-el9-latest`'s own timestamp
tells you when it was last repointed.

Pick a commit-hash-tagged image whose date is close to "when this last worked"
to compare against.

### 2. Run one-off commands inside a specific image non-interactively

`./shell` itself does not work non-interactively (it needs a real TTY/session --
piping commands to its stdin does not reliably execute them from an automated
tool). Replicate its `apptainer exec` invocation directly instead, substituting
whichever image tag you want to inspect:

```bash
ssh fnal-claude "cd /uscms_data/d3/lnestor/displaced_leptons && \
  export APPTAINER_BINDPATH=/uscmst1b_scratch,/cvmfs,/cvmfs/grid.cern.ch/etc/grid-security:/etc/grid-security,/etc/condor/config.d/01_cmslpc_interactive,/usr/local/bin/cmslpc-local-conf.py:/usr/local/bin/cmslpc-local-conf.py.orig,.cmslpc-local-conf:/usr/local/bin/cmslpc-local-conf.py && \
  apptainer exec -B \$(pwd):/srv -B /uscms/home/lnestor --pwd /srv \
    /cvmfs/unpacked.cern.ch/gitlab-registry.cern.ch/cms-analysis/general/pocketcoffea:lxplus-el9-<TAG> \
    /bin/bash -c 'source /srv/.bashrc >/tmp/bashrc.log 2>&1; export X509_USER_PROXY=<resolved-proxy-path>; cd /srv && <command>'"
```

Notes:
- The `.cmslpc-local-conf:/usr/local/bin/cmslpc-local-conf.py` bind source is a
  **relative path** -- the `cd` into the repo dir before `export
  APPTAINER_BINDPATH=...` matters, it must be the CWD when `apptainer exec`
  resolves binds.
- `source /srv/.bashrc` activates the repo's `.env` venv (which layers
  `lpcjobqueue` on top of the image's system site-packages) and does a quick
  `pip install -e .`; without it `pocket-coffea` resolves to the wrong
  environment or isn't on `PATH` at all.
- A VOMS proxy is required for anything that touches xrootd/dask
  (`X509_USER_PROXY` set explicitly, as above -- non-interactive shells don't
  inherit it; resolve `<resolved-proxy-path>` with `lpc-remote-session`'s
  check-never-create sequence, and never create or refresh the proxy yourself).
  Without it you get `Exception: VOMS proxy expirend or
  non-existing`.
- **Do not confuse this containerized environment with a bare LPC-login-node
  Python** (e.g. `/uscms/home/lnestor/.local/lib/python3.9/site-packages/...`,
  found via plain `ssh fnal-claude python3 -c "..."` with no apptainer). That
  bare environment can have a completely different pocket_coffea/coffea/awkward
  stack (seen: Python 3.9 there vs Python 3.11 in the container; different
  major awkward version). Debugging or reading source there tells you nothing
  about what real jobs (which always run inside the container) actually do.
  Always reproduce through the container.

### 3. Diff the actual source, not just the version string

```bash
# md5sum first to find which files actually changed
ssh fnal-claude "... apptainer exec ... pocketcoffea:lxplus-el9-<OLD_TAG> ... 'md5sum /usr/local/lib/python3.11/site-packages/pocket_coffea/workflows/base.py ...'"
ssh fnal-claude "... apptainer exec ... pocketcoffea:lxplus-el9-latest ... 'md5sum /usr/local/lib/python3.11/site-packages/pocket_coffea/workflows/base.py ...'"

# then cat each version to a local file and diff
ssh fnal-claude "... 'cat /usr/local/.../base.py'" > /tmp/base_old.py
ssh fnal-claude "... 'cat /usr/local/.../base.py'" > /tmp/base_new.py
diff /tmp/base_old.py /tmp/base_new.py
```

Focus on `pocket_coffea/workflows/base.py` (the processor base class -- skim
export, calibration loop, preselection) and `pocket_coffea/utils/skim.py`
(`uproot_writeable`, `copy_file`, skim-export helpers) first; these are where
upstream has been actively changing skim/export behavior.

## Known case: silent loss of custom-joined fields in skimmed output

Confirmed root cause of a real bug (supplement-joined fields silently missing
from `save_skimmed_files` output, independent of calibrators/EOS/dask): an
upstream `base.py` change moved the `events_after_skim` snapshot (used to
build the file that actually gets written) to be taken **before**
`process_extra_after_skim()` (this analysis's custom hook that runs the
supplement join) instead of after, with the explicit stated intent "the
skimmed file should contain only the original NanoAOD branches." Any custom
field/collection added via this analysis's `process_extra_after_skim` /
`apply_object_preselection` hooks is now excluded from `save_skimmed_files`
output going forward, regardless of calibrators. This was invisible from
git history/diffs of this repo since nothing here changed -- only the
container image did.
