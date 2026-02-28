param(
    [string]$DotfilesDir,
    [switch]$Force
)

. "$PSScriptRoot\helpers.ps1"

New-Symlink "$HOME\.config\oh-my-posh\theme.omp.json" "$DotfilesDir\oh-my-posh.omp.json" -Force:$Force
