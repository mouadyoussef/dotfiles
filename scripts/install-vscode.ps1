param(
    [string]$DotfilesDir,
    [switch]$Force
)

. "$PSScriptRoot\helpers.ps1"

New-Symlink "$env:APPDATA\Code\User\settings.json" "$DotfilesDir\vscode\settings.json" -Force:$Force
New-Symlink "$env:APPDATA\Code\User\keybindings.json" "$DotfilesDir\vscode\keybindings.json" -Force:$Force

if (Get-Command code -ErrorAction SilentlyContinue) {
    Write-Host "Installing VS Code extensions..."
    Get-Content "$DotfilesDir\vscode\extensions.txt" | ForEach-Object {
        code --install-extension $_ --force 2>$null
    }
}
