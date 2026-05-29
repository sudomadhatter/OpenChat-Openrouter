---
description: Universal self-audit stress test — run after a plan, story, or code change. Scenario-tests for regressions, traces code paths, produces a go/no-go audit.
---

# /1_self-audit-stress-test — Adversarial Self-Audit

Execute the workflow defined in @.agent/workflows/1_self-audit-stress-test.md.

**opencode execution notes:**
- Target the work just produced in this chat — could be an `implementation_plan.md`, a story file, or actual code changes.
- Be adversarial: assume the previous output is wrong somewhere, then prove it (or fail to). Hunt for:
  - Regressions in adjacent components (use grep to trace callers/consumers).
  - Edge cases not covered (empty/null/large/concurrent inputs).
  - Constitution violations (full-file rewrites, missing root-cause analysis, hardcoded secrets, new Firestore clients, broken plan-first protocol).
  - Untested assumptions about external state (Firestore docs, GCP IAM, env vars).
- Output a Go/No-Go decision into `_artifacts/<chat-slug>/walkthrough.md` (append a section `## Self-Audit (YYYY-MM-DD)`).
- If No-Go, list specific concrete remediation steps — not vague warnings.

Optional additional input (specific area to stress-test): $ARGUMENTS
