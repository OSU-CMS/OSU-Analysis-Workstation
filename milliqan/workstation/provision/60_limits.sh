#!/usr/bin/env bash
# Per-user memory/CPU/process limits via systemd user slices (cgroup v2), so one
# student's job can't stall the machine for everyone else. Each user's limit
# covers all of their sessions together. Values come from config.sh.

# shellcheck source=../lib.sh
source "$(dirname "$0")/../lib.sh"
require_root

dir=/etc/systemd/system/user-.slice.d
mkdir -p "$dir"
content=$(cat <<EOF
# milliqan workstation (written by milliqan/workstation/provision/60_limits.sh)
[Slice]
MemoryMax=$USER_MEMORY_MAX
CPUQuota=$USER_CPU_QUOTA
TasksMax=$USER_TASKS_MAX
EOF
)
if write_if_changed "$dir/50-milliqan.conf" "$content"; then
    systemctl daemon-reload
    log "Limits written; they apply to new login sessions"
else
    log "Limits already in place"
fi
echo "MemoryMax=$USER_MEMORY_MAX CPUQuota=$USER_CPU_QUOTA TasksMax=$USER_TASKS_MAX per user"
echo "Check a logged-in user with: systemctl show user-\$(id -u <user>).slice -p MemoryMax -p CPUQuotaPerSecUSec"
