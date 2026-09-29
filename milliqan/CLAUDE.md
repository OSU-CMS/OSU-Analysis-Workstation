# milliQan Analysis

(SCAFFOLD -- outline only, filled in by whoever leads this analysis)

## Getting started

milliQan analysis work runs on the **OSU T3 cluster** (`T3_US_OSU`), not the FNAL
LPC -- this is the one thing in this workspace that doesn't follow the LPC-based
pattern the other analyses use, so don't assume `lpc-remote-session`/EOS/CRAB-on-LPC
conventions apply here.

New to this analysis? Just ask Claude in plain language, e.g. "connect me to the OSU
T3 cluster" or "help me set up SSH key access to cms-t3" -- this triggers the
`osu-t3-remote-session` skill (`.claude/skills/osu-t3-remote-session/`), which covers:

- Checking (not establishing) the OSU VPN connection -- required off-campus, via
  Cisco Secure Client/AnyConnect; connecting it is always the user's own action
- SSH login mechanics (`cms-t3.mps.ohio-state.edu` for analysis work vs.
  `cmshead.mps.ohio-state.edu` for account admin only)
- One-time SSH key setup so you're not typing a password on every connection
- Storage areas, HTCondor batch submission, and CMSSW/CRAB environment setup

Prerequisite Claude can't help with: an actual OSU T3 account. That's created by the
cluster admins (see the analysis maintainer/group), not something this workspace can
provision.

Would still contain, once decided:

- One-paragraph analysis blurb
- Active repos table (repo(s) + purpose)
- Reference clones (`ref/`) table
- Storage: personal subdirectory conventions for this analysis (`/data/users/$USER`,
  `/store/user/$USER` on the OSU T3 -- see `osu-t3-remote-session` for what these are)
- Scratch dirs
