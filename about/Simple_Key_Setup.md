# Simple Step-by-Step Guide: Connect OpenRouter

We will use a "Magic Command" to fix the key issue. This is safer than pasting inside the app.

## Step 1: Open Terminal
You clearly have one open, but if not, open PowerShell.

## Step 2: Copy the Magic Command
Copy the line below, but **STOP**. Do not hit enter yet.

```powershell
$env:OPENROUTER_API_KEY="PASTE_YOUR_KEY_HERE"
```

## Step 3: Paste and Edit
1.  Paste that line into your terminal.
2.  Delete the text `PASTE_YOUR_KEY_HERE`.
3.  Paste your actual key (it starts with `sk-or-v1-...`) inside the quotes `""`.
    -   It should look like: `$env:OPENROUTER_API_KEY="sk-or-v1-abc12345..."`
4.  **Press Enter**.

## Step 4: Launch OpenCode
Now, in the *same* terminal window, type:

```powershell
opencode
```
**Press Enter.**

## Step 5: Verify
Once OpenCode loads:
1.  Type `/model` and press Enter.
2.  Type `claude` (or any model you want).
3.  If you see models, **it worked!**

---
*Note: This "Magic Command" only lasts while this terminal window is open. If you close it, you might need to do this again. To make it permanent, search Windows for "Edit the system environment variables".*
