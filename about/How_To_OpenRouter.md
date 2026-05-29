# How to Switch to OpenRouter in OpenCode

Since you want to use OpenRouter exclusively, follow these steps to connect and select your model.

## 1. Connect OpenRouter
1.  Open your terminal and run `opencode`.
2.  Once the interface loads, type `/connect` and press **Enter**.
3.  Use the arrow keys to select **OpenRouter** from the list.
4.  Paste your **OpenRouter API Key** when prompted and press **Enter**.

## 2. Select Your Model
1.  Type `/model` (or `/models`) and press **Enter**.
2.  In the search bar that appears, type the name of the model you want (e.g., `claude`, `gpt-4`, `deepseek`).
    -   *Example*: Type `anthropic/claude-3.5-sonnet`
3.  Select the model from the list and press **Enter**.

## 3. Verify
You should see the selected model name (e.g., `Claude 3.5 Sonnet`) displayed in the bottom status bar or top header. All your chats will now use this model.

## 4. Troubleshooting
If you don't see the models:
- Ensure your API key is correct.
- Try running `/refresh` if available to reload model lists.
