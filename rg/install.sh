#!/bin/bash

if ! command -v nix &>/dev/null; then
    echo "Error: nix is required to install ripgrep." >&2
    echo "Install Nix first, then re-run this script: https://determinate.systems/nix" >&2
    exit 1
fi

if nix profile list --json 2>/dev/null | grep -q "dotfiles?dir=rg"; then
    echo "ripgrep is already installed."
else
    echo "Installing ripgrep..."
    nix profile add ~/dotfiles/rg
    echo "ripgrep has been installed."
fi

rg_path="$(command -v rg)"
if [ "$rg_path" != "$HOME/.nix-profile/bin/rg" ]; then
    echo "Warning: rg resolves to ${rg_path:-none}, not $HOME/.nix-profile/bin/rg." >&2
fi
