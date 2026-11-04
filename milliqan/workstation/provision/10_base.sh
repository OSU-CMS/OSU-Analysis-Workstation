#!/usr/bin/env bash
# Base packages, the milliqan group, the per-user work area, and the login
# profile that points every bash session at the shared env and T3 data.

# shellcheck source=../lib.sh
source "$(dirname "$0")/../lib.sh"
require_root

grep -q '^ID="almalinux"' /etc/os-release || warn "not AlmaLinux -- written for AlmaLinux 9, check package names"

log "Installing base packages"
dnf install -y epel-release
dnf install -y tmux git htop smartmontools fuse-sshfs bzip2 wget

log "Group $MQ_GROUP"
getent group "$MQ_GROUP" >/dev/null || groupadd "$MQ_GROUP"

log "Work area $WORK_ROOT"
# Owned by root; each student gets their own 700 subdirectory (onboard/add_student.sh).
mkdir -p "$WORK_ROOT"
chown root:root "$WORK_ROOT"
chmod 755 "$WORK_ROOT"

log "Login profile /etc/profile.d/milliqan.sh"
profile=$(cat <<EOF
# milliqan workstation environment (written by milliqan/workstation/provision/10_base.sh)
export MILLIQAN_ENV="$ENV_ROOT/miniforge3/envs/$ENV_NAME"
export T3DATA="$MOUNT_ROOT"
alias mqpython="\$MILLIQAN_ENV/bin/python3"
# Activate the shared env in the current shell.
mqenv() { source "$ENV_ROOT/miniforge3/bin/activate" "$ENV_NAME"; }
EOF
)
write_if_changed /etc/profile.d/milliqan.sh "$profile" && echo "written" || echo "unchanged"
chmod 644 /etc/profile.d/milliqan.sh

log "Done"
