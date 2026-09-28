#!/usr/bin/env python3
"""Add a new sshfs mount to this analysis's mount config.

Prompts for the mount's name, SSH alias (a Host entry in ~/.ssh/config), remote
path, and a short description. Appends a line to .mount-config (read by
scripts/mount.sh) and a row to CLAUDE.local.md's mount table, writing that file
with a preamble first if it doesn't exist yet. Both files are gitignored and
per-machine -- see the "Mount points" section of CLAUDE.md.
"""

from __future__ import annotations

from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MOUNT_CONFIG = ROOT / ".mount-config"
CLAUDE_LOCAL = ROOT / "CLAUDE.local.md"

MOUNT_CONFIG_PREAMBLE = (
    "# LPC work areas mounted locally over sshfs -- see scripts/mount.sh and the\n"
    '# "Mount points" section of CLAUDE.md.\n'
    "#\n"
    "# One entry per line: name:ssh_alias:remote_path[:local_path]\n"
    "# ssh_alias is a Host entry from ~/.ssh/config. local_path defaults to name,\n"
    "# and is resolved under mnt/.\n"
)

CLAUDE_LOCAL_PREAMBLE = (
    '(Machine-specific, not shared -- see the "Mount points" section of CLAUDE.md.\n'
    "Generated/extended by scripts/add_mount.py.)\n\n"
    "LPC work areas mounted locally over SSHFS under `mnt/`:\n\n"
)
TABLE_HEADER = "| Mount point | Remote path | Purpose |\n"
TABLE_SEP = "|---|---|---|\n"


def existing_names() -> set[str]:
    if not MOUNT_CONFIG.exists():
        return set()
    names = set()
    for line in MOUNT_CONFIG.read_text().splitlines():
        line = line.split("#", 1)[0].strip()
        if line:
            names.add(line.split(":", 1)[0])
    return names


def append_mount_config(name: str, ssh_alias: str, remote_path: str) -> None:
    line = f"{name}:{ssh_alias}:{remote_path}\n"
    if MOUNT_CONFIG.exists():
        text = MOUNT_CONFIG.read_text()
        if text and not text.endswith("\n"):
            text += "\n"
        text += line
    else:
        text = MOUNT_CONFIG_PREAMBLE + line
    MOUNT_CONFIG.write_text(text)
    print(f"Appended to {MOUNT_CONFIG}.")


def append_claude_local(name: str, remote_path: str, description: str) -> None:
    row = f"| `mnt/{name}/` | `{remote_path}` | {description} |\n"

    if not CLAUDE_LOCAL.exists():
        CLAUDE_LOCAL.write_text(CLAUDE_LOCAL_PREAMBLE + TABLE_HEADER + TABLE_SEP + row)
        print(f"Wrote {CLAUDE_LOCAL}.")
        return

    lines = CLAUDE_LOCAL.read_text().splitlines(keepends=True)
    table_line_indices = [i for i, l in enumerate(lines) if l.strip().startswith("|")]

    if table_line_indices:
        lines.insert(table_line_indices[-1] + 1, row)
    else:
        if lines and not lines[-1].endswith("\n"):
            lines[-1] += "\n"
        lines += ["\n", TABLE_HEADER, TABLE_SEP, row]

    CLAUDE_LOCAL.write_text("".join(lines))
    print(f"Updated {CLAUDE_LOCAL}.")


def main() -> None:
    name = input("Mount name (short, e.g. lpc-displaced-leptons): ").strip()
    if not name:
        print("Name is required.")
        return
    if name in existing_names():
        print(f"'{name}' is already in {MOUNT_CONFIG}.")
        return

    ssh_alias = input("SSH alias (a Host entry in ~/.ssh/config, e.g. fnal-claude): ").strip()
    remote_path = input("Remote path (e.g. /uscms_data/d3/lnestor/...): ").strip()
    description = input("Short description (purpose of this mount): ").strip()

    if not ssh_alias or not remote_path:
        print("SSH alias and remote path are required.")
        return

    append_mount_config(name, ssh_alias, remote_path)
    append_claude_local(name, remote_path, description)


if __name__ == "__main__":
    main()
