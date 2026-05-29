# OpenChat-Openrouter Config (openCode Config Repo)

This repository holds your centralized OpenCode configuration, custom subagents, slash commands, model configuration lists, and plugin dependency packages. 

By linking this repository to your global configuration directory, you can sync your agents and slash commands across different computers and projects.

---

## Repository Structure

- `[agent/](file:///c:/AGY-Projects/openCode/agent)` - Custom subagent personas (e.g. `bmad-pm`, `bmad-dev`, `bmad-qa`, etc.).
- `[commands/](file:///c:/AGY-Projects/openCode/commands)` - Custom slash commands (e.g. `/pm`, `/dev`, `/qa`, `/slash_command_updating`, etc.).
- `[models/](file:///c:/AGY-Projects/openCode/models)` - Local OpenRouter models cache files.
- `[opencode.json](file:///c:/AGY-Projects/openCode/opencode.json)` - Central OpenCode global configuration file.
- `[package.json](file:///c:/AGY-Projects/openCode/package.json)` - Package specifications for global plugins like `@opencode-ai/plugin`.
- `[setup.ps1](file:///c:/AGY-Projects/openCode/setup.ps1)` - PowerShell installation script to link this repo to your global user profile configuration path.

---

## Installation & Setup (New Machine)

Follow these steps to set up this configuration repository on a new computer:

### Step 1: Clone the Repository
Clone this repository to your projects directory (e.g., `C:\AGY-Projects\openCode`):
```powershell
cd C:\AGY-Projects
git clone https://github.com/sudomadhatter/OpenChat-Openrouter.git openCode
```

### Step 2: Run the Setup Script
Open **PowerShell** and run the setup script from the repository root:
```powershell
cd C:\AGY-Projects\openCode
powershell -ExecutionPolicy Bypass -File .\setup.ps1
```

**What this script does:**
1. Backs up any existing physical configuration directory at `~/.config/opencode/` to a backup folder.
2. Creates a **Directory Junction** (reparse link) pointing `C:\Users\YOUR_USER\.config\opencode` directly to `C:\AGY-Projects\openCode`.
3. Runs `npm install` inside the repository to install and link plugin dependencies globally.

### Step 3: Launch OpenCode
Restart your terminal and run `opencode` inside any project folder (e.g. `C:\AGY-Projects\aviationChat-AGY`). All your custom subagents and commands will be loaded automatically!

---

## Making & Syncing Changes

Because of the Directory Junction link:
1. Any changes made to your settings, agents, or commands (either through the OpenCode interface or editing files manually) update the `[openCode](file:///c:/AGY-Projects/openCode)` folder directly.
2. To sync your updates across all machines:
   - Check status and review changes:
     ```powershell
     cd C:\AGY-Projects\openCode
     git status
     ```
   - Commit and push your changes:
     ```powershell
     git add .
     git commit -m "feat: updated agent instructions and slash commands"
     git push origin main
     ```
   - On your other machines, pull down the changes:
     ```powershell
     cd C:\AGY-Projects\openCode
     git pull origin main
     ```
