# shellcheck shell=bash
# Site settings for the milliqan analysis workstation. Sourced by every script in
# provision/ and onboard/ -- edit here, not in the scripts.

# Unix group every student account belongs to; owns read access to the shared env.
MQ_GROUP="milliqan"

# Per-student work area (large partition), one directory per user: /work/<user>.
WORK_ROOT="/work"

# Shared, read-only Python/ROOT environment (Miniforge install + "milliqan" env).
ENV_ROOT="/opt/milliqan"
ENV_NAME="milliqan"

# --- OSU T3 data access (read-only sshfs, see provision/40 and provision/50) ---

T3_HOST="cms-t3.mps.ohio-state.edu"

# T3 account the workstation connects as. Not decided yet: either a new service
# account created by the T3 admins, or the existing shared `milliqan` account
# (only with the agreement of the people who use it). Must be set before
# provision/50 runs.
T3_USER=""

# Root-owned key and pinned host key for that connection. Students never see either.
T3_KEY="/etc/milliqan/t3_ed25519"
T3_KNOWN_HOSTS="/etc/milliqan/t3_known_hosts"

# sftp-server path on the T3 side, used in the forced command of the restricted
# authorized_keys line (check with `ls /usr/libexec/openssh/sftp-server` on cms-t3).
T3_SFTP_SERVER="/usr/libexec/openssh/sftp-server"

# Remote T3 directories to mount. Each appears at the same path under MOUNT_ROOT,
# e.g. /abyss/users/mjoyce/MilliQan_skims -> /t3data/abyss/users/mjoyce/MilliQan_skims,
# so converting a cms-t3 path to a workstation path is just adding the prefix.
MOUNT_ROOT="/t3data"
T3_MOUNTS=(
    "/store/user/milliqan/trees"            # offline trees (see milliqan/CLAUDE.md)
    "/abyss/users/mjoyce/MilliQan_skims"    # v36 beam skims used by the tutorial
)

# --- Per-user resource limits (systemd user slices, provision/60) ---
# Applies to every login session, so one student's runaway job can't stall the
# machine for everyone. Heavy work belongs on T3 Condor anyway.
USER_MEMORY_MAX="40%"     # of total RAM, per user
USER_CPU_QUOTA="400%"     # 100% = one core
USER_TASKS_MAX="2048"
