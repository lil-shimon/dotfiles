#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config/borders"
CONFIG_FILE="$CONFIG_DIR/bordersrc"
SOURCE_FILE="$SCRIPT_DIR/bordersrc"

# bordersがインストールされていない場合のみインストール
if ! command -v borders &> /dev/null; then
    echo "Installing borders..."
    brew tap FelixKratz/formulae
    brew install borders
else
    echo "borders is already installed"
fi

# シンボリックリンクの作成
if [ ! -L "$CONFIG_FILE" ]; then
    mkdir -p "$CONFIG_DIR"
    ln -s "$SOURCE_FILE" "$CONFIG_FILE"
    echo "Created symlink: $CONFIG_FILE -> $SOURCE_FILE"
else
    echo "Symlink already exists: $CONFIG_FILE"
fi
