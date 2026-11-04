#!/usr/bin/env bash
# Key-only SSH: no passwords, no root login. Refuses to run unless the admin
# running it already has a working key, so it can't lock you out.

# shellcheck source=../lib.sh
source "$(dirname "$0")/../lib.sh"
require_root

admin=${SUDO_USER:-}
[[ -n $admin && $admin != root ]] || die "run via sudo from your own (admin) account, not as root directly"
admin_home=$(getent passwd "$admin" | cut -d: -f6)
keys="$admin_home/.ssh/authorized_keys"
if [[ ! -s $keys ]]; then
    die "$keys is empty or missing -- set up and test key login for $admin before disabling passwords"
fi
echo "Admin $admin has $(grep -c '^ssh-\|^ecdsa-' "$keys") key(s) in $keys."
echo "Make sure you have logged in with one of them (not a password) in a separate session."
confirm "Disable password and root SSH logins now?" || die "aborted, nothing changed"

# EL9's sshd reads sshd_config.d/*.conf in order and the first value set wins,
# so 40- takes precedence over the distribution's 50-redhat.conf.
conf=/etc/ssh/sshd_config.d/40-milliqan.conf
content=$(cat <<'EOF'
# milliqan workstation (written by milliqan/workstation/provision/20_sshd.sh)
PasswordAuthentication no
KbdInteractiveAuthentication no
PermitRootLogin no
PubkeyAuthentication yes
EOF
)
if write_if_changed "$conf" "$content"; then
    chmod 600 "$conf"
    sshd -t || { rm -f "$conf"; die "sshd config test failed -- drop-in removed, nothing reloaded"; }
    systemctl reload sshd
    log "sshd reloaded. Keep this session open and test a new key login before logging out."
else
    log "sshd drop-in already in place"
fi

log "Effective settings:"
sshd -T | grep -E '^(passwordauthentication|kbdinteractiveauthentication|permitrootlogin|pubkeyauthentication) '
