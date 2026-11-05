#!/usr/bin/env bash
# Disable a student account without deleting anything: locks login, disables
# their SSH keys, and ends running sessions. Their home and work area are kept
# so results can be recovered; delete those by hand once nobody needs them.
#
# Usage: sudo remove_student.sh <username>

# shellcheck source=../lib.sh
source "$(dirname "$0")/../lib.sh"
require_root

[[ $# -eq 1 ]] || die "usage: $0 <username>"
user=$1
id "$user" >/dev/null 2>&1 || die "no such user: $user"
[[ $user != "${SUDO_USER:-}" ]] || die "refusing to disable your own account"
id -nG "$user" | grep -qw "$MQ_GROUP" || die "$user isn't in $MQ_GROUP -- not a student account, not touching it"

home=$(getent passwd "$user" | cut -d: -f6)
confirm "Disable $user (files in $home and $WORK_ROOT/$user are kept)?" || die "aborted"

usermod -L -e 1 "$user"
if [[ -f $home/.ssh/authorized_keys ]]; then
    mv "$home/.ssh/authorized_keys" "$home/.ssh/authorized_keys.disabled-$(date +%F)"
fi
loginctl terminate-user "$user" 2>/dev/null || true
log "$user disabled. Re-enable with: usermod -U -e '' $user, and restore the authorized_keys file."
