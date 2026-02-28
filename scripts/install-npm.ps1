param(
    [string]$DotfilesDir,
    [switch]$Force
)

. "$PSScriptRoot\helpers.ps1"

New-Symlink "$HOME\.npmrc" "$DotfilesDir\.npmrc" -Force:$Force
