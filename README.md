# Structure Proposal (Draft)

A proposal for a generic analysis repo for the OSU CMS group.

## Getting started

`disappearing_tracks/` is the first real (non-scaffold) instance of this pattern --
other analyses below are still outlines. To contribute to it:

1. Clone this repo.
2. Run `scripts/setup.py` once per machine (LPC SSH aliases, `ref/` reference clones,
   your LPC username, and disappearing_tracks' CMSSW work areas).
3. Read the root [`CLAUDE.md`](CLAUDE.md) for group-wide conventions, then
   [`disappearing_tracks/CLAUDE.md`](disappearing_tracks/CLAUDE.md) for the analysis
   itself.

Concepts:
 - Generic root `CLAUDE.md` and `.claude/skills` that every analysis would share. For example,
   skills such as running CRAB jobs, etc. could go here. Also information on how to access
   the various servers, like the tier 3 and the LPC.
 - Each analysis as its own directory with nested `CLAUDE.md` files and skills. So anything
   only needed for a single analysis can be put here. Run claude from within one of these
   directories usually. The `setup.py` script can be made so that it only includes what you need.
 - Per machine/user differences (i.e. username, filepaths) live in a gitignored `CLAUDE.loca.md`
   file that can be created with the `setup.py` script.
