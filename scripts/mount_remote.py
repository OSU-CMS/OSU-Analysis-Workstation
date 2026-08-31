#!/usr/bin/env python3
# SCAFFOLD -- not implemented. Generic version of the current fnal-mount.sh:
#   - reads its mount table from .mount-config.local.sh (per-user, gitignored)
#     instead of a hardcoded array, so it doesn't assume any one LPC directory layout
# Usage: mount_remote.py {mount|umount|status}
