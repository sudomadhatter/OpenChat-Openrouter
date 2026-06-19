# How to Connect OpenRouter in OpenCode

OpenCode uses the `OPENROUTER_API_KEY` environment variable to authenticate with OpenRouter. This is configured in the global `opencode.json` via the `provider` block.

## First-Time Setup (Once Per Machine)

### Step 1: Set Your API Key as a Permanent Environment Variable

Open PowerShell and run the following command, replacing the key with your own:

```powershell
[System.Environment]::SetEnvironmentVariable("OPENROUTER_API_KEY", "sk-or-v1-YOUR_KEY_HERE", "User")
```

Get your key from [openrouter.ai/keys](https://openrouter.ai/keys).

> **Important:** Each machine can have a different API key. The key is stored in Windows environment variables — not in any file that gets pushed to git.

### Step 2: Restart Your Terminal

Close and reopen your terminal so the new environment variable is picked up.

### Step 3: Launch OpenCode

```powershell
opencode
```

### Step 4: Select Your Model

Inside the TUI, type `/models` and search for the model you want (e.g. `glm`, `claude`, `gpt`, `deepseek`). Select it and start coding.

## How It Works

The `opencode.json` in this config repo contains:
```json
"provider": {
  "openrouter": {
    "options": {
      "apiKey": "{env:OPENROUTER_API_KEY}"
    }
  }
}
```

This tells OpenCode to read the API key from the `OPENROUTER_API_KEY` environment variable. The JSON file is identical on every machine — only the env var value differs.

## Troubleshooting

| Problem | Fix |
|---|---|
| No models appear | Check that `OPENROUTER_API_KEY` is set: `echo $env:OPENROUTER_API_KEY` |
| Key not persisting | You must use `[System.Environment]::SetEnvironmentVariable(...)` with `"User"` scope, not just `$env:` |
| Want to switch models | Type `/models` at any time inside the TUI |
| Wrong key on this machine | Re-run the `SetEnvironmentVariable` command with the correct key |
