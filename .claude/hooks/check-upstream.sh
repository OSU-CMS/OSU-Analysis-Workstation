#!/usr/bin/env bash
# SessionStart hook: silently checks whether the current branch is behind its
# upstream. Prints nothing (and no JSON) when there's nothing to report, so a
# clean checkout stays invisible to both the user and Claude.
set -euo pipefail

timeout 15 git fetch --quiet 2>/dev/null || exit 0

upstream=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null) || exit 0

behind=$(git rev-list --count "HEAD..$upstream" 2>/dev/null) || exit 0

if [ "$behind" -eq 0 ]; then
  exit 0
fi

branch=$(git rev-parse --abbrev-ref HEAD)
plural=commits
if [ "$behind" -eq 1 ]; then
  plural=commit
fi
msg="Your local branch '$branch' is $behind $plural behind $upstream. Run git pull to update."

# Minimal JSON string escaping (backslash, double quote) -- no jq/python dependency.
esc_msg=${msg//\\/\\\\}
esc_msg=${esc_msg//\"/\\\"}

printf '{"systemMessage": "%s", "hookSpecificOutput": {"hookEventName": "SessionStart", "additionalContext": "%s"}}\n' \
  "$esc_msg" "$esc_msg"
