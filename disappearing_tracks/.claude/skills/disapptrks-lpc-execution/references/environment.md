# One-time environment setup (per LPC account)

`DisappTrks_Nano`'s LPC workflow needs a one-time bootstrap on `cmslpc`, run from the
repository root:

```bash
./setup_lpc.sh
```

This (see `setup_lpc.sh` and `README.md` in the checkout):

- Runs PocketCoffea's `lpcjobqueue` bootstrap, which writes the `./shell`
  Apptainer/Singularity entrypoint and a repo-local `.bashrc`. The actual `.env` Python
  venv is *not* built at this point -- it's created lazily the first time `./shell` is
  entered (that `.bashrc` contains `[[ -d .env ]] || install_env`, which only runs once
  the file is sourced inside the container). Don't expect `.env` to exist immediately
  after `setup_lpc.sh` finishes; it appears after the first `./shell`.
- Appends a block to that same repo-local `.bashrc` that pins the `pocket-coffea`
  console script to the venv Python (works around an LPC container quirk where it can
  otherwise resolve to a Python that doesn't see `lpcjobqueue`), and installs the local
  analysis package (`pip install -e '.[analysis]'`) so it's importable by Dask workers.
- Exports the checkout's absolute path in that `.bashrc` as `$DISAPPTRKS_NANO_DIR`.
  **This is only visible once you're already inside `./shell`** -- `./shell` runs
  `apptainer exec ... --pwd /srv $IMAGE /bin/bash --rcfile /srv/.bashrc`, i.e. the repo
  root is bind-mounted to `/srv` and *that* copy of `.bashrc` is what's sourced, not
  your real LPC `~/.bashrc`, and `--rcfile` only takes effect for an interactive shell.
  Useful for scripts running inside the container; useless for discovering the path
  from outside it.
- Also writes the same path to a plain file, `~/.disapptrks_nano_dir`, in the *real*
  home directory. This is the one to use for discovery: readable with a bare
  `ssh cmslpc "cat ~/.disapptrks_nano_dir"`, no shell-sourcing or TTY/interactivity
  concerns at all, and it works before you know where the checkout is or have ever run
  `./shell`. Unlike the `.bashrc` block (which only ever gets written once and is
  never updated), this file is rewritten to the current path every time `setup_lpc.sh`
  runs, so it self-corrects if a checkout ever moves.

Both the `.bashrc` block and the marker file are independent of the original
`lpcjobqueue` bootstrap and of each other -- re-running `./setup_lpc.sh` on an existing
installation adds whichever of them is missing without disturbing what's already there.
It's safe to re-run.

If `~/.disapptrks_nano_dir` is missing, either this version of `setup_lpc.sh` predates
the file being added (re-run it from the checkout root) or it's never been run on this
account. Don't guess a path as a substitute -- ask the user, or have them run
`setup_lpc.sh`, if this comes up. If there's more than one `DisappTrks_Nano` checkout
under the same account, the file reflects whichever one `setup_lpc.sh` was run in most
recently -- it is not per-checkout.

Verified end to end on real LPC infrastructure (2026-09-01): both the upgrade path
(re-running the updated script against an existing installation that already had the
original `lpcjobqueue` setup) and a genuine from-scratch install (fresh clone, full
bootstrap) produced the expected `.bashrc` content and marker file, with no duplication
on repeat runs.
