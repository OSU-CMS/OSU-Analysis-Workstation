#!/usr/bin/env bash
# Shared, read-only Python/ROOT env for all students: Miniforge at
# $ENV_ROOT/miniforge3 with one env built from ../environment.yml.
# Pass --update to bring an existing env in line with environment.yml.

# shellcheck source=../lib.sh
source "$(dirname "$0")/../lib.sh"
require_root

update=false
[[ ${1:-} == --update ]] && update=true

conda="$ENV_ROOT/miniforge3/bin/conda"
env_prefix="$ENV_ROOT/miniforge3/envs/$ENV_NAME"

if [[ ! -x $conda ]]; then
    log "Installing Miniforge into $ENV_ROOT/miniforge3"
    mkdir -p "$ENV_ROOT"
    tmp=$(mktemp -d)
    trap 'rm -rf "$tmp"' EXIT
    base="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-$(uname -m).sh"
    wget -q -O "$tmp/miniforge.sh" "$base"
    wget -q -O "$tmp/miniforge.sh.sha256" "$base.sha256"
    expected=$(awk '{print $1}' "$tmp/miniforge.sh.sha256")
    actual=$(sha256sum "$tmp/miniforge.sh" | awk '{print $1}')
    [[ $expected == "$actual" ]] || die "Miniforge installer checksum mismatch"
    bash "$tmp/miniforge.sh" -b -p "$ENV_ROOT/miniforge3"
else
    log "Miniforge already at $ENV_ROOT/miniforge3"
fi

if [[ ! -d $env_prefix ]]; then
    log "Creating env $ENV_NAME (ROOT is large -- expect several minutes)"
    "$conda" env create -f "$WS_DIR/environment.yml"
elif $update; then
    log "Updating env $ENV_NAME from environment.yml"
    "$conda" env update -n "$ENV_NAME" -f "$WS_DIR/environment.yml" --prune
else
    log "Env $ENV_NAME already exists (use --update to sync it with environment.yml)"
fi

log "Permissions: readable by everyone, writable by root only"
chown -R root:root "$ENV_ROOT"
chmod -R go-w,a+rX "$ENV_ROOT"

log "Verifying imports"
"$env_prefix/bin/python3" - <<'EOF'
import uproot, awkward, awkward_pandas, hist, numpy, pandas, matplotlib
import ROOT
h = ROOT.TH1F("h", "h", 10, 0, 1)
h.Fill(0.5)
assert h.GetEntries() == 1
for m in (uproot, awkward, numpy, pandas, matplotlib, hist):
    print(f"{m.__name__:12s} {m.__version__}")
print(f"{'ROOT':12s} {ROOT.gROOT.GetVersion()}")
EOF
log "Done"
