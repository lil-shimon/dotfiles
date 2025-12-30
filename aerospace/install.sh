#!/bin/bash

# aerospaceがインストールされていない場合のみインストール
if ! command -v aerospace &> /dev/null; then
    echo "Installing aerospace..."
    brew install --cask nikitabobko/tap/aerospace
else
    echo "aerospace is already installed"
fi
