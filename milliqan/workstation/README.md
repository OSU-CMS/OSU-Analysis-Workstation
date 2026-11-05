# milliqan analysis workstation

Scripts that turn a fresh AlmaLinux 9 server into the shared milliqan analysis
workstation. Students SSH in with their own account (key-only) and do all their
work there; data stays on the workstation and the OSU T3, never on laptops.

```text
student laptop --ssh--> workstation (one account per student) --read-only sshfs--> OSU T3 data
```

Everything is configured in [config.sh](config.sh). Every script is safe to rerun: it
checks what's already done and only changes what's missing.

## Getting the scripts onto the machine

Copy this directory over (or clone the repo there), e.g. from a laptop with the repo:

```bash
scp -r milliqan/workstation <admin>@<workstation>:~/
```

## Run order

| Step | Command | Needs |
| --- | --- | --- |
| Survey | `provision/00_check.sh` | nothing (read-only, no sudo) -- rerun after each step to see progress |
| Base | `sudo provision/10_base.sh` | packages (EPEL, sshfs, tmux, git), `milliqan` group, `/work`, `/etc/profile.d/milliqan.sh` |
| SSH | `sudo provision/20_sshd.sh` | your own key login working first -- the script refuses otherwise |
| Env | `sudo provision/30_env.sh` | internet access; ~10 GB in `/opt/milliqan`; several minutes (ROOT) |
| T3 key | `sudo provision/40_t3_key.sh` | reachability of `cms-t3`; prints a line for the T3 side |
| T3 side | install that line in the T3 account's `~/.ssh/authorized_keys` | the T3 account (see open decisions) |
| Mounts | `sudo provision/50_t3_mounts.sh` | `T3_USER` set in `config.sh` |
| Limits | `sudo provision/60_limits.sh` | -- |
| Students | `sudo onboard/add_student.sh <user> <user>.pub "Full Name"` | the student's **public** key |

To disable an account later: `sudo onboard/remove_student.sh <user>` (keeps their files).

## What students get

- Login with their own SSH key only; no passwords anywhere.
- `~/work` -> `/work/<user>`: private work area on the large disk.
- The shared env, read-only: `mqpython script.py`, or `mqenv` to activate it in the
  shell (both from `/etc/profile.d/milliqan.sh`). Students can't change the shared env;
  version changes go through `environment.yml` + `sudo provision/30_env.sh --update`.
- T3 data under `/t3data`, read-only, at the same paths as on `cms-t3`:
  `/abyss/users/mjoyce/MilliQan_skims/...` is `/t3data/abyss/users/mjoyce/MilliQan_skims/...`.
- Per-user limits on memory/CPU/processes, so nobody can stall the machine. Anything
  heavier than the tutorial belongs on T3 Condor. The limits apply to every account,
  admins included.

Claude Code and VS Code's remote server install per user, in the student's own home:
`curl -fsSL https://claude.ai/install.sh | bash` (then `claude` once to log in to their
own account); VS Code installs its server automatically on first Remote-SSH connect.

## How the T3 access is secured

The workstation reads T3 data through one root-owned key (`/etc/milliqan/t3_ed25519`).
Students use the mounts but can't read the key. On the T3 side the key is restricted
to: connections from the workstation's IP only, no shell or forwarding, and a forced
read-only sftp server -- so even a leaked copy could only read files, only from this
machine. Mounts are also `ro` locally; `50_t3_mounts.sh` checks a write is refused.

## Open decisions (from the workstation plan)

- **Which T3 account** the key goes in: a new service account from the T3 admins, or
  the existing shared `milliqan` account (only with its owners' agreement). Ask the T3
  admins whether a shared service account is allowed at all.
- **NFS instead of sshfs**, if the T3 admins will export the data areas -- faster and
  sturdier, and makes `40`/`50` unnecessary.
- **Condor submission** from the workstation (submit node, or per-student T3 accounts)
  -- not handled here yet; these scripts only give read access.
- Whether the full mount list in `T3_MOUNTS` is right -- currently the offline trees
  and the tutorial skims.
