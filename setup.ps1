# setup.ps1
# -----------------------------------------------------------------------------
# Links this openCode repository to the global OpenCode configuration path.
# Makes your custom agents, commands, and settings available on this machine.
# -----------------------------------------------------------------------------

$TargetJunction = Join-Path $env:USERPROFILE ".config\opencode"
$SourceRepo     = $PSScriptRoot

Write-Host "Setting up OpenCode environment link..."
Write-Host "Source Repository: $SourceRepo"
Write-Host "Target Junction:   $TargetJunction"
Write-Host ""

# 1. Check if the target already exists
if (Test-Path -LiteralPath $TargetJunction) {
    # Check if it is a SymbolicLink / Junction
    $Item = Get-Item -LiteralPath $TargetJunction
    if ($Item.Attributes -match "ReparsePoint") {
        # It's a link. Check where it points.
        $Target = $Item.Target
        if ($Target -eq $SourceRepo) {
            Write-Host "✅ OpenCode is already linked to this directory." -ForegroundColor Green
            Write-Host "Running npm install to ensure plugins are up-to-date..."
            npm install
            exit 0
        } else {
            Write-Warning "OpenCode is currently linked to a different directory: $Target"
            $Confirm = Read-Host "Do you want to re-link to this directory? (y/N)"
            if ($Confirm -eq 'y' -or $Confirm -eq 'Y') {
                Write-Host "Removing existing link..."
                Remove-Item -LiteralPath $TargetJunction -Force
            } else {
                Write-Host "Setup aborted."
                exit 0
            }
        }
    } else {
        # It's a physical directory. Back it up.
        $Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $BackupPath = "${TargetJunction}_backup_${Timestamp}"
        Write-Host "Moving existing config directory to backup: $BackupPath"
        Rename-Item -LiteralPath $TargetJunction -NewName (Split-Path $BackupPath -Leaf) -Force
    }
}

# 2. Create the Directory Junction
Write-Host "Creating junction link..."
New-Item -ItemType Junction -Path $TargetJunction -Value $SourceRepo | Out-Null

if (Test-Path -LiteralPath $TargetJunction) {
    Write-Host "✅ Junction link created successfully!" -ForegroundColor Green
} else {
    Write-Error "Failed to create junction link."
    exit 1
}

# 3. Install dependencies locally
Write-Host "Installing dependencies..."
npm install

Write-Host ""
Write-Host "🎉 Setup complete! Restart OpenCode to apply configuration changes." -ForegroundColor Green
