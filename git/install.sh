#!/bin/bash

# git-deltaがインストールされているかどうかをチェックします。
if brew list git-delta &>/dev/null; then
    echo "git-deltaは既にインストールされています。"
else
    echo "git-deltaをインストールしています..."
    brew install git-delta
    echo "git-deltaのインストールが完了しました。"
fi

# シンボリックリンクを作成する前に、既存のファイル/リンクをチェックします。
if [ -L ~/.gitconfig ]; then
    echo "既にシンボリックリンクが存在します: ~/.gitconfig"
elif [ -f ~/.gitconfig ]; then
    echo "既存の.gitconfigファイルが存在します。バックアップを作成します..."
    mv ~/.gitconfig ~/.gitconfig.backup
    echo "バックアップを作成しました: ~/.gitconfig.backup"
    ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
    echo "シンボリックリンクを作成しました: ~/.gitconfig"
else
    ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
    echo "シンボリックリンクを作成しました: ~/.gitconfig"
fi
