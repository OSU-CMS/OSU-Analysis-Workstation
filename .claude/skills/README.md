Generic, tool-focused skills only:

- `lpc-eos` -- EOS storage on the FNAL LPC (listing/copying via the xrootd
  redirector, reading EOS files from ROOT/uproot/python)
- `lpc-crab` -- submitting, monitoring, and recovering CRAB jobs on the LPC
- `lpc-root` -- reading/writing ROOT files via uproot vs. pyroot
- `lpc-remote-session` -- SSH/grid-proxy/tmux mechanics for actually running
  something on cmslpc (not just stating the command). Never creates or
  refreshes a grid proxy itself -- checks validity and asks the user to
  refresh it when needed.
- `pocketcoffea-conventions` -- how to write PocketCoffea config/processor code
  the framework's own recommended way: `Cut`/`StandardSelection`/
  `CartesianSelection` for cutflows and categories, `HistConf`/`Axis` (and the
  `parameters.histograms` factories) for histograms, `WeightsManager`/
  `WeightWrapper` for scale factors, `ColOut` for ntuple-style output,
  Calibrators for object corrections/systematics. Generic to any analysis
  using PocketCoffea, even though only `disappearing_tracks` does today --
  check that analysis's `CLAUDE.md` for its `ref/PocketCoffea` clone.
- `python-style` -- PEP 8 import organization and blank-line style

`lpc-eos`, `lpc-crab`, `lpc-root`, and `python-style` were migrated from a
personal Codex/Claude workstation setup; `lpc-crab` and `lpc-eos` were
genericized in the process (placeholder usernames/paths in place of one
person's LPC account details, and `lpc-eos`'s description no longer ties it
to one analysis). `lpc-remote-session` was written from scratch to formalize
the execution mechanics `disapptrks-lpc-execution` (in `disappearing_tracks`)
needed and to fix a gap `lpc-crab` already followed implicitly but never
stated: never create or refresh a grid proxy -- only check it.
`pocketcoffea-conventions` was written from the upstream PocketCoffea
project's own docs (`docs/concepts.md`, `docs/configuration.md`, etc.) in its
`ref/PocketCoffea` clone, not general CMS-analysis assumptions.

Anything analysis-specific belongs in that analysis's own `.claude/skills/` instead.
