#!/bin/bash

# Nushellがインストールされているかどうかをチェックします。
if brew list nushell &>/dev/null; then
    echo "Nushellは既にインストールされています。"
else
    echo "Nushellをインストールしています..."
    brew install nushell
    echo "Nushellのインストールが完了しました。"
fi

NU_CONFIG_DIR=~/.config/nushell

# config.nuのシンボリックリンクをチェックして作成
if [ -L "$NU_CONFIG_DIR/config.nu" ]; then
    echo "既にconfig.nuのシンボリックリンクが存在します。"
else
    ln -s ~/dotfiles/nushell/config.nu "$NU_CONFIG_DIR/config.nu"
    echo "config.nuのシンボリックリンクを作成しました: $NU_CONFIG_DIR/config.nu"
fi

# env.nuのシンボリックリンクをチェックして作成
if [ -L "$NU_CONFIG_DIR/env.nu" ]; then
    echo "既にenv.nuのシンボリックリンクが存在します。"
else
    ln -s ~/dotfiles/nushell/env.nu "$NU_CONFIG_DIR/env.nu"
    echo "env.nuのシンボリックリンクを作成しました: $NU_CONFIG_DIR/env.nu"
fi