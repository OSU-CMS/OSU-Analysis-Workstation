# shellcheck shell=bash
# Shared helpers for the workstation scripts. Sourced, not run.

set -euo pipefail

WS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=config.sh
source "$WS_DIR/config.sh"

log()  { printf '==> %s\n' "$*"; }
warn() { printf 'WARNING: %s\n' "$*" >&2; }
die()  { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

require_root() {
    [[ $EUID -eq 0 ]] || die "run this with sudo"
}

# Ask before doing something; the default answer is no.
confirm() {
    local reply
    read -r -p "$1 [y/N] " reply
    [[ $reply == [yY] || $reply == [yY][eE][sS] ]]
}

# Write $2 to file $1 only if the content differs; returns 0 if it changed.
write_if_changed() {
    local path=$1 content=$2
    if [[ -f $path ]] && [[ "$(cat "$path")" == "$content" ]]; then
        return 1
    fi
    printf '%s\n' "$content" > "$path"
    return 0
}

# Local mount point for a remote T3 path.
mount_point_for() {
    printf '%s%s\n' "$MOUNT_ROOT" "$1"
}
