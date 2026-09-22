#!/bin/bash
# Generic sshfs mount/unmount/status for LPC work areas.
#
# Reads .mount-config in the analysis root: one entry per line,
# "name:ssh_alias:remote_path[:local_path]" (blank lines and lines starting
# with # are skipped). ssh_alias is a Host entry from ~/.ssh/config -- it
# supplies the actual server, user, and auth/multiplexing settings, so
# nothing here is hardcoded to one server. local_path defaults to name. Mount
# points land under mnt/, next to this script's parent directory.
#
# Usage: mount.sh {mount|unmount|status} [name]
# With no name, the command applies to every entry in the config.

HERE="$(cd "$(dirname "$0")/.." && pwd)"
BASE="$HERE/mnt"
CONFIG="$HERE/.mount-config"

usage() {
    echo "Usage: $0 {mount|unmount|status} [name]"
    exit 1
}

# Prints matching "name ssh_alias remote localdir" tuples, one per line.
matching_entries() {
    local filter="$1"
    local found=0
    local name ssh_alias remote localdir

    while IFS=: read -r name ssh_alias remote localdir; do
        name="$(echo "$name" | xargs)"
        [ -z "$name" ] && continue
        case "$name" in \#*) continue ;; esac

        if [ -z "$filter" ] || [ "$name" = "$filter" ]; then
            found=1
            echo "$name $ssh_alias $remote ${localdir:-$name}"
        fi
    done < "$CONFIG"

    if [ "$found" -eq 0 ] && [ -n "$filter" ]; then
        echo "No such mount config entry: $filter" >&2
        exit 1
    fi
}

ensure_ssh_master() {
    local ssh_alias="$1"
    if ! ssh -O check "$ssh_alias" &>/dev/null; then
        echo "Starting SSH master connection to $ssh_alias..."
        ssh -N -f "$ssh_alias"
    fi
}

cmd_mount() {
    local entries
    entries="$(matching_entries "${1:-}")" || exit 1
    [ -z "$entries" ] && return

    echo "$entries" | while read -r name ssh_alias remote localdir; do
        mountpoint_dir="$BASE/$localdir"
        mkdir -p "$mountpoint_dir"

        if mountpoint -q "$mountpoint_dir"; then
            echo "Already mounted: $name"
        else
            ensure_ssh_master "$ssh_alias"
            echo "Mounting $name..."
            sshfs "$ssh_alias":"$remote" "$mountpoint_dir" \
                -o reconnect \
                -o ServerAliveInterval=15 \
                -o ServerAliveCountMax=3 \
                -o follow_symlinks \
                && echo "  OK" || echo "  FAILED"
        fi
    done
}

cmd_unmount() {
    local entries
    entries="$(matching_entries "${1:-}")" || exit 1
    [ -z "$entries" ] && return

    echo "$entries" | while read -r name ssh_alias remote localdir; do
        mountpoint_dir="$BASE/$localdir"

        if mountpoint -q "$mountpoint_dir"; then
            echo "Unmounting $name..."
            fusermount -u "$mountpoint_dir" && echo "  OK" || echo "  FAILED"
        else
            echo "Not mounted: $name"
        fi
    done
}

cmd_status() {
    local entries
    entries="$(matching_entries "${1:-}")" || exit 1

    echo "$entries" | while read -r name ssh_alias remote localdir; do
        mountpoint_dir="$BASE/$localdir"

        if mountpoint -q "$mountpoint_dir"; then
            echo "  [mounted]   $name"
        else
            echo "  [unmounted] $name"
        fi
    done

    echo ""
    echo "$entries" | awk '{print $2}' | sort -u | while read -r ssh_alias; do
        ssh -O check "$ssh_alias" 2>&1 && echo "SSH master ($ssh_alias): active" \
            || echo "SSH master ($ssh_alias): inactive"
    done
}

case "${1:-}" in
    mount)   cmd_mount "${2:-}" ;;
    unmount) cmd_unmount "${2:-}" ;;
    status)  cmd_status "${2:-}" ;;
    *)       usage ;;
esac
