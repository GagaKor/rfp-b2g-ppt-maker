# Claude.ai and Cowork Setup Guide

Use this guide after preparing `rfp-b2g-ppt-maker-claude.zip`.

## Claude.ai Personal Skill

1. Open Claude.
2. Ensure code execution and file creation are enabled:
   - Free, Pro, Max: Settings > Capabilities
   - Team, Enterprise: Organization settings > Skills
3. Go to Customize > Skills.
4. Click the "+" button, then create or upload a skill.
5. Upload `rfp-b2g-ppt-maker-claude.zip`.
6. Enable the skill with the toggle.
7. Test with:

```text
Use the rfp-b2g-ppt-maker skill to create a Korean B2G proposal presentation from the attached proposal PDF, evaluation criteria, and design system.
```

## Cowork

Cowork uses the same Skills system as Claude. Once this skill is enabled or shared in Claude, it can be used in Cowork for longer-running work such as file organization, source extraction, slide planning, and PowerPoint-oriented deliverables.

Recommended Cowork request:

```text
Use the rfp-b2g-ppt-maker skill. Review the attached proposal PDF, evaluation criteria, and design system, then create an evaluation-aligned Korean B2G slide plan with source evidence, quantitative metrics, deck prompt, image prompts, and a QA checklist.
```

For Team and Enterprise organization sharing:

1. Ask an organization owner to enable Skill sharing in Organization settings > Skills.
2. Open Customize > Skills.
3. Open `rfp-b2g-ppt-maker`.
4. Click Share.
5. Share with specific colleagues or the entire organization.
6. In Cowork, users can open Customize, browse the directory, click the Skills tab, and install the shared skill.

## Disable or Delete

To disable:

1. Open Customize > Skills.
2. Toggle off `rfp-b2g-ppt-maker`.

To delete a personal upload:

1. Open Customize > Skills.
2. Open `rfp-b2g-ppt-maker`.
3. Toggle it off.
4. Use the more menu and choose Delete.

Shared or organization-provisioned skills may need an owner/admin to remove or update them.
