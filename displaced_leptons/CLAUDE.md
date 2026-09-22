# Displaced Leptons Analysis

CMS analysis of displaced leptons in the ee, emu and mumu channels, built on
PocketCoffea and run on the FNAL LPC. The Run 2 DisplacedSUSY analysis is the physics
reference. Central NanoAOD is extended with "supplement" ROOT files that are matched to
NanoAOD files by (run, lumi) and joined at run time. Supplement production and signal MC
generation both live in DisplacedLeptonsSupplement.

## Repos (`ref/`)

| Directory | What it is |
|---|---|
| `ref/displaced_leptons/` | Run 3 analysis code: PocketCoffea configs, workflow and library code |
| `ref/DisplacedLeptonsSupplement/` | CMSSW package: `SupplementCreation/` (supplement files) and `SignalMC/` (signal MC generation) |
| `ref/DisplacedSUSY/` | Run 2 CMSSW-based analysis. Reference for physics logic when checking that Run 3 matches, not for code style |
| `ref/OSUT3Analysis/` | Run 2 OSU framework that DisplacedSUSY is built on. Reference only |

## Work location

Work is done on the LPC, not locally. Assume the user means the LPC copy unless told
otherwise, and make edits there (see Mount points).

The clones in `ref/` are read-only references. Never edit them unless the user explicitly
says to. Before treating one as the current state of the code, check it against the LPC
copy, since it can be stale or hold uncommitted changes that were never deployed. Read
reference code from these local clones, not from the LPC, unless asked.

## Mount points

LPC work areas can optionally be mounted locally over SSHFS under `mnt/` (in this
analysis directory), so the normal Read and Edit tools work directly against LPC files.
This is per-user setup, not required. The actual mount table in use, if any, is
per-machine and lives in the gitignored `CLAUDE.local.md` in this directory -- read that
first. If it doesn't exist, assume mounting is not to be used.

The mount table format is `.mount-config` (also gitignored -- per-user paths), one entry
per line: `name:ssh_alias:remote_path[:local_path]`, where `ssh_alias` is a Host entry
from `~/.ssh/config`. `scripts/mount.sh {mount|unmount|status} [name]` reads it -- with
no name the command applies to every entry, with one just that mount.

SSHFS is slow for broad searches. Locate files over SSH first. In a CMSSW area, run
`find` from the `src/` subdirectory.

## Other directories

- `plots/`: saved plots
- `tmp/`: anything temporary (skim progress state, profiling output)

Both are gitignored and created as needed.

## EOS

Supplement files for this analysis live in `/store/user/lnestor/supplements`.

## Style guidelines

Always use ASCII characters only when writing code. Do not use em-dashes. Use hyphens instead. Do not use Greek letters, write them out instead (i.e. mu). Do not write excessive comments.
