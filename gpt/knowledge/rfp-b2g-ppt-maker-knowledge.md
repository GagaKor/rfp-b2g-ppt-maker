# rfp-b2g-ppt-maker Knowledge

This file contains reusable templates, examples, and fallback design notes for a Custom GPT.

## Intake Checklist

```text
확인된 자료:
- 제안서 원문:
- RFP 원문:
- 평가기준:
- 디자인 시스템:
- 발표자료 템플릿:
- 기존 발표자료:
- 로고/이미지/폰트:

작성 대상:
- 발표자료 기준 장번호:
- 원문 제안서 기준 장번호:
- 원문 페이지 범위:
- 평가부문:
- 평가항목:
- 평가요소:
- 배점:
- 희망 장표 수:
- 최종 산출물:
- 이미지 생성 여부:

주의할 기준:
- 장번호 표기:
- 원문 근거 범위:
- 반드시 포함할 수치:
- 사용 금지 표현/소재:
- 디자인 시스템 우선순위:
```

Material readiness:

- `충분`: evaluation criteria, proposal source, and design direction are available.
- `부분 충분`: one source is missing but the user asked to proceed with assumptions; mark gaps.
- `보류`: missing source evidence would force invented claims or unsupported metrics.

## Slide Plan Template

```text
Slide 번호:
Slide 제목:
상단 브레드크럼:
평가요소 대응:
핵심 메시지:
주요 내용:
- 
- 
- 
정량 지표:
- 지표명 / 값 / 유형(Target, Verification, Operating example, Reference) / 원문 근거 / 주의사항
디자인 요소:
원문 근거:
- 파일명 / 페이지 / 요구사항 ID 또는 근거 문장 요약
검수 포인트:
```

Recommended technical/function flow:

```text
1. 섹션 표지
2. 평가기준 대응 요약
3. 목표 시스템 전체 아키텍처
4. HW/SW 장비구성
5. 실시간 처리 아키텍처
6. 핵심 기능 파이프라인
7. 성능확보 방안
8. 관제 UI/UX 및 XAI
9. 데이터·피드백 폐쇄루프
10. 추가 제안 및 확산 모델
11. 요구사항 대응 매핑
```

## Full Deck Prompt Template

```text
Create a Korean B2G public-sector PowerPoint deck for:

[발표자료 섹션명]

Project:
[프로젝트명]

Evaluation focus:
[평가부문 / 평가항목 / 평가요소 / 배점]

Base all content on:
- [제안서 원문 파일명 및 페이지 범위]
- [평가기준 파일명 또는 텍스트]
- [디자인 시스템 또는 템플릿]
- [기타 근거 자료]

Important numbering rule:
[예: 원문 제안서는 "Ⅲ. 기술 및 기능부문"이나 발표자료는 "Ⅱ. 기술 및 기능"으로 표기한다.]

Core story:
[평가기준 대응 관점의 2-4문장 스토리]

Design rules:
- Canvas: 16:9, 1920x1080
- Font: [사용자 제공 폰트 또는 Pretendard]
- Header: [색상/높이/브레드크럼]
- Title treatment: [그라데이션/라벨/강조]
- Components: [번호 카드, 원형 노드, 화살표, 퍼널, 표 등]
- Safety area: [여백]
- Avoid: [금지 디자인 요소]

Mandatory quantitative metrics:
- [지표명 / 값 / 유형 / 출처 / 사용 슬라이드]

Slide structure:
1. [번호] [제목] - [평가요소] - [핵심 메시지] - [주요 시각화]
2. ...

Final requirements:
- Directly answer every evaluation factor in scope.
- Do not add unsupported numbers or claims.
- Distinguish KPI targets from operating examples.
- Keep Korean text editable in PPT, not baked into generated images.
- Include architecture, HW/SW configuration, VLM development approach, performance assurance, and additional proposals when in scope.
- Maintain the provided design system consistently.
```

## Per-Slide Image Prompt Template

```text
Create a single 16:9 PowerPoint slide image, 1920x1080.

Project:
[프로젝트명]

Presentation section:
[섹션명]

Slide title:
[장표 제목]

Top breadcrumb:
[브레드크럼 텍스트. If Korean text quality is uncertain, leave this area blank for PPT overlay.]

Main gradient title bar:
[핵심 메시지. If Korean text quality is uncertain, reserve the area without rendering text.]

Layout:
[상단/중앙/하단 구조, safe area, grid, relative sizing]

Main visual:
[architecture, pipeline, funnel, flow, comparison table, card matrix, dashboard wireframe, roadmap, etc.]

Quantitative metric card placeholders:
[수치 카드 개수와 배치. Render placeholders or simple numerals only if safe.]

Design style:
- Korean public-sector B2G proposal deck
- White background, navy header, restrained red-orange-yellow accent gradient
- Pretendard-like typography, thin lines, dense but aligned information design
- Flat vector UI, minimal shadow, high legibility

Negative prompt:
- no fake futuristic AI marketing imagery
- no excessive 3D, neon, glassmorphism, or decorative blobs
- no unreadable Korean text
- no invented metrics, logos, maps, or UI screenshots
- no crowded overlapping labels
```

## Review Checklist

```text
평가기준 대응:
- 평가부문/평가항목/평가요소/배점이 정확히 반영되었는가
- 각 장표가 하나 이상의 평가요소에 직접 대응하는가
- 요구사항 대응 매핑 장표가 필요한 경우 포함되었는가

원문 근거:
- 원문 페이지와 요구사항 ID가 주요 주장에 연결되었는가
- 원문에 없는 수치나 장비 사양을 만들지 않았는가
- 정량 목표, 검증 지표, 운영 화면 예시, 실적 근거를 구분했는가

구성:
- 아키텍처가 포함되었는가
- HW/SW 장비구성이 포함되었는가
- 생성형 VLM 기능개발 방안이 포함되었는가
- 성능확보 방안이 포함되었는가
- 데이터·피드백·운영 안정성 구조가 포함되었는가
- 과업 수행을 위한 추가 제안이 포함되었는가

표기:
- 원문 장번호와 발표자료 장번호를 혼용하지 않았는가
- 최종 산출물은 사용자 기준 발표자료 장번호를 쓰는가
- 기관명, 사업명, 기술명, 약어가 일관되는가

디자인:
- 제공된 디자인 시스템을 우선 적용했는가
- 캔버스, 폰트, 헤더, 브레드크럼, 페이지 번호가 일관되는가
- 요소가 안전 영역 안에 있고 서로 겹치지 않는가
- 한글 텍스트가 이미지 안에서 깨지지 않고 PPT 텍스트 레이어로 입력되었는가
- 과한 3D, 추상 AI 이미지, 장식성 배경을 피했는가
```

## Default Korean B2G Design System Notes

Use these notes only when the user does not provide a design system.

Canvas and typography:

- 16:9 widescreen, 1920x1080
- Pretendard or a similar Korean sans-serif
- White background
- 72-96px top header area
- 64-80px page margins
- Compact slide titles, dense body information, strict alignment

Core colors:

- Navy header: `#102A43`
- Deep text: `#111827`
- Secondary text: `#4B5563`
- Rule gray: `#D1D5DB`
- Light panel: `#F8FAFC`
- Red accent: `#E53935`
- Orange accent: `#F97316`
- Yellow accent: `#FACC15`
- Success/operation accent: `#16A34A`
- Data/AI accent: `#2563EB`

Common components:

- Navy header with breadcrumb and page number
- Red-orange-yellow gradient title accent
- Small yellow or orange labels for evaluation factors
- Number cards for priorities, steps, and quantitative metrics
- Circular nodes for architecture entities
- Thin arrows for process flow
- Funnel for filtering, risk scoring, or prioritization
- Tables for requirement-response mapping and HW/SW configuration
- Bottom source notes when traceability is important

Avoid:

- Overly decorative hero layouts
- Future-city or abstract AI marketing imagery
- Excessive 3D, neon, glassmorphism, bokeh, or gradient blobs
- Low-density cards that waste evaluator reading time
- Korean text baked into generated images when editable PPT text is possible

## Example Request

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
```
