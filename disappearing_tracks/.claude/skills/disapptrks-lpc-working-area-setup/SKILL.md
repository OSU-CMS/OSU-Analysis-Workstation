---
name: disapptrks-lpc-working-area-setup
description: Create a new LPC working area for a disappearing_tracks contributor who doesn't have one yet (or is missing pieces of one) -- one or more of the CMSSW_13/CMSSW_15/CMSSW_16 OSUNano production releases, and/or a DisappTrks_Nano checkout. Use when asked to set up someone's LPC working area, create a CMSSW release for OSUNano, or when scripts/setup.py's CMSSW-path prompt comes back blank because the area doesn't exist yet. Always checks what already exists before creating anything, and always confirms before an expensive step (cmsrel, scram b, cloning) rather than assuming everything requested should happen immediately.
---

# LPC working-area setup (disappearing_tracks)

Builds on `lpc-remote-session` for the generic SSH/grid-proxy/tmux mechanics. A
`cmsrel`/`scram b` build can take a long time, so it must run inside tmux and be
checked on rather than blocked on, the same way a Dask job submission is handled
elsewhere in this repo's skills. Never creates or refreshes a grid proxy -- this
setup only needs one for steps that touch EOS/grid tools, which this skill's steps do
not (plain `git clone` over SSH and CMSSW tooling don't need a proxy).

## Standardized layout

```text
/uscms_data/d3/<user>/AnalysisWorkstation/
  NanoProd_CMSSW_13/CMSSW_13_0_13/src/OSUNano/
  NanoProd_CMSSW_15/CMSSW_15_0_10/src/OSUNano/
  NanoProd_CMSSW_15/CMSSW_15_0_10/src/DisappTrks_Nano/
  NanoProd_CMSSW_16/CMSSW_16_0_6_patch1/src/OSUNano/
```

`AnalysisWorkstation` is the standardized top-level name for a *newly created* area --
don't rename an existing contributor's differently-named area (e.g. `DisTrks`) to
match; this layout is for setting up someone new, not migrating someone established.

DisappTrks_Nano lives inside the **CMSSW_15** release specifically, not its own
top-level directory -- its own `./shell` Apptainer entrypoint doesn't itself need
CMSSW, but the group's convention is to `cmsenv` into CMSSW_15 before using it there,
so a fresh setup should match that rather than inventing an untested arrangement.

## Node and `SCRAM_ARCH` per release -- not uniformly el9

Confirmed against the real installed releases' `.SCRAM/Environment` files -- **the
three releases do not all use the same node or architecture**:

| Release | Node | `SCRAM_ARCH` | Notes |
| --- | --- | --- | --- |
| `CMSSW_13_0_13` | `cmslpc-el8.fnal.gov` (**el8**, not the `cmslpc`/el9 alias) | `el8_amd64_gcc11` | Only installed under el8; confirmed absent from `scram list` on an el9 node. |
| `CMSSW_15_0_10` | `cmslpc` (el9) | `el9_amd64_gcc12` | The el9 node's default arch -- no explicit export needed. |
| `CMSSW_16_0_6_patch1` | `cmslpc` (el9) | `el9_amd64_gcc13` | El9, but **not** the node's default arch -- `export SCRAM_ARCH=el9_amd64_gcc13` before `cmsrel`, or `scram list` / `cmsrel` will silently fail to find it. |

DisappTrks_Nano itself (and its `./shell` container) only needs to run from an el9
node, independent of which `SCRAM_ARCH` its host CMSSW_15 area happens to use for
`cmsenv`.

Before creating any release, confirm the version/arch pairing still holds --
`ssh <node> "source /cvmfs/cms.cern.ch/cmsset_default.sh && SCRAM_ARCH=<arch> scram list CMSSW_<version>"`
-- rather than assuming these three stay correct indefinitely; CMSSW release/arch
availability changes over time as old architectures get retired.

## Ask what's actually needed before creating anything

Not every contributor needs all of this -- someone doing only PocketCoffea analysis
work never touches OSUNano/CRAB production. Ask up front, don't assume "set up my
working area" means all three releases plus DisappTrks_Nano:

1. Which of CMSSW_13 / CMSSW_15 / CMSSW_16 does the user need for OSUNano production?
   Zero is a normal answer.
2. Does the user need DisappTrks_Nano set up too? (This needs the CMSSW_15 *release*
   directory to exist as its `cmsenv` home even if OSUNano itself isn't wanted there
   -- see the DisappTrks_Nano steps below.)

## Per-release sequence (only for releases actually requested)

Do this once per requested release, using **that release's own node and
`SCRAM_ARCH`** from the table above (`<N>` = 13, 15, or 16; `<version>` = the matching
`CMSSW_13_0_13` / `CMSSW_15_0_10` / `CMSSW_16_0_6_patch1`; `<node>` = `cmslpc-el8.fnal.gov`
for CMSSW_13, `cmslpc` for CMSSW_15/16; `<arch>` = `el8_amd64_gcc11` /
`el9_amd64_gcc12` / `el9_amd64_gcc13` respectively). **Every command in this sequence
must run on that release's node** -- don't default to `cmslpc` (el9) for the CMSSW_13
steps.

1. **Check before creating.**

   ```bash
   ssh <node> "test -d /uscms_data/d3/<user>/AnalysisWorkstation/NanoProd_CMSSW_<N>/CMSSW_<version> && echo EXISTS"
   ```

   If it already exists, report that and check `src/OSUNano` inside it the same way
   instead of re-running anything.

2. **Confirm before starting** if the release is genuinely missing -- even a bare
   `cmsrel` has a real disk/time cost. Don't treat "the user asked for CMSSW_15" as
   automatic approval to also immediately build OSUNano in it (see step 4).

3. **Create the release**, inside a tmux session named for it (e.g. `setup-cmssw15`),
   on `<node>`, with `SCRAM_ARCH` exported explicitly (harmless when it already
   matches the node's default, required when it doesn't -- e.g. CMSSW_16):

   ```bash
   ssh <node> "tmux new -d -s setup-cmssw<N> 'bash'"
   ssh <node> "tmux send-keys -t setup-cmssw<N> \
     'mkdir -p /uscms_data/d3/<user>/AnalysisWorkstation/NanoProd_CMSSW_<N> && \
      cd /uscms_data/d3/<user>/AnalysisWorkstation/NanoProd_CMSSW_<N> && \
      source /cvmfs/cms.cern.ch/cmsset_default.sh && \
      export SCRAM_ARCH=<arch> && \
      cmsrel CMSSW_<version>' Enter"
   ```

4. **If this release is wanted for OSUNano** (not only as CMSSW_15's `cmsenv` home for
   DisappTrks_Nano), still on `<node>` in the same tmux session:

   ```bash
   ssh <node> "tmux send-keys -t setup-cmssw<N> \
     'cd CMSSW_<version>/src && cmsenv && git clone git@github.com:OSU-CMS/OSUNano.git' Enter"
   ```

   Then **ask separately whether to build now or defer** -- `scram b -j 8` is the
   expensive part. If deferred, say plainly that OSUNano isn't usable there until
   `scram b` is run from that `src/`, so it's not mistaken for a finished setup.

5. **If building now**, still in the same tmux session on `<node>`:

   ```bash
   ssh <node> "tmux send-keys -t setup-cmssw<N> 'scram b -j 8' Enter"
   ```

   Check progress with `ssh <node> "tmux capture-pane -t setup-cmssw<N> -p"` (per
   `lpc-remote-session`) rather than attaching or blocking -- a full build can take
   several minutes. Confirm an actual success indicator (scram's final summary, no
   `>> Entering Package ... Building ...` line left as the last thing in the pane,
   which usually means it's still running or died mid-package) before reporting the
   release ready.

## DisappTrks_Nano (if requested), independent of whether OSUNano was built

DisappTrks_Nano itself only needs an el9 node -- all of these run on `cmslpc`, the
same node/session as the CMSSW_15 setup above (`setup-cmssw15`).

6. Ensure the CMSSW_15 release directory exists (steps 1-3 above, on `cmslpc`,
   `SCRAM_ARCH=el9_amd64_gcc12`) even if OSUNano itself wasn't requested for
   CMSSW_15 -- it's only needed here as the `cmsenv` home.

7. Check whether `.../CMSSW_15_0_10/src/DisappTrks_Nano` already exists first. If not:

   ```bash
   ssh cmslpc "tmux send-keys -t setup-cmssw15 \
     'cd /uscms_data/d3/<user>/AnalysisWorkstation/NanoProd_CMSSW_15/CMSSW_15_0_10/src && \
      git clone git@github.com:OSU-CMS/DisappTrks_Nano.git' Enter"
   ```

   This clones the default branch (`main`) -- **flag this to the user and ask if they
   want a different branch instead**. `MattDev` is one person's active development
   branch, not a base for a new contributor, so never default to it silently.

8. Run the checkout's own bootstrap, which sets up the Apptainer `.env` and records
   the checkout path for future automated sessions:

   ```bash
   ssh cmslpc "tmux send-keys -t setup-cmssw15 'cd DisappTrks_Nano && ./setup_lpc.sh' Enter"
   ```

   First check whether `~/.disapptrks_nano_dir` already exists and points somewhere
   (`ssh cmslpc "cat ~/.disapptrks_nano_dir"`) -- if it points at a *different*
   checkout, **ask before overwriting it** rather than silently redirecting future
   `disapptrks-lpc-execution` sessions away from whatever the user is already using.

## Completion report

State plainly, for each requested piece, whether it already existed or was newly
created, and for anything left deferred (an unbuild OSUNano clone) or skipped (a
`~/.disapptrks_nano_dir` conflict left unresolved), say so explicitly rather than
reporting the whole setup as finished. Point the user back to `scripts/setup.py` to
record the new CMSSW_13/15/16 paths into `CLAUDE.local.md` once anything was created.
