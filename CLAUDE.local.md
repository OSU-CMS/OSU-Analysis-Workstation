(SCAFFOLD -- outline only; normally gitignored/per-machine, committed here just for demo)

Would contain:

- LPC username, grid proxy path (machine-specific, not the same for every teammate)
- Whether sshfs mounting works on this machine, and which fallback to use if not
  (though see README -- this specific fact probably wants a SessionStart hook instead
  of a static note here, since it needs to be reliably enforced, not just suggested)
- Any other personal, non-shared preferences for this project
