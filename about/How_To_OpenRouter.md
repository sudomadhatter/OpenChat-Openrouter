# How to Connect OpenRouter in OpenCode

OpenCode uses its own internal auth store for API keys. The `.env` file in this repo is just a reference — you must register your key inside OpenCode once per machine.

## 1. Launch OpenCode

Open a terminal in any project folder and run:
```powershell
opencode
```

## 2. Connect OpenRouter

Inside the OpenCode TUI:
1. Type `/connect` and press **Enter**.
2. Use the arrow keys to select **OpenRouter** from the provider list.
3. Paste your **OpenRouter API key** (starts with `sk-or-v1-...`) and press **Enter**.

> Your key is saved permanently in OpenCode's auth store (`~/.local/share/opencode/auth.json` on Linux/Mac, or the equivalent on Windows). You only need to do this once per machine.

## 3. Select Your Model

1. Type `/models` and press **Enter**.
2. Search for the model you want (e.g. `claude`, `glm`, `deepseek`, `gpt`).
3. Select it and press **Enter**.

The selected model name will appear in the status bar. All your chats will now use this model via OpenRouter.

## 4. Troubleshooting

| Problem | Fix |
|---|---|
| No models appear after `/connect` | Double-check your API key at [openrouter.ai/keys](https://openrouter.ai/keys) |
| Key not saved between sessions | Re-run `/connect` — the first attempt may have failed silently |
| Want to switch models mid-session | Type `/models` at any time to change |
