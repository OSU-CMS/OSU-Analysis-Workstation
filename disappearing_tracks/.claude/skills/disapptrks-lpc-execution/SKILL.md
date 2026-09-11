---
name: disapptrks-lpc-execution
description: Actually execute a DisappTrks_Nano PocketCoffea command end-to-end on the FNAL LPC -- SSH in, confirm the grid proxy, enter the analysis's Apptainer/Singularity environment, run the job inside tmux, and check on/collect results -- rather than just stating the command for the user to run themselves. Use whenever asked to run, submit, kick off, or "make the histograms/plots/output for" any DisappTrks_Nano PocketCoffea mode (high_purity_study, signal_acceptance, fake_tracks, the lepton-background modes, etc.). For the exact DISAPPTRKS_* command/env-var/executor invocation for a given mode, use disapptrks-job-submission; for what a mode actually measures and the plotting/postprocessing command afterward, use the relevant analysis skill (disapptrks-track-diagnostics, disapptrks-signal-acceptance, disapptrks-fake-track-background, disapptrks-lepton-backgrounds) -- this skill supplies the surrounding execution mechanics, not the physics command itself.
---

# Running DisappTrks_Nano PocketCoffea Jobs on the LPC

This is the "how do I actually run this" layer. It assumes another skill (or the user)
has already supplied the specific `DISAPPTRKS_*` command and the
plotting/postprocessing command to run afterward -- if neither is available yet,
consult `disapptrks-job-submission` for the exact invocation (env vars,
dataset JSON/sample/year, executor/scaleout/queue), and
`disapptrks-track-diagnostics`, `disapptrks-signal-acceptance`,
`disapptrks-fake-track-background`, or `disapptrks-lepton-backgrounds` for
what the mode actually measures and how to postprocess it.

For the generic SSH/proxy/tmux mechanics this builds on, read the `lpc-remote-session`
skill first if unfamiliar with them.

## The end-to-end sequence

1. **SSH to the LPC.** Use the host alias from `~/.ssh/config` (see
   `lpc-remote-session`).
2. **Navigate to the checkout.** `setup_lpc.sh` records the checkout path in
   `~/.disapptrks_nano_dir` (a plain file in the real home directory, readable from an
   ordinary non-interactive SSH command -- no shell needs to be sourced, and you don't
   need to already be inside the checkout or `./shell` to find it). Do not hardcode or
   guess an absolute path -- if the file is missing, see
   [references/environment.md](references/environment.md) before proceeding.

   ```bash
   ssh cmslpc "cat ~/.disapptrks_nano_dir"
   ```

   `setup_lpc.sh` also exports `$DISAPPTRKS_NANO_DIR` in the checkout's own `.bashrc`,
   but that one is only visible once you're already inside `./shell` (it's sourced via
   `--rcfile`, which only takes effect for an interactive shell) -- it's a convenience
   for scripts running inside the container, not a way to discover the path before
   you're in it. Use the file above for discovery; verified end-to-end on real LPC
   infrastructure, both against an existing installation and a from-scratch one.
3. **Check the grid proxy** (see `lpc-remote-session`) -- required before dataset
   access or Dask/Condor submission. Stop and ask the user to refresh it themselves if
   missing or expiring soon; never attempt to create or refresh it directly.
4. **Start (or reuse) a tmux session** named for the job (see `lpc-remote-session`).
5. **Enter the container** with `./shell` from the checkout root -- `DisappTrks_Nano`'s
   Apptainer/Singularity entrypoint (see `README.md`), not a plain login shell.
   Everything downstream must run *inside* this container, not the bare LPC shell.
6. **Confirm the environment**, the first time in a session (cheap; catches a stale or
   broken container early):

   ```bash
   which python                                          # expect /srv/.env/bin/python
   python -c "import disapptrks; print(disapptrks.__file__)"
   python -c "import lpcjobqueue; print(lpcjobqueue.__file__)"
   ```

   If `disapptrks` is missing, run `python -m pip install '.[analysis]'` from the
   checkout root, inside `./shell`, before proceeding.
7. **Run the job** from `pocket_coffea/`, using the specific `DISAPPTRKS_*` command
   from the relevant analysis skill, inside the tmux session so it survives a dropped
   connection. For a new mode/config, run a smoke test first
   (`--limit-files 1 --limit-chunks 1 --scaleout 2 --queue microcentury`, or whatever
   the specific skill recommends) before a full production submission.
8. **Check on it.** Dask/Condor submission returns control once workers are launched;
   the job itself runs asynchronously after that. Use `tmux capture-pane` (see
   `lpc-remote-session`) to check progress without attaching, and check the Condor log
   directory (`$HOME/pocketcoffea_dask_logs/<output-tag>/condor_log` per `README.md`)
   for worker-level failures.
9. **Postprocess/plot once the output exists.** Use the specific analysis skill's
   plotting/postprocessing command (e.g. `plot-high-purity-study`,
   `summarize-signal-high-purity`, `estimate-fake-tracks`) against the resulting
   `output_*.coffea` file(s). This can run inside the same `./shell` session.

## Common failure points

- Running the `python -m pocket_coffea...` command in the bare LPC login shell instead
  of inside `./shell` -- it won't have `lpcjobqueue` or the analysis package
  importable, and workers will fail to launch or import.
- Using the `pocket-coffea` console-script entrypoint instead of
  `python -m pocket_coffea.scripts.runner` -- `README.md` notes this can resolve to a
  Python outside the venv on LPC; prefer the module-invocation form.
- A worker `ImportError` almost always means it wasn't launched inside `./shell`, or
  the local analysis package needs reinstalling there (step 6).
- Treating "the runner command returned" as "the job is done" -- for the Dask
  executor, the command returns once workers are submitted, not once processing
  finishes. Check status before reporting a result or running the plotting command.

## Completion checks

- State which of the 9 steps above were actually performed this session vs. assumed
  already done (e.g. "reused an existing tmux session," "proxy was already valid").
- Never report a plot or table as final without confirming the underlying
  `output_*.coffea` file exists and the job's tmux pane / Condor logs show it finished
  without error.
