#!/usr/bin/env bash
# Read-only sshfs mounts of the T3 data areas in config.sh's T3_MOUNTS, as
# systemd automounts: each mounts on first access and comes back after a reboot
# or dropped connection. Mounted by root with the key from 40_t3_key.sh, and
# visible (read-only) to every user.

# shellcheck source=../lib.sh
source "$(dirname "$0")/../lib.sh"
require_root

[[ -n $T3_USER ]] || die "set T3_USER in config.sh first"
[[ -f $T3_KEY && -s $T3_KNOWN_HOSTS ]] || die "run 40_t3_key.sh first"
command -v sshfs >/dev/null || die "sshfs missing -- run 10_base.sh first"

ssh_opts="IdentityFile=$T3_KEY,UserKnownHostsFile=$T3_KNOWN_HOSTS,StrictHostKeyChecking=yes,BatchMode=yes"

log "Checking the key works against $T3_USER@$T3_HOST"
first=${T3_MOUNTS[0]}
if ! echo "ls $first" | sftp -b - -o "IdentityFile=$T3_KEY" -o "UserKnownHostsFile=$T3_KNOWN_HOSTS" \
        -o StrictHostKeyChecking=yes -o BatchMode=yes "$T3_USER@$T3_HOST" >/dev/null; then
    die "sftp check failed -- is the authorized_keys line from 40_t3_key.sh installed for $T3_USER, and does $first exist and is it readable by that account?"
fi

changed=false
for remote in "${T3_MOUNTS[@]}"; do
    mp=$(mount_point_for "$remote")
    unit=$(systemd-escape --path --suffix=mount "$mp")
    auto=${unit%.mount}.automount
    mkdir -p "$mp"

    mount_unit=$(cat <<EOF
# milliqan workstation (written by milliqan/workstation/provision/50_t3_mounts.sh)
[Unit]
Description=T3 $remote (read-only)
Wants=network-online.target
After=network-online.target

[Mount]
What=$T3_USER@$T3_HOST:$remote
Where=$mp
Type=fuse.sshfs
Options=ro,_netdev,allow_other,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3,$ssh_opts
TimeoutSec=30
EOF
)
    automount_unit=$(cat <<EOF
# milliqan workstation (written by milliqan/workstation/provision/50_t3_mounts.sh)
[Unit]
Description=Automount T3 $remote (read-only)

[Automount]
Where=$mp

[Install]
WantedBy=multi-user.target
EOF
)
    write_if_changed "/etc/systemd/system/$unit" "$mount_unit" && changed=true
    write_if_changed "/etc/systemd/system/$auto" "$automount_unit" && changed=true
done

if $changed; then
    systemctl daemon-reload
fi

for remote in "${T3_MOUNTS[@]}"; do
    mp=$(mount_point_for "$remote")
    auto=$(systemd-escape --path --suffix=automount "$mp")
    systemctl enable --now "$auto"
    if ls "$mp" >/dev/null 2>&1; then
        echo "$mp: ok ($(ls "$mp" | wc -l) entries)"
    else
        warn "$mp: could not list -- check: journalctl -u $(systemd-escape --path --suffix=mount "$mp")"
    fi
done

log "Write test (should be refused)"
probe="$(mount_point_for "$first")/.milliqan_write_test"
if touch "$probe" 2>/dev/null; then
    rm -f "$probe"
    warn "WRITE SUCCEEDED -- the mount is not read-only, check the mount options and T3 forced command"
else
    echo "refused, as intended"
fi
