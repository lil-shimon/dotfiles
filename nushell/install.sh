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
DOTFILES_NUSHELL_DIR=~/dotfiles/nushell

# dotfiles/nushellディレクトリ内の各ファイルに対してシンボリックリンクを作成
for file in "$DOTFILES_NUSHELL_DIR"/*; do
    filename=$(basename "$file")
    target="$NU_CONFIG_DIR/$filename"

    if [ -L "$target" ]; then
        echo "既に $filename のシンボリックリンクが存在します。"
    else
        ln -s "$file" "$target"
        echo "$filename のシンボリックリンクを作成しました: $target"
    fi
done

echo "シンボリックリンクの作成が完了しました。現在の $NU_CONFIG_DIR の内容:"
ls -la "$NU_CONFIG_DIR"
