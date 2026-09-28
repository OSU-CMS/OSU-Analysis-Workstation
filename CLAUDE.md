# OSU CMS Analysis Workspace

Shared home base for the OSU CMS group's LPC analyses. Generic tooling and
conventions only -- anything specific to one analysis belongs in that analysis's own
`<analysis>/CLAUDE.md` and `<analysis>/.claude/skills/`.

| Analysis | Directory | Maintainer |
| --- | --- | --- |
| Disappearing tracks | `disappearing_tracks/` | Matt Joyce |
| Displaced Leptons | `displaced_leptons/` | Lucas Nestor|

`milliqan/` also exists as scaffolding for future analyses but isn't filled in yet.

## Remote Servers

The FNAL LPC is reached over SSH via an alias in `~/.ssh/config`, conventionally named
`cmslpc` (pointing at `cmslpc-el9.fnal.gov`), plus a second, SSH-multiplexed alias
(conventionally `cmslpc-claude`) reserved for Claude's own repeated automated
connections so they reuse one authenticated connection instead of paying a fresh
Kerberos/GSSAPI handshake per command. `scripts/setup.py` checks for both and offers
to add them if missing. See the `lpc-remote-session` skill for the actual
login/grid-proxy/tmux mechanics once connected.

## EOS

LPC storage is only ever accessed through the xrootd redirector
(`root://cmseos.fnal.gov/`), never through the `/eos/uscms/...` mount path directly --
that's an FNAL LPC admin policy, not a style preference. See the `lpc-eos` skill for
the commands. Personal space lives at `/store/user/<lpc-username>`; any
analysis-specific shared EOS subdirectory (e.g. a production output area) is documented
in that analysis's own `CLAUDE.md`.

## FNAL Mount

Not in active use yet -- every documented workflow today runs over SSH (via
`lpc-remote-session`) rather than through a local sshfs mount. `mnt/` and
`scripts/mount_remote.py` exist as scaffolding for that if/when an analysis actually
needs one; there's no real mount table to configure until then.

## Style guidelines

TBD -- not yet decided whether style conventions (see the `python-style` skill) apply
group-wide or should be set per analysis.

## Group-wide references (`ref/`)

Read-only, gitignored clones of code that isn't specific to one analysis. Consult them for
general questions; an analysis's own `CLAUDE.md` and skills win where they differ.

| Directory | What it is |
| --- | --- |
| `ref/OSU-Agentic-Analysis` | JFC framework: HEP analysis methodology, agent-behavior specs, visualization and analysis conventions |
| `ref/PocketCoffea` | Config-driven analysis framework built on coffea |
| `ref/coffea` | Columnar analysis framework |
| `ref/awkward` | Jagged-array library |
| `ref/uproot` | ROOT file I/O in Python |
| `ref/correctionlib` | Correction/scale-factor format and evaluator |
| `ref/lpcjobqueue` | Dask job submission on the LPC |
| `ref/CMSSW_14_0_21`, `ref/CMSSW_15_0_10` | CMSSW source (sparse checkout) |

## Setup

Run `scripts/setup.py` once per machine: checks/suggests LPC SSH aliases (including a
multiplexed one for Claude's own automated connections -- see the `lpc-remote-session`
skill), clones an analysis's `ref/` reference clones, and records your LPC
username/sshfs-support -- plus, if you select `disappearing_tracks`, its
CRAB/NanoAOD-production CMSSW release work areas -- in `CLAUDE.local.md` and
`.mount-config.local.sh` (both gitignored -- see `.gitignore`). Deliberately doesn't
record a grid proxy path -- `lpc-remote-session` checks that live each session
instead of trusting a stored path that could go stale.
