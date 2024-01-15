#!/bin/bash

# WezTermがインストールされているかどうかをチェックします。
if brew list wezterm &>/dev/null; then
    echo "WezTermは既にインストールされています。"
else
    echo "WezTermをインストールしています..."
    brew install --cask wezterm
    echo "WezTermのインストールが完了しました。"
fi

# シンボリックリンクを作成する前に、既存のリンクが存在するかをチェックします。
if [ -L ~/.wezterm.lua ]; then
    echo "既にシンボリックリンクが存在します: ~/.wezterm.lua"
else
    ln -s ~/dotfiles/wezterm/.wezterm.lua ~/
    echo "シンボリックリンクを作成しました: ~/.wezterm.lua"
fi

