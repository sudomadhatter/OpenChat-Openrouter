# OpenCode + OpenRouter: In-Depth Guide

This guide explains how to configure and use OpenRouter models within OpenCode effectively without corrupting your configuration.

## 1. Understanding the Configuration

OpenCode stores its settings in `C:\Users\YOUR_USER\.config\opencode\opencode.json`.
**CRITICAL**: This file must remain a valid JSON object with specific keys (`version`, `config`, etc.). **Do not copy-paste lists of models directly into this file**, as it will break the application.

## 2. Connecting OpenRouter

You do not need to manually edit the JSON file to add OpenRouter. OpenCode supports it natively via the TUI.

### Step-by-Step Setup
1.  **Start OpenCode**: Run `opencode` in your terminal.
2.  **Open Settings**: Type `/connect` or select **Settings** from the menu.
3.  **Select Provider**: Choose **OpenRouter**.
4.  **Enter API Key**: Paste your OpenRouter API key when prompted.
5.  **Select Model**: You can now search for specific OpenRouter models (e.g., `anthropic/claude-3.5-sonnet`) directly within the interface.

## 3. Managing Models & Presets

Instead of overwriting your config, use the **Model Selector**:
- Press `Ctrl+T` (or the indicated key) in the TUI to open the Model/Agent selector.
- You can switch between "Chat", "Code", and "Architect" modes, each with different default models.

## 4. Troubleshooting "Invalid Configuration"

If you accidentally overwrite your config file and OpenCode fails to start:
1.  **Navigate** to `C:\Users\YOUR_USER\.config\opencode\`.
2.  **Delete or Rename** the corrupted `opencode.json` (e.g., to `opencode.json.old`).
3.  **Restart** `opencode`. It will regenerate a fresh, valid configuration file.

## 5. Advanced: Manual Configuration (Safe Method)

If you *must* edit `opencode.json`, only modify the `models` section inside the `config` object.

```json
{
  "version": "1.0.0",
  "config": {
    "default_model": "openrouter/anthropic/claude-3.5-sonnet",
    // ... other settings
  }
}
```
**Never replace the entire file with a model list.**
