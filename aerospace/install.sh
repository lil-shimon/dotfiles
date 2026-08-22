#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config/aerospace"
CONFIG_FILE="$CONFIG_DIR/aerospace.toml"
SOURCE_FILE="$SCRIPT_DIR/.aerospace.toml"

# aerospaceがインストールされていない場合のみインストール
if ! command -v aerospace &> /dev/null; then
    echo "Installing aerospace..."
    brew install --cask nikitabobko/tap/aerospace
else
    echo "aerospace is already installed"
fi

# シンボリックリンクの作成
if [ ! -L "$CONFIG_FILE" ]; then
    mkdir -p "$CONFIG_DIR"
    ln -s "$SOURCE_FILE" "$CONFIG_FILE"
    echo "Created symlink: $CONFIG_FILE -> $SOURCE_FILE"
else
    echo "Symlink already exists: $CONFIG_FILE"
fi
