---
description: Live Testing Team — Daniel flies the app, Claude watches the backend logs live. Co-pilot loop that logs ROOT causes (verified vs docs) and produces a fix plan. Writes no code.
---

# /1_live_testing_team — Live Testing Team

Execute the workflow defined in @.agents/workflows/1_live_testing_team.md.

**opencode execution notes:**
- Start BOTH servers in the background so the backend log stream stays readable while Daniel tests.
- Backend: `backend\.venv\Scripts\uvicorn backend.main:app --host 0.0.0.0 --port 8000 --reload` from project root.
- Frontend: `npm run dev` from `frontend/`; sleep ~5s after the kill so ports leave TIME_WAIT.
- `taskkill` is gated behind a per-call prompt — confirm before reaping.
- Watch the backend log each turn: proactively flag tracebacks/errors, reactively deep-dive on a reported bug.
- **Instruments (Phase 1.5):** backend logs (always), browser DevTools (ask Daniel for one specific
  line), Firestore via `get_db()`, Cloud Run via `gcloud` (ask first), temporary debug logs.
- This command writes NO code — it produces `debug-watch-log.md` + a fix plan.

Optional additional input (area under test / known-flaky route): $ARGUMENTS
