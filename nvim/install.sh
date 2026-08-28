#!/bin/bash

if ! command -v nix &>/dev/null; then
    echo "Error: nix is required to install Neovim." >&2
    echo "Install Nix first, then re-run this script: https://determinate.systems/nix" >&2
    exit 1
fi

if nix profile list --json 2>/dev/null | grep -q "dotfiles?dir=nvim"; then
    echo "Neovim is already installed."
else
    echo "Installing Neovim..."
    nix profile add ~/dotfiles/nvim
    echo "Neovim has been installed."
fi

nvim_path="$(command -v nvim)"
if [ "$nvim_path" != "$HOME/.nix-profile/bin/nvim" ]; then
    echo "Warning: nvim resolves to ${nvim_path:-none}, not $HOME/.nix-profile/bin/nvim." >&2
fi

if [ -L ~/.config/nvim ]; then
    echo "Symbolic link already exists: ~/.config/nvim"
else
    ln -s ~/dotfiles/nvim ~/.config/nvim
    echo "Created symbolic link: ~/.config/nvim"
fi
