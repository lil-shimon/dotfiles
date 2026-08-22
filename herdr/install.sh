#!/bin/bash

# herdrがインストールされているかどうかをチェックします。
if brew list herdr &>/dev/null; then
    echo "herdrは既にインストールされています。"
else
    echo "herdrをインストールしています..."
    brew install herdr
    echo "herdrのインストールが完了しました。"
fi

# herdr-reviewrプラグインがインストールされているかどうかをチェックします。
if [ -d ~/.config/herdr/plugins/config/persiyanov.reviewr ]; then
    echo "herdr-reviewrは既にインストールされています。"
else
    echo "herdr-reviewrをインストールしています..."
    herdr plugin install persiyanov/herdr-reviewr --yes
    echo "herdr-reviewrのインストールが完了しました。"
fi

# シンボリックリンクを作成する前に、既存のファイル/リンクをチェックします。
mkdir -p ~/.config/herdr
if [ -L ~/.config/herdr/config.toml ]; then
    echo "既にシンボリックリンクが存在します: ~/.config/herdr/config.toml"
elif [ -f ~/.config/herdr/config.toml ]; then
    echo "既存のconfig.tomlファイルが存在します。バックアップを作成します..."
    mv ~/.config/herdr/config.toml ~/.config/herdr/config.toml.backup
    echo "バックアップを作成しました: ~/.config/herdr/config.toml.backup"
    ln -s ~/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
    echo "シンボリックリンクを作成しました: ~/.config/herdr/config.toml"
else
    ln -s ~/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
    echo "シンボリックリンクを作成しました: ~/.config/herdr/config.toml"
fi
