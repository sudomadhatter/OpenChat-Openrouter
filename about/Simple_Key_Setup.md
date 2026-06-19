# Quick Setup: Connect Your OpenRouter API Key

## Step 1: Set the Environment Variable
```powershell
[System.Environment]::SetEnvironmentVariable("OPENROUTER_API_KEY", "sk-or-v1-YOUR_KEY_HERE", "User")
```
Replace `sk-or-v1-YOUR_KEY_HERE` with your actual key from [openrouter.ai/keys](https://openrouter.ai/keys).

## Step 2: Add the Profile Auto-Loader

IDE terminals (Antigravity, VS Code, etc.) often don't inherit User-level environment variables. Add this to your PowerShell profile so the key is always available:

```powershell
notepad $PROFILE
```

Paste this into the file and save:
```powershell
# --- OpenRouter API Key (auto-load from persistent User env var) ---
if (-not $env:OPENROUTER_API_KEY) {
    $key = [System.Environment]::GetEnvironmentVariable("OPENROUTER_API_KEY", "User")
    if ($key) { $env:OPENROUTER_API_KEY = $key }
}
```

## Step 3: Restart Your Terminal
Close and reopen your terminal window (or run `. $PROFILE` to reload in-place).

## Step 4: Launch OpenCode
```powershell
opencode
```

## Step 5: Pick a Model
Inside the TUI, type `/models`, search for your model, and select it.

## Done!
Your key is stored as a permanent Windows environment variable and auto-loaded via your PowerShell profile. It persists across all terminal sessions, reboots, and IDE terminal spawns. Each machine uses its own key — the config files stay the same everywhere.
