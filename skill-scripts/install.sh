#!/usr/bin/env bash
set -euo pipefail

: "${SKILL_MANAGER_BIN_DIR:?SKILL_MANAGER_BIN_DIR is required}"
: "${SKILL_MANAGER_CACHE_DIR:?SKILL_MANAGER_CACHE_DIR is required}"
: "${SKILL_DIR:?SKILL_DIR is required}"
: "${SKILL_NAME:?SKILL_NAME is required}"

if ! command -v uv >/dev/null 2>&1; then
  echo "skill-dev install requires uv on PATH" >&2
  exit 127
fi

mkdir -p "$SKILL_MANAGER_BIN_DIR" "$SKILL_MANAGER_CACHE_DIR/uv-tools"

UV_TOOL_BIN_DIR="$SKILL_MANAGER_BIN_DIR" \
UV_TOOL_DIR="$SKILL_MANAGER_CACHE_DIR/uv-tools" \
  uv tool install "$SKILL_DIR" --force --reinstall --python python3

test -x "$SKILL_MANAGER_BIN_DIR/skill-dev"
echo "skill-dev-skill: installed skill-dev to $SKILL_MANAGER_BIN_DIR/skill-dev (skill=$SKILL_NAME)"

