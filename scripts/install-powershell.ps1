param(
    [string]$DotfilesDir,
    [switch]$Force
)

. "$PSScriptRoot\helpers.ps1"

$profileDir = Split-Path -Parent $PROFILE
New-Symlink "$profileDir\Microsoft.PowerShell_profile.ps1" "$DotfilesDir\powershell\Microsoft.PowerShell_profile.ps1" -Force:$Force
