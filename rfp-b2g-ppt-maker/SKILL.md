---
name: rfp-b2g-ppt-maker
description: Create Korean B2G proposal decks from PDFs, evaluation criteria, design systems, and templates. Use for source-grounded slide plans, PPT prompts, image prompts, and QA.
---

# RFP B2G PPT Maker

## Overview

Turn public-sector proposal materials into evaluator-facing Korean presentation decks. Keep every claim grounded in source documents, map slides directly to evaluation criteria, and apply the provided design system before producing prompts, visuals, or a final PPT.

## Workflow

### 1. Intake Materials

Identify the available source files and the requested scope before drafting content.

Required inputs when available:

- Proposal source PDF
- Evaluation criteria PDF or text
- Design system, PPT template, HTML style guide, or reference deck
- Target presentation section, slide count, and output format

Useful optional inputs:

- Original RFP
- Existing presentation deck
- Logo, icons, fonts, screenshots, or product images
- User notes about numbering, terminology, audience, or required claims

If the proposal section numbering differs from the presentation numbering, use the user's presentation numbering in final slide text and keep the source numbering only in working notes.

Use `prompts/01_intake_checklist.md` when you need a structured intake output.

### 2. Analyze Evaluation Criteria

Extract the evaluation area, item, factors, score, and what the evaluator must see on slides. Treat the deck as an answer to the scoring rubric, not as a simple summary.

Common B2G technical evaluation factors:

- Appropriateness of proposed method for each requirement
- Plan to enhance existing intelligent CCTV monitoring with generative VLM capability
- Performance assurance and verification approach
- HW/SW system configuration
- Additional proposals for effective project execution
- Standards compliance and scalability
- Operational stability, maintenance, and audit readiness

### 3. Extract Source Evidence

Read the proposal source directly. Capture page references, requirement IDs, architecture details, equipment specs, performance targets, UI/UX details, data flow, security controls, operations plans, deliverables, and additional proposals.

Do not invent numbers, certifications, model names, device quantities, benchmarks, dates, budget values, or adoption targets. If a useful claim is not sourced, mark it as a gap or ask for the missing material.

### 4. Classify Quantitative Metrics

Separate metrics by usage so examples are not presented as contractual targets.

- `Target`: proposed KPI, contractual goal, SLA, or acceptance target
- `Verification`: benchmark, test result, validation metric, or inspection standard
- `Operating example`: dashboard count, risk distribution, sample UI indicator, or scenario value
- `Reference`: company history, project amount, installed base, or implementation record

Each metric should include value, unit, source page, planned slide location, and caution notes.

### 5. Plan The Deck

Build slides in evaluation-response order. A typical technical/function section can use this flow:

1. Section cover
2. Evaluation response summary
3. Target system architecture
4. HW/SW configuration
5. Real-time processing architecture
6. Core function pipeline
7. Performance assurance plan
8. Monitoring UI/UX and XAI
9. Data and feedback closed loop
10. Additional proposal and expansion model
11. Requirement-response matrix

For each slide define title, evaluation factor, key message, main content, metrics, design component, and source basis. Use `prompts/02_slide_plan_template.md` for the slide-planning format.

### 6. Write Generation Prompts

Create a full-deck prompt only after the evidence and slide plan are stable. Include project context, evaluation focus, source files, numbering rule, core story, design rules, mandatory metrics, slide structure, and final constraints.

Use `prompts/03_deck_prompt_template.md` for the full-deck prompt and `prompts/04_image_prompt_template.md` for per-slide image prompts.

### 7. Generate Slide Visuals

Use image generation only for layout-heavy diagrams, background diagrams, architecture visuals, flow charts, funnels, tables, card layouts, or mood-setting visuals that will be overlaid with editable PPT text.

Image rules:

- Generate one 16:9 image per slide when needed.
- Use 1920x1080 unless the user provides another canvas.
- Keep Korean text out of generated bitmap images whenever possible.
- Re-enter titles, numbers, tables, and labels as editable PPT text layers.
- Regenerate any image with broken Korean, misleading data, excessive decoration, or crowded layout.

### 8. Assemble PPT

When the user asks for an actual PowerPoint file, use the available presentation/PPT tooling and render-check the result. Apply the design system consistently to headers, breadcrumbs, labels, page numbers, table styling, cards, arrows, node diagrams, and safe areas.

If no design system is provided, use the default public B2G style in `assets/design_system_notes.md`.

### 9. Review

Before delivering, run the checklist in `prompts/05_review_checklist.md`.

Minimum acceptance criteria:

- Every evaluation factor in scope is addressed.
- Every number or concrete claim is traceable to source material or clearly marked as an example.
- Presentation section numbering follows the user's requested deck numbering.
- Architecture, HW/SW configuration, VLM development plan, performance assurance, operations/data loop, and additional proposal are covered when relevant.
- Korean text is editable and unbroken.
- Slide elements stay within the safe area and match the design system.

## Resources

- `prompts/01_intake_checklist.md`: material intake and scope confirmation format
- `prompts/02_slide_plan_template.md`: evaluation-aligned slide plan template
- `prompts/03_deck_prompt_template.md`: full PowerPoint generation prompt template
- `prompts/04_image_prompt_template.md`: per-slide image prompt template
- `prompts/05_review_checklist.md`: final QA checklist
- `examples/`: compact examples for slide plans and prompts
- `assets/design_system_notes.md`: fallback Korean B2G visual style
