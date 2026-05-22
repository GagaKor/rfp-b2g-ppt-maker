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

Uninstall:

```bash
curl -fsSL https://raw.githubusercontent.com/GagaKor/rfp-b2g-ppt-maker/master/install.sh | bash -s -- uninstall codex
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

Uninstall:

```bash
curl -fsSL https://raw.githubusercontent.com/GagaKor/rfp-b2g-ppt-maker/master/install.sh | bash -s -- uninstall claude
```

Install or uninstall both Codex and Claude Code:

```bash
curl -fsSL https://raw.githubusercontent.com/GagaKor/rfp-b2g-ppt-maker/master/install.sh | bash -s -- both
curl -fsSL https://raw.githubusercontent.com/GagaKor/rfp-b2g-ppt-maker/master/install.sh | bash -s -- uninstall both
```

## Package For Claude.ai

Claude.ai custom skill uploads use a ZIP file containing the skill folder as the ZIP root. To exclude Codex-only UI metadata:

```bash
zip -qr rfp-b2g-ppt-maker-claude.zip rfp-b2g-ppt-maker -x 'rfp-b2g-ppt-maker/agents/*'
```

Upload the ZIP in Claude.ai from Customize or Settings > Skills, then enable it.

Claude.ai does not install arbitrary GitHub-hosted skills from a chat command. Use the ZIP upload flow, or publish the ZIP as a GitHub Release asset for users to download and upload.

## Usage

Skills can be invoked automatically when the request matches the `description` in `SKILL.md`, but explicit invocation is more reliable.

Codex:

```text
Use $rfp-b2g-ppt-maker to turn this proposal PDF, evaluation criteria, and design system into a Korean B2G presentation deck.
```

Claude Code:

```text
/rfp-b2g-ppt-maker
```

Claude.ai:

```text
Use the rfp-b2g-ppt-maker skill to create a Korean B2G proposal presentation from the attached proposal PDF, evaluation criteria, and design system.
```

Example request:

```text
아래 자료를 기준으로 공공제안서 발표자료를 만들어줘.

필요 자료:
1. 제안서 원문 PDF
2. 평가기준 PDF 또는 평가항목 텍스트
3. 디자인 시스템 HTML/PDF/PPT
4. 발표자료 템플릿 PPT/PDF

작성 대상:
- 발표자료 장번호: Ⅱ. 기술 및 기능
- 원문 제안서 장번호: Ⅲ. 기술 및 기능부문
- 원문 페이지 범위: p45-p105
- 평가항목: 기술 및 기능 - 사업추진내용
- 원하는 장표 수: 10장
- 이미지 생성 여부: 예

작업 순서:
1. 자료 확인
2. 평가기준 분석
3. 원문 근거 및 정량 지표 추출
4. 장표별 구성안 작성
5. PPT 생성 프롬프트 작성
6. 장표별 이미지 생성 프롬프트 작성
7. 최종 검수 체크리스트 작성
```

Expected outputs:

- Intake summary
- Evaluation criteria mapping
- Source evidence summary
- Quantitative metrics list with usage classification
- Slide-by-slide plan
- Full deck generation prompt
- Per-slide image prompts
- Review checklist

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
