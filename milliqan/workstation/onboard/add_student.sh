#!/usr/bin/env bash
# Create (or update) a student account: key-only login, milliqan group, and a
# private work area at $WORK_ROOT/<user>. Safe to rerun -- an existing account
# just gets the group and key added if missing.
#
# Usage: sudo add_student.sh <username> <public-key-file> ["Full Name"]
# The student sends you their PUBLIC key (~/.ssh/id_ed25519.pub) -- never a private key.

# shellcheck source=../lib.sh
source "$(dirname "$0")/../lib.sh"
require_root

[[ $# -ge 2 ]] || die "usage: $0 <username> <public-key-file> [\"Full Name\"]"
user=$1 pubkey_file=$2 full_name=${3:-}

[[ $user =~ ^[a-z_][a-z0-9_-]{0,31}$ ]] || die "invalid username: $user"
[[ -f $pubkey_file ]] || die "no such file: $pubkey_file"
grep -q 'PRIVATE KEY' "$pubkey_file" && die "$pubkey_file is a PRIVATE key -- ask for the .pub file instead"
ssh-keygen -lf "$pubkey_file" >/dev/null 2>&1 || die "$pubkey_file isn't a valid public key"
getent group "$MQ_GROUP" >/dev/null || die "group $MQ_GROUP missing -- run provision/10_base.sh first"

if id "$user" >/dev/null 2>&1; then
    log "Account $user exists -- making sure it's in $MQ_GROUP"
    usermod -aG "$MQ_GROUP" "$user"
else
    log "Creating account $user"
    # No password is set, so the account can only be reached with an SSH key.
    comment=()
    [[ -n $full_name ]] && comment=(-c "$full_name")
    useradd -m -s /bin/bash -G "$MQ_GROUP" "${comment[@]}" "$user"
fi

home=$(getent passwd "$user" | cut -d: -f6)
install -d -m 700 -o "$user" -g "$user" "$home/.ssh"
keys="$home/.ssh/authorized_keys"
touch "$keys"
key=$(grep -v '^\s*$' "$pubkey_file" | head -1)
if grep -qxF "$key" "$keys"; then
    log "Key already installed"
else
    printf '%s\n' "$key" >> "$keys"
    log "Key installed: $(ssh-keygen -lf "$pubkey_file")"
fi
chown "$user:$user" "$keys"
chmod 600 "$keys"

log "Work area $WORK_ROOT/$user"
install -d -m 700 -o "$user" -g "$user" "$WORK_ROOT/$user"
[[ -e $home/work ]] || ln -s "$WORK_ROOT/$user" "$home/work"
chown -h "$user:$user" "$home/work"

host=$(hostname -f)
cat <<EOF

Done. Send $user these steps for their laptop:

  1. Add to ~/.ssh/config (create it if needed):

       Host milliqan-ws
           HostName $host
           User $user
           IdentityFile ~/.ssh/id_ed25519

  2. Test:   ssh milliqan-ws
     (off campus: connect the OSU VPN first)

  3. In VS Code: install the "Remote - SSH" extension, then
     "Remote-SSH: Connect to Host..." -> milliqan-ws

Everything -- code, data, plots -- stays on the workstation. Work in ~/work
(their private area on the large disk); home is for config only.
EOF
