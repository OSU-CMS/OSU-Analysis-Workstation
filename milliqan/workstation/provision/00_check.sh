#!/usr/bin/env bash
# Read-only survey of the machine: OS, CPU features, RAM, disks, and what the
# later provisioning steps have already done. Safe to run without sudo, any time.

# shellcheck source=../lib.sh
source "$(dirname "$0")/../lib.sh"
set +e   # report everything, don't stop at the first missing piece

log "OS"
grep -E '^(PRETTY_NAME|VERSION_ID)=' /etc/os-release

log "CPU"
lscpu | grep -E '^(Model name|Socket\(s\)|CPU\(s\)):'
for level in v2 v3; do
    if [[ $level == v2 ]]; then flags="cx16 lahf_lm popcnt sse4_1 sse4_2 ssse3"
    else flags="avx avx2 bmi1 bmi2 f16c fma abm movbe xsave"; fi
    missing=""
    for f in $flags; do grep -qw "$f" /proc/cpuinfo || missing+=" $f"; done
    if [[ -z $missing ]]; then echo "x86-64-$level: ok"; else echo "x86-64-$level: MISSING$missing"; fi
done

log "Memory"
free -g | head -2

log "Disks"
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT
df -h / /home "$WORK_ROOT" 2>/dev/null

log "Provisioning state"
getent group "$MQ_GROUP" >/dev/null && echo "group $MQ_GROUP: exists" || echo "group $MQ_GROUP: missing"
[[ -d $WORK_ROOT ]] && echo "$WORK_ROOT: exists" || echo "$WORK_ROOT: missing"
rpm -q fuse-sshfs >/dev/null && echo "fuse-sshfs: installed" || echo "fuse-sshfs: not installed"
[[ -f /etc/ssh/sshd_config.d/40-milliqan.conf ]] && echo "sshd drop-in: present" || echo "sshd drop-in: missing"
[[ -x $ENV_ROOT/miniforge3/envs/$ENV_NAME/bin/python3 ]] \
    && echo "shared env: $("$ENV_ROOT/miniforge3/envs/$ENV_NAME/bin/python3" --version)" \
    || echo "shared env: missing"
[[ -f $T3_KEY.pub ]] && echo "T3 key: present" || echo "T3 key: missing"
for remote in "${T3_MOUNTS[@]}"; do
    mp=$(mount_point_for "$remote")
    if mountpoint -q "$mp"; then echo "mount $mp: mounted"
    elif [[ -d $mp ]]; then echo "mount $mp: not mounted (automount triggers on first access)"
    else echo "mount $mp: missing"; fi
done
[[ -f /etc/systemd/system/user-.slice.d/50-milliqan.conf ]] && echo "user limits: present" || echo "user limits: missing"
