# OpenChat-Openrouter Config (openCode Config Repo)

This repository holds your centralized OpenCode configuration: custom subagents, slash commands, model lists, and plugin dependencies.

By linking this repository to your global configuration directory, you can seamlessly sync your agents and slash commands across different computers and project workspaces.

> **Important:** This repo is your *configuration only*. The OpenCode CLI itself must be installed separately (see Step 1 below).

---

## 📁 Repository Structure

- `agent/` — Custom subagent personas (e.g. `bmad-pm`, `bmad-dev`, `bmad-qa`, etc.).
- `commands/` — Custom slash commands (e.g. `/pm`, `/dev`, `/qa`, `/slash_command_updating`, etc.).
- `models/` — Local OpenRouter models cache files categorized by provider/type.
- `opencode.json` — Central OpenCode global configuration file.
- `package.json` — Package specifications for global plugins like `@opencode-ai/plugin`.
- `.env` — Your OpenRouter API key (machine-specific, git-ignored).
- `setup.ps1` — PowerShell script to link this repo to your global user config path.
- `update_models.js` — Utility script to fetch and update the latest OpenRouter models.

---

## 🚀 Installation & Setup (New Machine)

### Step 1: Install the OpenCode CLI

OpenCode is a terminal-based TUI coding agent. You must install the CLI binary **before** anything else.

**Option A — npm (recommended):**
```powershell
npm install -g opencode-ai
```

**Option B — Chocolatey:**
```powershell
choco install opencode
```

**Option C — Scoop:**
```powershell
scoop install opencode
```

Verify the install:
```powershell
opencode --version
```

You should see a version number (e.g. `1.107.0`). If you get "not recognized", close and reopen your terminal, then try again.

---

### Step 2: Enable PowerShell Script Execution (Windows only)

Windows blocks local scripts by default. You must allow them or the PowerShell profile and setup script will fail:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

This only needs to be done once per machine.

---

### Step 3: Clone This Repository

Clone to your preferred projects directory:
```powershell
cd C:\Users\YOUR_USER\.gemini\antigravity\scratch
git clone https://github.com/sudomadhatter/OpenChat-Openrouter.git OpenCode
```

---

### Step 4: Add Your OpenRouter API Key

Each machine needs its own `.env` file with a valid API key. This file is git-ignored and must be created manually:

```powershell
cd OpenCode
echo OPENROUTER_API_KEY=sk-or-v1-YOUR_KEY_HERE > .env
```

Replace `sk-or-v1-YOUR_KEY_HERE` with your actual OpenRouter API key from [openrouter.ai/keys](https://openrouter.ai/keys).

> **Note:** Each machine may use a different API key. The `.env` file is local-only and should never be committed to git.

---

### Step 5: Run the Setup Script

From the repository root, run the setup script:
```powershell
cd C:\Users\YOUR_USER\.gemini\antigravity\scratch\OpenCode
powershell -ExecutionPolicy Bypass -File .\setup.ps1
```

**What this script does:**
1. Backs up any existing physical configuration directory at `~/.config/opencode/` to a backup folder.
2. Creates a **Directory Junction** (reparse link) pointing `C:\Users\YOUR_USER\.config\opencode` → this repository.
3. Runs `npm install` inside the repository to install plugin dependencies.

---

### Step 6: Launch OpenCode

Open any terminal inside a project folder and run:
```powershell
opencode
```

The interactive TUI will launch directly in the terminal. All your custom subagents and slash commands will be loaded automatically.

---

## 🛠️ Adding OpenCode to a Project Workspace

To load project-specific rules and instructions when OpenCode launches inside a project, create an `opencode.json` file in that project's root directory.

### Example `opencode.json`
```json
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": [
    "AGENTS.md",
    ".agent/gemini.md",
    ".agent/rules/constitution.md",
    ".agent/rules/code-standards.md"
  ],
  "skills": {
    "paths": [".agent/skills"]
  }
}
```

### Fields
- **`instructions`** — Markdown files inside your project that OpenCode loads into the context window for all agents. Add or remove paths to fit your project.
- **`skills.paths`** — Directories (relative to project root) containing custom tools/skills.

> **Note:** You do **not** need a `.opencode` folder inside your project. All slash commands and subagents are resolved globally from the linked config directory.

---

## 🔄 Updating Models from OpenRouter

To fetch the latest available models from OpenRouter:

```powershell
cd C:\Users\YOUR_USER\.gemini\antigravity\scratch\OpenCode
node update_models.js
```

This calls the OpenRouter API and overwrites the JSON files in `models/` with the latest available models, categorized by provider.

---

## 🌐 Syncing Changes Across Machines

Because of the Directory Junction link, any changes made to your settings, agents, or commands update this repo directly.

```powershell
# Check what changed
cd C:\Users\YOUR_USER\.gemini\antigravity\scratch\OpenCode
git status

# Commit and push
git add .
git commit -m "feat: updated agent instructions and slash commands"
git push origin main

# On other machines, pull the changes
git pull origin main
```

---

## 🔧 Troubleshooting

| Problem | Fix |
|---|---|
| `opencode` opens an Antigravity window instead of the TUI | You have a PowerShell alias overriding the command. Run `Get-Alias opencode` to check, then `Remove-Item Alias:\opencode` to clear it. |
| `opencode: not recognized` | The CLI isn't installed. Run `npm install -g opencode-ai` and restart your terminal. |
| `scripts disabled on this system` | Run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force` |
| `opencode` asks where to open | The `.cmd` wrapper is missing. Run `npm install -g opencode-ai --force` to regenerate it. |
| Models not loading | Check that `.env` exists in this repo with a valid `OPENROUTER_API_KEY`. |
