#!bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Symlink
ln -sf "$DOTFILES_DIR/emacs" ~/.emacs.d
echo "Linked ~/.emacs.d -> $DOTFILES_DIR/emacs"

# Everforest theme
if [ ! -d ~/.emacs.d/everforest-theme ]; then
    git clone https://github.com/Theory-of-Everything/everforest-emacs.git ~/.emacs.d/everforest-theme
    echo "Cloned everforest-theme"
else
    echo "everforest-theme is already exists, skipping"
fi
