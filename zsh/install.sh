#!/bin/bash

# Oh My Zsh 本体とテーマ・プラグインをインストールします。
ZSH_DIR="$HOME/.oh-my-zsh"
ZSH_CUSTOM_DIR="$ZSH_DIR/custom"

clone_if_missing() {
    local name="$1" url="$2" dest="$3"
    if [ -d "$dest" ]; then
        echo "${name}は既にインストールされています。"
    else
        echo "${name}をインストールしています..."
        git clone --depth=1 "$url" "$dest" || return 1
        echo "${name}のインストールが完了しました。"
    fi
}

clone_if_missing "Oh My Zsh" https://github.com/ohmyzsh/ohmyzsh.git "$ZSH_DIR" || exit 1
clone_if_missing "powerlevel10k" https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM_DIR/themes/powerlevel10k" || exit 1
clone_if_missing "zsh-autosuggestions" https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" || exit 1

# シンボリックリンクを作成する前に、既存のファイル/リンクをチェックします。
timestamp="$(date +%Y%m%d%H%M%S)"

for file in .zshenv .zprofile .zshrc .p10k.zsh; do
    if [ -L ~/"$file" ]; then
        echo "既にシンボリックリンクが存在します: ~/$file"
        continue
    fi
    if [ -f ~/"$file" ]; then
        echo "既存の${file}ファイルが存在します。バックアップを作成します..."
        mv ~/"$file" ~/"$file.backup.$timestamp"
        echo "バックアップを作成しました: ~/$file.backup.$timestamp"
    fi
    ln -s ~/dotfiles/zsh/"$file" ~/"$file"
    echo "シンボリックリンクを作成しました: ~/$file"
done
