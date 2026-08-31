# Structure Proposal (Draft)

This is a scaffold, not a working setup. It shows a proposed directory structure for
turning the current single-user "analysis" repo into something the whole group can
share, across multiple analyses (displaced leptons, disappearing tracks, milliQan).

It demonstrates:

- A generic root `CLAUDE.md` + `.claude/skills/` that every analysis shares, with no
  analysis-specific names, paths, or physics in it.
- A "grouping directory" per analysis (`displaced_leptons/`, `disappearing_tracks/`,
  `milliqan/`) that IS tracked in this shared repo. Each holds that analysis's own
  `CLAUDE.md` + `.claude/skills/`. Claude Code loads these on demand only when you
  actually touch files inside that analysis's subtree, so an analysis you don't work
  on never enters your context -- but its docs still version in the one shared repo.
- Each analysis's actual code lives in its own separately-versioned git repo(s),
  cloned into the grouping directory and gitignored here (see `.gitignore`). For
  example `displaced_leptons/` (the grouping dir) would contain two cloned repos:
  `displaced_leptons/displaced_leptons/` and `displaced_leptons/DisplacedLeptonsSupplement/`.
- Per-machine/per-user differences (LPC username, grid proxy path, whether sshfs
  mounting actually works here) are meant to live in a gitignored `CLAUDE.local.md`
  and/or a generated local config -- never in anything committed.

Directories containing only a placeholder `README.md` stand in for where a real
analysis repo would be `git clone`d by `scripts/setup.sh` (not implemented in this
scaffold -- see the stub).

Open questions are called out inline as `(SCAFFOLD -- ...)` notes. Known unresolved
items:

- Whether `ref/` (shared reference clones) is one flat pool or split per-analysis --
  depends on whether analyses ever need different pins of the same clone (e.g. cmssw).
- Whether the style guidelines section is a group-wide standard or stays personal.
- Reliable per-machine mount-availability detection likely needs a `SessionStart`
  hook rather than a CLAUDE.md/CLAUDE.local.md sentence, since that's soft guidance
  Claude isn't guaranteed to follow, especially against a competing instruction.
