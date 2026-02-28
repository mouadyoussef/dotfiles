# install.ps1 - Orchestrator for dotfiles setup
# Run as Administrator for symlink support on Windows
# Usage: .\install.ps1 [-Force] [-Only <name>]

param(
    [switch]$Force,
    [ValidateSet("git", "npm", "oh-my-posh", "vscode", "windows-terminal", "powershell")]
    [string]$Only
)

$dotfilesDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$scriptsDir = "$dotfilesDir\scripts"

$scripts = @(
    "git",
    "npm",
    "oh-my-posh",
    "vscode",
    "windows-terminal",
    "powershell"
)

if ($Only) {
    $scripts = @($Only)
}

foreach ($script in $scripts) {
    $path = "$scriptsDir\install-$script.ps1"
    Write-Host "`n[$script]" -ForegroundColor Cyan
    & $path -DotfilesDir $dotfilesDir -Force:$Force
}

Write-Host "`nDotfiles installed successfully!" -ForegroundColor Green
