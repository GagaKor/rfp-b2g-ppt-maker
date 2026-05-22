#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="rfp-b2g-ppt-maker"
REPO_URL="${RFP_B2G_PPT_MAKER_REPO:-https://github.com/GagaKor/rfp-b2g-ppt-maker.git}"
REF="${RFP_B2G_PPT_MAKER_REF:-master}"
ACTION="install"
TARGET="${1:-both}"

case "${1:-}" in
  uninstall|remove|delete)
    ACTION="uninstall"
    TARGET="${2:-both}"
    ;;
  install)
    ACTION="install"
    TARGET="${2:-both}"
    ;;
esac

usage() {
  cat <<'EOF'
Usage:
  install.sh [codex|claude|claude-code|claude-ai|cowork|gpt|both|all]
  install.sh install [codex|claude|claude-code|claude-ai|cowork|gpt|both|all]
  install.sh uninstall [codex|claude|claude-code|claude-ai|cowork|gpt|both|all]

Environment:
  RFP_B2G_PPT_MAKER_REPO  Git repository URL
  RFP_B2G_PPT_MAKER_REF   Git ref to install from, default: master
  CODEX_HOME              Codex home, default: ~/.codex
  RFP_B2G_PPT_MAKER_GPT_DEST  GPT Builder package output directory
  RFP_B2G_PPT_MAKER_CLAUDE_DEST  Claude.ai/Cowork package output directory
EOF
}

install_skill() {
  local dest_root="$1"
  local tmp_dir

  tmp_dir="$(mktemp -d)"

  if ! git clone --depth 1 --branch "$REF" "$REPO_URL" "$tmp_dir/repo" >/dev/null; then
    rm -rf "$tmp_dir"
    exit 1
  fi

  if [[ ! -f "$tmp_dir/repo/$SKILL_NAME/SKILL.md" ]]; then
    echo "Missing $SKILL_NAME/SKILL.md in $REPO_URL at ref $REF" >&2
    rm -rf "$tmp_dir"
    exit 1
  fi

  mkdir -p "$dest_root"
  rm -rf "$dest_root/$SKILL_NAME"
  cp -R "$tmp_dir/repo/$SKILL_NAME" "$dest_root/$SKILL_NAME"
  rm -rf "$tmp_dir"
  echo "Installed $SKILL_NAME to $dest_root/$SKILL_NAME"
}

uninstall_skill() {
  local dest_root="$1"
  local skill_dir="$dest_root/$SKILL_NAME"

  if [[ -d "$skill_dir" ]]; then
    rm -rf "$skill_dir"
    echo "Removed $skill_dir"
  else
    echo "Not installed at $skill_dir"
  fi
}

install_gpt_package() {
  local dest_root="${RFP_B2G_PPT_MAKER_GPT_DEST:-$PWD/rfp-b2g-ppt-maker-gpt}"
  local tmp_dir

  tmp_dir="$(mktemp -d)"

  if ! git clone --depth 1 --branch "$REF" "$REPO_URL" "$tmp_dir/repo" >/dev/null; then
    rm -rf "$tmp_dir"
    exit 1
  fi

  if [[ ! -f "$tmp_dir/repo/gpt/instructions.md" ]]; then
    echo "Missing gpt/instructions.md in $REPO_URL at ref $REF" >&2
    rm -rf "$tmp_dir"
    exit 1
  fi

  rm -rf "$dest_root"
  mkdir -p "$dest_root"
  cp -R "$tmp_dir/repo/gpt/." "$dest_root/"
  rm -rf "$tmp_dir"

  cat <<EOF
Prepared ChatGPT GPT Builder package at $dest_root

Create the GPT manually in ChatGPT:
1. Open https://chatgpt.com/gpts/editor
2. Set name: rfp-b2g-ppt-maker
3. Paste $dest_root/instructions.md into Instructions
4. Upload files from $dest_root/knowledge/ as Knowledge
5. Add conversation starters from $dest_root/conversation_starters.md
EOF
}

uninstall_gpt_package() {
  local dest_root="${RFP_B2G_PPT_MAKER_GPT_DEST:-$PWD/rfp-b2g-ppt-maker-gpt}"

  if [[ -d "$dest_root" ]]; then
    rm -rf "$dest_root"
    echo "Removed GPT Builder package at $dest_root"
  else
    echo "No GPT Builder package found at $dest_root"
  fi
}

install_claude_package() {
  local dest_root="${RFP_B2G_PPT_MAKER_CLAUDE_DEST:-$PWD/rfp-b2g-ppt-maker-claude}"
  local tmp_dir
  local zip_path="$dest_root/rfp-b2g-ppt-maker-claude.zip"

  tmp_dir="$(mktemp -d)"

  if ! git clone --depth 1 --branch "$REF" "$REPO_URL" "$tmp_dir/repo" >/dev/null; then
    rm -rf "$tmp_dir"
    exit 1
  fi

  if [[ ! -f "$tmp_dir/repo/$SKILL_NAME/SKILL.md" ]]; then
    echo "Missing $SKILL_NAME/SKILL.md in $REPO_URL at ref $REF" >&2
    rm -rf "$tmp_dir"
    exit 1
  fi

  rm -rf "$dest_root"
  mkdir -p "$dest_root"
  dest_root="$(cd "$dest_root" && pwd)"
  zip_path="$dest_root/rfp-b2g-ppt-maker-claude.zip"
  (
    cd "$tmp_dir/repo"
    zip -qr "$zip_path" "$SKILL_NAME" -x "$SKILL_NAME/agents/*"
  )

  if [[ -f "$tmp_dir/repo/claude/claude_cowork_guide.md" ]]; then
    cp "$tmp_dir/repo/claude/claude_cowork_guide.md" "$dest_root/"
  fi

  rm -rf "$tmp_dir"

  cat <<EOF
Prepared Claude.ai/Cowork skill package at $dest_root

Upload this ZIP in Claude:
$zip_path

Setup guide:
$dest_root/claude_cowork_guide.md
EOF
}

uninstall_claude_package() {
  local dest_root="${RFP_B2G_PPT_MAKER_CLAUDE_DEST:-$PWD/rfp-b2g-ppt-maker-claude}"

  if [[ -d "$dest_root" ]]; then
    rm -rf "$dest_root"
    echo "Removed Claude.ai/Cowork package at $dest_root"
  else
    echo "No Claude.ai/Cowork package found at $dest_root"
  fi
}

run_for_target() {
  local target="$1"
  local action="$2"
  local codex_root="${CODEX_HOME:-$HOME/.codex}/skills"
  local claude_root="$HOME/.claude/skills"

  case "$target" in
    codex)
      if [[ "$action" == "install" ]]; then
        install_skill "$codex_root"
        echo "Restart Codex to pick up the new skill."
      else
        uninstall_skill "$codex_root"
        echo "Restart Codex if the removed skill still appears."
      fi
      ;;
    claude|claude-code)
      if [[ "$action" == "install" ]]; then
        install_skill "$claude_root"
        echo "Restart Claude Code if it does not appear in the slash menu."
      else
        uninstall_skill "$claude_root"
        echo "Restart Claude Code if the removed skill still appears."
      fi
      ;;
    both)
      run_for_target codex "$action"
      run_for_target claude-code "$action"
      ;;
    all)
      run_for_target codex "$action"
      run_for_target claude-code "$action"
      run_for_target claude-ai "$action"
      run_for_target gpt "$action"
      ;;
    claude-ai|cowork)
      if [[ "$action" == "install" ]]; then
        install_claude_package
      else
        uninstall_claude_package
      fi
      ;;
    gpt)
      if [[ "$action" == "install" ]]; then
        install_gpt_package
      else
        uninstall_gpt_package
      fi
      ;;
    -h|--help|help)
      usage
      ;;
    *)
      usage >&2
      exit 2
      ;;
  esac
}

case "$TARGET" in
  codex|claude|claude-code|claude-ai|cowork|gpt|both|all|-h|--help|help)
    run_for_target "$TARGET" "$ACTION"
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac
