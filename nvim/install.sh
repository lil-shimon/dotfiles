#!/bin/bash

if brew list neovim &>/dev/null; then
    echo "Neovim is already installed."
else
    echo "Installing Neovim..."
    brew install neovim
    echo "Neovim has been installed."
fi

if [ -L ~/.config/nvim ]; then
    echo "Symbolic link already exists: ~/.config/nvim"
else
    ln -s ~/dotfiles/nvim ~/.config/nvim
    echo "Created symbolic link: ~/.config/nvim"
fi