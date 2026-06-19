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

### Step 2: Add the PowerShell Profile Auto-Loader

IDE-spawned terminals (Antigravity, VS Code, etc.) often **do not inherit** User-level environment variables. This causes a "missing auth headers" error even though the key is set correctly.

Fix this permanently by adding an auto-loader to your PowerShell profile:

```powershell
notepad $PROFILE
```

Paste this block and save:
```powershell
# --- OpenRouter API Key (auto-load from persistent User env var) ---
if (-not $env:OPENROUTER_API_KEY) {
    $key = [System.Environment]::GetEnvironmentVariable("OPENROUTER_API_KEY", "User")
    if ($key) { $env:OPENROUTER_API_KEY = $key }
}
```

> **Why is this needed?** `SetEnvironmentVariable("User")` writes to the Windows registry. New Explorer-launched terminals pick it up, but IDE-embedded terminals often fork from a parent process that was started *before* the variable was set. The profile script bridges that gap.

### Step 3: Restart Your Terminal

Close and reopen your terminal so the new environment variable and profile are picked up. Or run `. $PROFILE` to reload in-place.

### Step 4: Launch OpenCode

```powershell
opencode
```

### Step 5: Select Your Model

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
| **"missing auth headers"** | The env var isn't in the current process. Run `. $PROFILE` or restart the terminal. If that doesn't help, verify Step 2 above. |
| No models appear | Check that `OPENROUTER_API_KEY` is set: `echo $env:OPENROUTER_API_KEY` |
| Key not persisting | You must use `[System.Environment]::SetEnvironmentVariable(...)` with `"User"` scope, not just `$env:` |
| Want to switch models | Type `/models` at any time inside the TUI |
| Wrong key on this machine | Re-run the `SetEnvironmentVariable` command with the correct key |
