param(
    [string]$DotfilesDir,
    [switch]$Force
)

. "$PSScriptRoot\helpers.ps1"

New-Symlink "$HOME\oh-my-posh.omp.json" "$DotfilesDir\oh-my-posh.omp.json" -Force:$Force
