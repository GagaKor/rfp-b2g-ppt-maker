# rfp-b2g-ppt-maker

Korean public-sector/B2G proposal presentation skill for turning proposal PDFs, evaluation criteria, design systems, and templates into source-grounded slide plans, PowerPoint prompts, per-slide image prompts, and QA checklists.

The skill is designed to work with both Codex and Claude-compatible Agent Skills.

## Repository Structure

```text
rfp-b2g-ppt-maker/
├── SKILL.md
├── prompts/
├── examples/
├── assets/
└── agents/
    └── openai.yaml
```

- `SKILL.md`: shared Agent Skills entrypoint
- `prompts/`: intake, slide plan, deck prompt, image prompt, and review templates
- `examples/`: compact usage examples
- `assets/`: fallback Korean B2G design system notes
- `agents/openai.yaml`: Codex UI metadata; exclude this from Claude.ai ZIP uploads if desired

## Install For Codex

From GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/GagaKor/rfp-b2g-ppt-maker/master/install.sh | bash -s -- codex
```

Or from a local checkout:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
rm -rf "${CODEX_HOME:-$HOME/.codex}/skills/rfp-b2g-ppt-maker"
cp -R rfp-b2g-ppt-maker "${CODEX_HOME:-$HOME/.codex}/skills/"
```

Use:

```text
Use $rfp-b2g-ppt-maker to turn this proposal PDF, evaluation criteria, and design system into a Korean B2G presentation deck.
```

## Install For Claude Code

From GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/GagaKor/rfp-b2g-ppt-maker/master/install.sh | bash -s -- claude
```

Or from a local checkout:

```bash
mkdir -p ~/.claude/skills
rm -rf ~/.claude/skills/rfp-b2g-ppt-maker
cp -R rfp-b2g-ppt-maker ~/.claude/skills/
```

Use:

```text
/rfp-b2g-ppt-maker
```

## Package For Claude.ai

Claude.ai custom skill uploads use a ZIP file containing the skill folder as the ZIP root. To exclude Codex-only UI metadata:

```bash
zip -qr rfp-b2g-ppt-maker-claude.zip rfp-b2g-ppt-maker -x 'rfp-b2g-ppt-maker/agents/*'
```

Upload the ZIP in Claude.ai from Customize or Settings > Skills, then enable it.

Claude.ai does not install arbitrary GitHub-hosted skills from a chat command. Use the ZIP upload flow, or publish the ZIP as a GitHub Release asset for users to download and upload.

## Publish With Git

```bash
git add README.md install.sh rfp-b2g-ppt-maker
git commit -m "Add rfp-b2g-ppt-maker agent skill"
git push -u origin HEAD
```

For a versioned release:

```bash
git tag v0.1.0
git push origin v0.1.0
```

Attach `rfp-b2g-ppt-maker-claude.zip` to the GitHub release for Claude.ai users.
