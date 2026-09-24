#!/bin/bash

# WezTermがインストールされているかどうかをチェックします。
if brew list wezterm &>/dev/null; then
    echo "WezTermは既にインストールされています。"
else
    echo "WezTermをインストールしています..."
    brew install --cask wezterm
    echo "WezTermのインストールが完了しました。"
fi

