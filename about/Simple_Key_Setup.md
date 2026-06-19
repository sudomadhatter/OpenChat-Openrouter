# Quick Setup: Connect Your OpenRouter API Key

## Step 1: Set the Environment Variable
```powershell
[System.Environment]::SetEnvironmentVariable("OPENROUTER_API_KEY", "sk-or-v1-YOUR_KEY_HERE", "User")
```
Replace `sk-or-v1-YOUR_KEY_HERE` with your actual key from [openrouter.ai/keys](https://openrouter.ai/keys).

## Step 2: Restart Your Terminal
Close and reopen your terminal window.

## Step 3: Launch OpenCode
```powershell
opencode
```

## Step 4: Pick a Model
Inside the TUI, type `/models`, search for your model, and select it.

## Done!
Your key is stored as a permanent Windows environment variable. It persists across all terminal sessions and reboots. Each machine uses its own key — the config files stay the same everywhere.
