#!/bin/bash

if ! command -v nix &>/dev/null; then
    echo "Error: nix is required to install git, gh and ghq." >&2
    echo "Install Nix first, then re-run this script: https://determinate.systems/nix" >&2
    exit 1
fi

# git / gh / ghq をインストールします。
if nix profile list --json 2>/dev/null | grep -q "dotfiles?dir=git"; then
    echo "git / gh / ghqは既にインストールされています。"
else
    echo "git / gh / ghqをインストールしています..."
    nix profile add ~/dotfiles/git
    echo "git / gh / ghqのインストールが完了しました。"
fi

for cmd in git gh ghq; do
    cmd_path="$(command -v "$cmd")"
    if [ "$cmd_path" != "$HOME/.nix-profile/bin/$cmd" ]; then
        echo "Warning: $cmd resolves to ${cmd_path:-none}, not $HOME/.nix-profile/bin/$cmd." >&2
        if brew list "$cmd" &>/dev/null; then
            echo "Warning: brew版の${cmd}が残っています。'brew uninstall $cmd' で削除してください。" >&2
        fi
    fi
done

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
