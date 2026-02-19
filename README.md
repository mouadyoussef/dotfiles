# Dotfiles

Personal development environment configuration for Windows.

## Contents

| File/Folder | Description |
|---|---|
| `.gitconfig` | Git configuration and aliases |
| `.npmrc` | npm configuration |
| `oh-my-posh.omp.json` | Oh My Posh prompt theme |
| `vscode/settings.json` | VS Code settings |
| `vscode/keybindings.json` | VS Code keybindings |
| `vscode/extensions.txt` | VS Code extensions list |
| `windows-terminal/settings.json` | Windows Terminal settings |
| `powershell/Microsoft.PowerShell_profile.ps1` | PowerShell profile |

## Setup on a new machine

```powershell
git clone https://github.com/mouadyoussef/dotfiles.git ~/dotfiles
cd ~/dotfiles
# Run as Administrator
.\install.ps1
# Use -Force to overwrite existing files
.\install.ps1 -Force
```

## Updating

Edit files in `~/dotfiles` directly (they're symlinked), then commit and push.
