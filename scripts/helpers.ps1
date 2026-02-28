function New-Symlink {
    param(
        [string]$Link,
        [string]$Target,
        [switch]$Force
    )
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
