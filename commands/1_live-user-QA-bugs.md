---
description: BMAD-compliant live QA pipeline — Scribe captures bugs → SM writes story → PM updates docs. Dev happens in a SEPARATE chat.
---

# /1_live-user-QA-bugs — Live User QA Triage

Execute the workflow defined in @.agent/workflows/1_live-user-QA-bugs.md.

**opencode execution notes:**
- This is a **multi-agent BMAD pipeline**, not a one-shot fix workflow. Do NOT jump into dev.
- The pipeline: Scribe (you, capturing bugs) → SM (Bob, writes story — invoke via `/sm` or `@bmad-sm`) → PM (John, updates docs — `/pm` or `@bmad-pm`).
- Dev work happens in a SEPARATE chat session after the story is `ready-for-dev`. Don will start that new chat himself.
- All bug captures go into `_artifacts/<chat-slug>/task.md` with reproduction steps, severity, suspected root cause area.
- Story file lives at `_bmad/bmm/stories/story-<epic>.<id>-<slug>.md` (per `.agent/gemini.md` "Path Override").
- Constitution rule: "Never propose fixes without root cause investigation" — even at the triage stage, capture the suspected component spec / agent / data path.

Optional additional input (bug list or live session notes): $ARGUMENTS
