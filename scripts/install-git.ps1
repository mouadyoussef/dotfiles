param(
    [string]$DotfilesDir,
    [switch]$Force
)

. "$PSScriptRoot\helpers.ps1"

New-Symlink "$HOME\.gitconfig" "$DotfilesDir\.gitconfig" -Force:$Force
