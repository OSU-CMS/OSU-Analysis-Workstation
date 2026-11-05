#!/usr/bin/env bash
# The workstation's own key for reading T3 data. Root-owned, so students can use
# the mounts it backs without ever being able to read or copy the key. Also pins
# the T3 host key, and prints the restricted authorized_keys line to install on
# the T3 side. Usage: 40_t3_key.sh [workstation-IP-as-seen-by-the-T3]

# shellcheck source=../lib.sh
source "$(dirname "$0")/../lib.sh"
require_root

mkdir -p "$(dirname "$T3_KEY")"
chmod 700 "$(dirname "$T3_KEY")"

if [[ -f $T3_KEY ]]; then
    log "Key already exists at $T3_KEY -- not regenerating"
else
    log "Generating $T3_KEY"
    # No passphrase: the mounts have to come up unattended after a reboot. The key is
    # protected by file permissions here and by the from=/restrict/read-only options
    # on the T3 side instead.
    ssh-keygen -t ed25519 -N "" -C "milliqan-workstation@$(hostname -s)" -f "$T3_KEY"
fi
chmod 600 "$T3_KEY"

if [[ -s $T3_KNOWN_HOSTS ]]; then
    log "T3 host key already pinned in $T3_KNOWN_HOSTS"
else
    log "Fetching $T3_HOST host keys"
    scanned=$(ssh-keyscan -T 10 "$T3_HOST" 2>/dev/null) || true
    [[ -n $scanned ]] || die "could not reach $T3_HOST -- check the network/VPN"
    scanned_file=$(mktemp)
    printf '%s\n' "$scanned" > "$scanned_file"
    ssh-keygen -lf "$scanned_file"
    rm -f "$scanned_file"
    echo
    echo "Compare against the fingerprints from a session you trust, e.g. run this on cms-t3:"
    echo "    for k in /etc/ssh/ssh_host_*_key.pub; do ssh-keygen -lf \$k; done"
    confirm "Do the fingerprints match?" || die "not pinned -- don't proceed until they match"
    printf '%s\n' "$scanned" > "$T3_KNOWN_HOSTS"
    chmod 644 "$T3_KNOWN_HOSTS"
fi

ip=${1:-$(ip -4 route get 1.1.1.1 | awk '{for (i = 1; i < NF; i++) if ($i == "src") print $(i + 1)}')}
[[ -n $ip ]] || die "could not work out this machine's IP -- pass it as an argument"

echo
log "Install this single line in ~/.ssh/authorized_keys of the T3 account (${T3_USER:-not chosen yet}):"
echo
echo "from=\"$ip\",restrict,command=\"$T3_SFTP_SERVER -R\" $(cat "$T3_KEY.pub")"
echo
cat <<EOF
What the options do:
  from="$ip"   the key only works when connecting from this workstation
                (if the T3 sees campus NAT instead, ask IT which address to use)
  restrict      no shell, terminal, or port/agent/X11 forwarding
  command=...   forces a read-only sftp server -- enough for sshfs, nothing else

Once it's installed, run provision/50_t3_mounts.sh.
EOF
