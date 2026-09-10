#!/bin/bash

if ! command -v nix &>/dev/null; then
    echo "Error: nix is required to install tree-sitter." >&2
    echo "Install Nix first, then re-run this script: https://determinate.systems/nix" >&2
    exit 1
fi

if nix profile list --json 2>/dev/null | grep -q "dotfiles?dir=tree-sitter"; then
    echo "tree-sitter is already installed."
else
    echo "Installing tree-sitter..."
    nix profile add ~/dotfiles/tree-sitter
    echo "tree-sitter has been installed."
fi

tree_sitter_path="$(command -v tree-sitter)"
if [ "$tree_sitter_path" != "$HOME/.nix-profile/bin/tree-sitter" ]; then
    echo "Warning: tree-sitter resolves to ${tree_sitter_path:-none}, not $HOME/.nix-profile/bin/tree-sitter." >&2
fi
