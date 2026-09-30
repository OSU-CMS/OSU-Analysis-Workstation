---
name: osu-t3-remote-session
description: Start and manage a session on the OSU T3 cluster (T3_US_OSU) for milliqan analysis work over SSH -- checking (never establishing) the OSU VPN connection, logging into the right host for the task, and using tmux so batch/long-running work survives a dropped connection. Use whenever a task requires actually logging into and running something on the OSU T3 cluster (cms-t3.mps.ohio-state.edu), not just producing a command for the user to run themselves. Do not use this to connect the OSU VPN -- that's the user's own action, never Claude's.
---

# OSU T3 (T3_US_OSU) Remote Sessions

Generic mechanics for actually doing something on the OSU T3 cluster over SSH, as
opposed to just telling the user a command to run themselves. Analysis-specific
skills for the milliqan codebase build on top of this. Modeled on the LPC's
`lpc-remote-session` skill, but the two clusters differ in auth model and network
access -- don't assume Kerberos/grid-proxy mechanics apply here.

## VPN: check, never connect

The OSU T3 cluster is only reachable from on the OSU network. Off-campus, that means
the OSU VPN (Cisco Secure Client / AnyConnect) must be connected first.

**Never attempt to drive the VPN client yourself** -- connecting it is the user's own
action, the same way `lpc-remote-session` never runs `voms-proxy-init` itself. Check
reachability without assuming either way:

```bash
ssh -o BatchMode=yes -o ConnectTimeout=8 cms-t3.mps.ohio-state.edu true
```

- Exit code `0` (or a password prompt, if no key/agent is set up) means the host is
  reachable -- proceed.
- A hang, timeout, or DNS failure (`Could not resolve hostname`) usually means the VPN
  isn't connected. Stop and ask the user to connect their OSU VPN client themselves,
  then retry once they confirm it's up. Don't retry in a loop or fall back to guessing
  a different address.

## SSH login

Two distinct hosts exist -- don't confuse them:

- **`cms-t3.mps.ohio-state.edu`** -- day-to-day analysis work (CMSSW, CRAB, batch
  submission). Use this for everything analysis-related.
- **`cmshead.mps.ohio-state.edu`** -- account management only (initial password
  change, quota requests). Not for analysis work, and not relevant once an account is
  already set up.

Check `~/.ssh/config` for an existing alias/username before guessing:

```bash
grep -A3 -i "host cms-t3" ~/.ssh/config
```

Auth here is a plain password (or an SSH key/agent the user has set up), **not**
Kerberos/GSSAPI -- unlike the LPC. If `ssh` prompts for a password unexpectedly, that's
normal on this cluster and not itself a sign of a problem; just note that this tool has
no way to supply the password interactively, and ask the user to run the login
themselves or confirm key-based auth is set up first. If they don't have key-based
auth set up yet, see New user key setup below.

## New user key setup

A first-time user will hit a password prompt on every connection until they set up
public-key auth. Claude can do the state-checking parts; the one step that needs their
password typed interactively is theirs alone -- same boundary as the VPN and grid-proxy
steps elsewhere in this skill set.

1. **Check for an existing usable key** before generating a new one:
   ```bash
   ls -la ~/.ssh/id_ed25519.pub ~/.ssh/id_rsa.pub 2>/dev/null
   ```
   Prefer an existing ed25519 key if one's already there -- don't generate a second
   keypair just because this cluster is new to the user.

2. **Generate one only if none exists** (ed25519, and always let the user set their
   own passphrase -- never pass one on the command line or suggest an empty
   passphrase):
   ```bash
   ssh-keygen -t ed25519 -C "<user's email or username>"
   ```

3. **Confirm the key is offered automatically for this host** -- either a `Host *` (or
   `Host cms-t3.mps.ohio-state.edu`) block in `~/.ssh/config` with the right
   `IdentityFile`, or rely on ssh's own default search order (`id_ed25519` is tried
   automatically). Don't add a redundant `IdentityFile` line if the default already
   covers it.

4. **Hand the actual authorization step to the user** -- this is the one place a
   password must be typed, so Claude should not attempt to drive it:
   ```bash
   ssh-copy-id cms-t3.mps.ohio-state.edu
   ```
   Tell them to run this themselves (it'll prompt for their cluster password once) and
   confirm when it's done, rather than trying to script around the prompt.

5. **Verify it worked**:
   ```bash
   ssh -o BatchMode=yes -o ConnectTimeout=8 cms-t3.mps.ohio-state.edu true
   ```
   `BatchMode=yes` makes ssh fail fast instead of hanging on a password prompt, so exit
   code `0` here means key-based auth is genuinely working -- not just that a prompt
   was avoided by luck.

## Storage

- **Home directory**: tiny quota (soft 1&nbsp;GB / hard 1.5&nbsp;GB, 7-day grace). Don't
  put analysis output or large checkouts here.
- **`~/scratch0/`** (symlinked to `/scratch0/$USER` or similar): no quota, local
  scratch disk on the login node -- fine for working checkouts and intermediate files.
- **`/data/users/$USER`**: large shared RAID, no hard quota -- the usual place for
  larger persistent analysis output. Be considerate; the group gets nudged when it
  fills up.
- **`/store/user/$USER`**: Hadoop-backed pool (`T3_US_OSU`'s CRAB stageout area), no
  hard quota. This is where CRAB job output lands when a CRAB config sets
  `config.Site.storageSite = 'T3_US_OSU'`.

## Batch system: HTCondor

The cluster runs HTCondor with a shared compute-node pool. Resource- or
time-consuming work belongs in a Condor job, not run directly on the login node --
treat the login node like any other shared login node.

## CMSSW / CRAB environment

- CMSSW (`scram`, `cmsrel`, `cmsenv`) is available automatically on login -- no manual
  setup needed.
- CRAB needs sourcing explicitly:
  ```bash
  source /cvmfs/cms.cern.ch/crab3/crab.sh    # bash
  source /cvmfs/cms.cern.ch/crab3/crab.csh   # csh/tcsh
  ```

## tmux for anything long-running

Anything that takes more than roughly a minute, or that needs checking on later,
should run inside tmux so a dropped SSH/VPN connection doesn't kill it:

```bash
ssh cms-t3.mps.ohio-state.edu "tmux new -d -s <session-name> '<command>'"
```

- Check for an existing relevant session first (`ssh cms-t3.mps.ohio-state.edu tmux
  ls`) and reuse it if the same job is already running. Never kill a session that
  wasn't created for this task -- it may be the user's own unrelated work.
- Name the session for what it's doing (e.g. `milliqan-ntuplize-run3`), not something
  generic like `job` or `run`.
- To check progress without disturbing the session: `ssh cms-t3.mps.ohio-state.edu
  "tmux capture-pane -t <session-name> -p"` prints the current pane contents.
- Don't `tmux kill-session` a still-running job unless asked.

## Gotchas seen in practice

- **`ssh` hangs or times out**: almost always the OSU VPN isn't connected (or dropped
  mid-session) -- ask the user to (re)connect it, don't retry blindly or try an IP
  address instead of the hostname.
- **Unexpected password prompt**: normal here (no Kerberos), but this tool cannot
  supply it -- hand the login back to the user or confirm key-based auth first.
- **Don't confuse `cms-t3` and `cmshead`**: `cmshead` is for cluster
  administrators/account setup, not analysis work -- if a task ends up there by
  mistake, back out rather than continuing.
- **The default login shell on `cms-t3` is tcsh, not bash** (confirmed via the
  account's login shell, `/bin/tcsh` in `getent passwd`). Startup file: tcsh reads
  `~/.tcshrc` if present, otherwise `~/.cshrc` -- never both, and accounts differ
  (at least one has only `~/.cshrc`, confirmed 2026-09-30). Before adding anything,
  check which exists and append to that one; creating a new `~/.tcshrc` alongside an
  existing `~/.cshrc` silently disables the `~/.cshrc`. A bare `ssh host "cmd1 && cmd2 |
  cmd3"` gets parsed by tcsh first, which has different (and stricter) redirect
  syntax than bash -- a literal `2>&1` or `2>/dev/null` in the remote command string
  can trip tcsh's "Ambiguous output redirect" error before your actual command ever
  runs. For anything with redirects or pipes, wrap it explicitly:
  `ssh host bash -c '"...script with 2>&1 etc...\"'` (the nested literal
  double-quotes matter -- they're what keeps the redirects intact through tcsh's
  parsing once ssh flattens the argv into one string).
- **`df` has been observed to hang on this cluster's login node**, on ordinary paths
  like `~` and `~/scratch0` -- not a sign of a broken mount or a slow network on its
  own. Avoid relying on `df` in scripted checks; if you need it, use a hard timeout
  and don't read a hang as evidence something else is wrong.
- **Singularity 3.5.3 is actually installed** on the login node
  (`/usr/local/bin/singularity`) -- an earlier check here wrongly reported "no
  container runtime at all," which was a false negative caused by exactly the tcsh
  quoting bug above (the check's own command got mangled before it could see the
  binary). Confirmed for real with correct quoting: `singularity` works
  (`docker://` image pulls, `--fakeroot`, user namespaces all supported by its
  `exec --help`); `apptainer`/`docker`/`podman` are genuinely absent. If a future
  check reports something as "absent," reverify with the nested-double-quote
  pattern before trusting it -- don't repeat this mistake. The CVMFS `sft.cern.ch`
  Python/LCG mirror is separately confirmed stale (only through `LCG_98`/`LCG_99`,
  ~2018-2019), so that one's still not a quick fix for a missing modern Python
  stack. See `milliqan-t3-working-area-setup` for the user-space conda/mamba approach used
  instead.
