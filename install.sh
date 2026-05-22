#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="rfp-b2g-ppt-maker"
REPO_URL="${RFP_B2G_PPT_MAKER_REPO:-https://github.com/GagaKor/rfp-b2g-ppt-maker.git}"
REF="${RFP_B2G_PPT_MAKER_REF:-master}"
TARGET="${1:-both}"

usage() {
  cat <<'EOF'
Usage:
  install.sh [codex|claude|both]

Environment:
  RFP_B2G_PPT_MAKER_REPO  Git repository URL
  RFP_B2G_PPT_MAKER_REF   Git ref to install from, default: master
  CODEX_HOME              Codex home, default: ~/.codex
EOF
}

install_skill() {
  local dest_root="$1"
  local tmp_dir

  tmp_dir="$(mktemp -d)"
  trap 'rm -rf "$tmp_dir"' RETURN

  git clone --depth 1 --branch "$REF" "$REPO_URL" "$tmp_dir/repo" >/dev/null

  if [[ ! -f "$tmp_dir/repo/$SKILL_NAME/SKILL.md" ]]; then
    echo "Missing $SKILL_NAME/SKILL.md in $REPO_URL at ref $REF" >&2
    exit 1
  fi

  mkdir -p "$dest_root"
  rm -rf "$dest_root/$SKILL_NAME"
  cp -R "$tmp_dir/repo/$SKILL_NAME" "$dest_root/$SKILL_NAME"
  echo "Installed $SKILL_NAME to $dest_root/$SKILL_NAME"
}

case "$TARGET" in
  codex)
    install_skill "${CODEX_HOME:-$HOME/.codex}/skills"
    echo "Restart Codex to pick up the new skill."
    ;;
  claude)
    install_skill "$HOME/.claude/skills"
    echo "Restart Claude Code if it does not appear in the slash menu."
    ;;
  both)
    install_skill "${CODEX_HOME:-$HOME/.codex}/skills"
    install_skill "$HOME/.claude/skills"
    echo "Restart Codex and Claude Code if needed."
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac
