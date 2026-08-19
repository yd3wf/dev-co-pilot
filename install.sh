#!/usr/bin/env bash
#
# dev-co-pilot installer (macOS / Linux)
#
# Usage:
#   ./install.sh            # install to user scope (~/.codebuddy/skills), available everywhere
#   ./install.sh --project  # install to current project (.codebuddy/skills), repo-scoped
#
set -euo pipefail

SKILL_NAME="dev-co-pilot"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$SCRIPT_DIR/.codebuddy/skills/$SKILL_NAME"

MODE="user"

if [[ "${1:-}" == "--project" ]]; then
  MODE="project"
fi

if [[ "$MODE" == "user" ]]; then
  DEST="$HOME/.codebuddy/skills/$SKILL_NAME"
else
  DEST="$(pwd)/.codebuddy/skills/$SKILL_NAME"
fi

if [[ ! -d "$SKILL_SRC" ]]; then
  echo "ERROR: skill source not found at $SKILL_SRC"
  exit 1
fi

if [[ -e "$DEST" ]]; then
  echo "Skill already exists at $DEST"
  read -r -p "Overwrite? [y/N] " answer
  if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    echo "Aborted."
    exit 0
  fi
  rm -rf "$DEST"
fi

mkdir -p "$(dirname "$DEST")"
cp -R "$SKILL_SRC" "$DEST"

echo ""
echo "Installed dev-co-pilot skill:"
echo "  scope: $MODE"
echo "  path : $DEST"
echo ""
echo "Done. Restart or reload your AI assistant to activate."
