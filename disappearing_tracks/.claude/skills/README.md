(SCAFFOLD -- outline only)

Analysis-specific skills go here.

- `disapptrks-track-diagnostics/` -- run, plot, and interpret DisappTrks_Nano
  PocketCoffea fake-track sideband and signal dE/dx diagnostics. Migrated from
  a Codex skill; the original also had an `agents/openai.yaml` (Codex's
  slash-command manifest), which was dropped since Claude Code discovers
  skills via the `SKILL.md` frontmatter alone.
- `disapptrks-lepton-backgrounds/` -- develop, run, and interpret the
  DisappTrks_Nano/PocketCoffea charged-lepton background estimate (Pveto,
  Poffline, Pmiss, fiducial maps, tau combination). Synthesized from three
  Codex memory/handoff/skills docs (heavily overlapping; de-duplicated here)
  plus the physics description in the group's dissertation reference PDF.
- `disapptrks-fake-track-background/` -- run the `fake_tracks` PocketCoffea
  mode and compute the actual fake-track background yield (the AN Chapter-5
  Z->ll d0-transfer-factor method and the newer general transfer-factor-
  category method). Built directly from the `DisappTrks_Nano` CLI/code
  (`estimate-fake-tracks`, `make-standard-fake-track-estimate`,
  `src/disapptrks/fake_tracks.py`) plus the dissertation reference PDF --
  there was no Codex source doc for this one. Distinct from
  `disapptrks-track-diagnostics`, which develops dE/dx rejection cuts rather
  than computing the yield.
- `disapptrks-signal-acceptance/` -- run the `signal_acceptance` PocketCoffea
  mode's primary product: the paired before/after cumulative cutflow measuring
  signal efficiency lost to the `highPurity` track-ID requirement
  (`summarize-signal-high-purity`, `CartesianSelection`-based categories). Also
  built directly from the code, no Codex source doc. Note: this is not a named
  systematic in the dissertation reference PDF -- flagged explicitly in the
  skill rather than assumed. Distinct from `disapptrks-track-diagnostics`,
  which covers that same mode's optional compact signal dE/dx histograms.
- `disapptrks-lpc-execution/` -- the execution layer the other four skills
  above lack: actually SSH into the LPC, confirm the grid proxy, enter the
  `./shell` Apptainer container, run the job in tmux, and check on/collect
  results, rather than just stating the command. Builds on the root
  `lpc-remote-session` skill for the generic SSH/proxy/tmux mechanics and
  `setup_lpc.sh`'s newly-added `$DISAPPTRKS_NANO_DIR` export (see
  `references/environment.md`) so no personal LPC path needs to be hardcoded
  anywhere in this repo.

- `disapptrks-lpc-working-area-setup/` -- create a new LPC working area for a
  contributor who doesn't have one yet: any of the CMSSW_13/15/16 OSUNano production
  releases (standardized `AnalysisWorkstation/NanoProd_CMSSW_<N>/CMSSW_<version>/src`
  layout) and/or a DisappTrks_Nano checkout (nested inside CMSSW_15). Always checks
  what already exists first, and asks what's actually needed rather than assuming
  every contributor wants all of it -- a DisappTrks_Nano-only contributor may need
  zero OSUNano releases.
- `disapptrks-lepton-background-job-orchestration/` -- the "just run it" layer for the
  electron/muon charged-lepton background estimate: submits and monitors the
  `<flavor>_pveto` and `<flavor>_pmiss_poffline` jobs for a period, runs
  `estimate-lepton-background` once both finish, and publishes to the shared EOS
  output space (same ask-before-overwrite pattern as the fake-track orchestration
  skill below). Electron and muon only -- taus combine differently, see
  `disapptrks-lepton-backgrounds`.
- `disapptrks-fake-track-job-orchestration/` -- the "just run it" layer on top of
  `disapptrks-job-submission`, `disapptrks-lpc-execution`, and
  `disapptrks-fake-track-background`: given a request naming one or more run periods,
  checks the required dataset JSONs actually exist on the shared EOS space before
  submitting anything, submits/monitors the `basic`/`zmumu`/`zee` jobs, postprocesses,
  and publishes output to the shared EOS output space (`disapptrks publish-output`,
  added alongside `make-dataset-json --publish` in `src/disapptrks/datasets.py`/
  `cli.py`) -- asking the user how to resolve a conflict rather than ever silently
  overwriting.

- `disapptrks-nano-production-pass/` -- run a monitoring "pass" over the OSUv2
  custom-NanoAOD CRAB production/migration tracked in
  `disappearing_tracks/nano_v2_migration_checklist.md`: check the grid proxy,
  `crab status` across every tracked work area (CMSSW_13/el8 for 2022/2023,
  CMSSW_15/el9 for 2024/2025/2026), diagnose failures (ordinary churn vs. a real
  site/code/data problem) before resubmitting, validate completed datasets
  against v1 when asked, and keep the checklist current. This is the CRAB
  production tier -- distinct from `disapptrks-job-submission`/
  `disapptrks-lpc-execution`, which run PocketCoffea analysis jobs, not custom
  NanoAOD production.

For how `pocket_coffea/config.py`/`workflow.py` code in `DisappTrks_Nano` should
itself be written (cuts, categories, histograms, weights) -- as opposed to which
mode/CLI command to run -- see the root `pocketcoffea-conventions` skill, cross-linked
from all four analysis skills above. Its `ref/PocketCoffea` clone lives alongside the
other three in the table in this analysis's `CLAUDE.md`.
