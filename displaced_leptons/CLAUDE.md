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

The LPC work areas are mounted locally with SSHFS under `../mnt/` (the monorepo root
`mnt/`). Use the normal Read and Edit tools on these paths to read and edit LPC files. If
a mount is not up, ask the user to mount it.

| Mount point | Remote path | Purpose |
|---|---|---|
| `../mnt/fnal-displaced-leptons/` | `/uscms_data/d3/lnestor/displaced_leptons` | Run 3 PocketCoffea-based analysis code |
| `../mnt/fnal-DisplacedSUSY/` | `/uscms_data/d3/lnestor/DisplacedLeptons_CMSSW/Work/CMSSW_10_2_22/src` | Run 2 CMSSW-based analysis code, for comparison |
| `../mnt/fnal-supplement-cmssw-15/` | `/uscms_data/d3/lnestor/CMSSW_15_0_10/src` | Supplement file generation, signal MC generation steps 3 and 4 |
| `../mnt/fnal-supplement-cmssw-14/` | `/uscms_data/d3/lnestor/CMSSW_14_0_21/src` | Signal MC generation steps 1 and 2 |

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
