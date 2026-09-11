---
name: lpc-root
description: Reading and writing ROOT files on the FNAL LPC via uproot or pyroot. Use whenever a task touches .root files, TTrees, uproot, pyroot, or ROOT.
---

# ROOT files on the FNAL LPC

## uproot vs pyroot

- **uproot**: pure-Python, reading only. No `cmsenv`/environment activation needed --
  it's installed in the user's own packages and just works. Prefer it for reading
  simple TTrees.
- **pyroot**: full ROOT machinery (writing, RDataFrame, histograms, fitting, etc.).
  Requires `cmsenv` in a CMSSW environment.

## uproot writing gotcha

Writing a jagged (variable-length) branch with uproot always adds a paired counter
branch (default name `"n" + branch_name`), even if the source file didn't have one --
e.g. central NanoAOD/supplement files store `Muon_*`/`Electron_*` as `std::vector<T>`
branches with no separate `nMuon`/`nElectron`, but uproot's writer has no way to
reproduce that encoding; it only ever writes jagged data as counter + flat branch. The
counter name is renameable via `mktree`'s `counter_name` argument, but not removable.
Use pyroot if you need to preserve the original counter-less encoding.
