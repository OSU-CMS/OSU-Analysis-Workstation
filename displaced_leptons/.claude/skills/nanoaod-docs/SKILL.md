---
name: nanoaod-docs
description: Looking up NanoAOD branch names, types, and descriptions -- what fields exist on a collection (e.g. Electron, Muon, Jet), what a branch means, or how big it is. Use whenever a task needs to know NanoAOD content beyond what's already in this analysis's own code, to complement reading NanoAOD source (CMSSW PhysicsTools/NanoAOD) directly.
---

# NanoAOD format documentation

Pre-generated reference docs listing every NanoAOD branch -- its type, description, and
on-disk size -- so branch lookups don't require a CMSSW environment or a live file. Two
NanoAOD versions are covered, NanoAODv12 and NanoAODv15, since this analysis uses a mix
of both (mostly v15 now; check the dataset config for what's current on a given sample).
As of this writing, `QCDEle` and the SingleTop t-channel processes are the only MC still
on v12.

## Reference files

Each file was generated from one real file of a representative dataset for that
NanoAOD version -- picked to document branch structure, not because this analysis
necessarily runs over that exact dataset. Each lists every collection/branch with its
type, description, and on-disk size share (kb/event, %) -- useful both for "what fields
exist / what does X mean" and for "why is this branch so big" when deciding what to keep
in a skim.

| File | Dataset |
|---|---|
| `reference/v15_egamma1_data.md` | `/EGamma1/Run2024F-MINIv6NANOv15-v1/NANOAOD` |
| `reference/v15_tth_mc.md` | `/TTH-Hto2G_Par-M-125_TuneCP5_13p6TeV_amcatnloFXFX-pythia8/RunIII2024Summer24NanoAODv15-150X_mcRun3_2024_realistic_v2-v2/NANOAODSIM` |
| `reference/v12_egamma_data.md` | `/EGamma/Run2022F-22Sep2023-v1/NANOAOD` |
| `reference/v12_dy_mc.md` | `/DYJetsToLL_M-50_TuneCP5_13p6TeV-madgraphMLM-pythia8/Run3Summer22NanoAODv12-130X_mcRun3_2022_realistic_v5-v2/NANOAODSIM` |

Use a `data` file to check what's present in real collision data (e.g. `EGamma1`/`EGamma`
triggers, no gen-level branches -- data files also lack a `Runs` tree entirely), and an
`mc` file to check simulation-only branches (`Gen*`, `LHE*`, `Pileup`, truth-matching
indices like `Electron_genPartIdx`).

## Using the docs

Each file has three trees (`Runs`, `LuminosityBlocks`, `Events` -- data files skip
`Runs`), each with a summary table (`Collection | Description | kb/evt | % of tree`)
followed by a `detail` section with one `###` subsection per collection, each a table of
`Object property | Type | Description | b/event | b/item | %`. Branch names are
case-sensitive and match what you'd use in an ntuple/coffea NanoEvents access (e.g.
`Electron_dxy`).

```bash
grep -n -A 30 "^### Electron$" .claude/skills/nanoaod-docs/reference/v15_tth_mc.md
```

If a branch you need isn't in any of these four files (e.g. it was added/removed in a
different version, or you need the exact CMSSW producer logic, not just the docstring),
fall back to the CMSSW checkouts in the workspace `ref/` (e.g. `../ref/CMSSW_15_0_10`) locally.

## Regenerating / adding a new version or sample

These docs come from CMSSW's `PhysicsTools/NanoAOD/test/inspectNanoFile.py`, which reads
one NanoAOD ROOT file and dumps its branch structure as separate content (`--docmd`) and
size (`--sizemd`) markdown files. It needs a **local** file path (no xrootd URL support),
so copy the file down first, run it, then delete the local copy -- do not commit ROOT
files into the repo.

`scripts/merge_content_size.py` then combines the two into the single per-sample file
actually checked into `reference/`, since as generated the size report duplicates every
branch's type and description (as HTML tooltips) that the content report already has,
and adds a per-row `<img>` "relative size" bar meant for an HTML page -- both pure bloat
in plain markdown. The merge drops both and folds the real size columns (`b/event`,
`b/item`, `%`) into the content report's tables instead, cutting file size by roughly a
third with no loss of information.

```bash
# 1. find a file for the dataset (from an LPC session with a valid grid proxy;
#    resolve <resolved-proxy-path> via lpc-remote-session -- never create it)
ssh fnal-claude "X509_USER_PROXY=<resolved-proxy-path> dasgoclient -query='file dataset=<dataset>' -limit=1"

# 2. copy it down temporarily
ssh fnal-claude "X509_USER_PROXY=<resolved-proxy-path> xrdcp -f root://cms-xrd-global.cern.ch/<file> /uscms_data/d3/lnestor/nanoaod_docs/tmp/<name>.root"

# 3. generate the two raw markdown docs, in a CMSSW environment
ssh fnal-claude "cd /uscms_data/d3/lnestor/CMSSW_15_0_10/src && eval \`scramv1 runtime -sh\` && \
  python3 \$CMSSW_RELEASE_BASE/src/PhysicsTools/NanoAOD/test/inspectNanoFile.py \
    /uscms_data/d3/lnestor/nanoaod_docs/tmp/<name>.root \
    --docmd /uscms_data/d3/lnestor/nanoaod_docs/<name>_content.md \
    --sizemd /uscms_data/d3/lnestor/nanoaod_docs/<name>_size.md"

# 4. delete the temp ROOT file, then scp the two raw .md files down
ssh fnal-claude "rm /uscms_data/d3/lnestor/nanoaod_docs/tmp/<name>.root"
scp fnal-claude:/uscms_data/d3/lnestor/nanoaod_docs/<name>_{content,size}.md /tmp/

# 5. merge into the single file that actually goes in reference/
python3 .claude/skills/nanoaod-docs/scripts/merge_content_size.py \
  /tmp/<name>_content.md /tmp/<name>_size.md \
  .claude/skills/nanoaod-docs/reference/<name>.md
```
