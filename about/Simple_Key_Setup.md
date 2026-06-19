# Quick Setup: Connect Your OpenRouter API Key

## Step 1: Launch OpenCode
```powershell
opencode
```

## Step 2: Connect OpenRouter
Inside the TUI, type:
```
/connect
```
- Select **OpenRouter** from the list.
- Paste your API key (starts with `sk-or-v1-...`).

## Step 3: Pick a Model
```
/models
```
Search for any model (e.g. `claude`, `glm`, `gpt`, `deepseek`) and select it.

## Done!
Your key is saved permanently on this machine. You won't need to do this again unless you reinstall OpenCode.

---

> **Where is the key stored?** OpenCode saves it in its internal auth file, not in the `.env`. The `.env` in this repo is just a backup reference for your records.
