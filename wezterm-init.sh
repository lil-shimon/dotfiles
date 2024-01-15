#!/bin/bash

# シンボリックリンクを作成する前に、既存のリンクが存在するかをチェックします。
if [ -L ~/.wezterm.lua ]; then
    echo "既にシンボリックリンクが存在します: ~/.wezterm.lua"
else
    ln -s ~/dotfiles/wezterm/.wezterm.lua ~/
    echo "シンボリックリンクを作成しました: ~/.wezterm.lua"
fi

