# install.ps1 - Symlink dotfiles to their expected locations
# Run as Administrator for symlink support on Windows

param(
    [switch]$Force
)

$dotfilesDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function New-Symlink {
    param([string]$Link, [string]$Target)
    $parentDir = Split-Path -Parent $Link
    if (-not (Test-Path $parentDir)) {
        New-Item -ItemType Directory -Path $parentDir -Force | Out-Null
    }
    if (Test-Path $Link) {
        if ($Force) {
            Remove-Item $Link -Force
        } else {
            Write-Warning "Skipping $Link (already exists). Use -Force to overwrite."
            return
        }
    }
    New-Item -ItemType SymbolicLink -Path $Link -Target $Target | Out-Null
    Write-Host "Linked: $Link -> $Target"
}

# Git
New-Symlink "$HOME\.gitconfig" "$dotfilesDir\.gitconfig"

# npm
New-Symlink "$HOME\.npmrc" "$dotfilesDir\.npmrc"

# Oh My Posh
New-Symlink "$HOME\oh-my-posh.omp.json" "$dotfilesDir\oh-my-posh.omp.json"

# VS Code
New-Symlink "$env:APPDATA\Code\User\settings.json" "$dotfilesDir\vscode\settings.json"
New-Symlink "$env:APPDATA\Code\User\keybindings.json" "$dotfilesDir\vscode\keybindings.json"

# Windows Terminal
New-Symlink "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" "$dotfilesDir\windows-terminal\settings.json"

# PowerShell profile
$profileDir = Split-Path -Parent $PROFILE
New-Symlink "$profileDir\Microsoft.PowerShell_profile.ps1" "$dotfilesDir\powershell\Microsoft.PowerShell_profile.ps1"

# Install VS Code extensions
if (Get-Command code -ErrorAction SilentlyContinue) {
    Write-Host "Installing VS Code extensions..."
    Get-Content "$dotfilesDir\vscode\extensions.txt" | ForEach-Object {
        code --install-extension $_ --force 2>$null
    }
}

Write-Host "`nDotfiles installed successfully!" -ForegroundColor Green
