(SCAFFOLD -- outline only)

Analysis-specific skills go here.

- `osu-t3-remote-session/` -- connecting to and working on the OSU T3 cluster
  (T3_US_OSU) over SSH: OSU VPN check, login host mechanics, storage areas, HTCondor,
  tmux for long-running jobs.
- `milliqan-t3-working-area-setup/` -- creating/verifying the standardized
  `milliqanOffline` checkout at `~/scratch0/MilliqanWorkstation/milliqanOffline` on
  `cms-t3`. Builds on `osu-t3-remote-session`.
- `milliqan-uproot-tutorial/` -- interactive, Claude-guided walkthrough of the
  uproot-based analysis framework for a new user (opening files, cuts, histograms,
  the full milliqanCuts/Scheduler/Processor/Plotter framework) against real
  beam-muon data. Builds on `osu-t3-remote-session` and
  `milliqan-t3-working-area-setup`.
