oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\__theme.omp.json" | Invoke-Expression
$PSStyle.FileInfo.Directory = "`e[34m"