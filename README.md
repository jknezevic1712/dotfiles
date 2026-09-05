# Various personal configs

## Setup on Windows

### Create symlinks to configs

New-Item -ItemType SymbolicLink `
    -Path "$HOME\.wezterm.lua" `
    -Target "<Path to dotfiles>\dotfiles\wezterm\wezterm.lua"

New-Item -ItemType SymbolicLink `
    -Path "$env:LOCALAPPDATA\nvim" `
    -Target "<Path to dotfiles>\dotfiles\nvim"

## Setup on MacOS

Check this video out on details: https://www.youtube.com/watch?v=l5c5ucQvKOA&t=221s
