# Structure Proposal (Draft)

A proposal for a generic analysis repo for the OSU CMS group.

Concepts:
 - Generic root `CLAUDE.md` and `.claude/skills` that every analysis would share. For example,
   skills such as running CRAB jobs, etc. could go here. Also information on how to access
   the various servers, like the tier 3 and the LPC.
 - Each analysis as its own directory with nested `CLAUDE.md` files and skills. So anything
   only needed for a single analysis can be put here. Run claude from within one of these
   directories usually. The `setup.py` script can be made so that it only includes what you need.
 - Per machine/user differences (i.e. username, filepaths) live in a gitignored `CLAUDE.loca.md`
   file that can be created with the `setup.py` script.
