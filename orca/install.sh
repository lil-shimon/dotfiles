#!/bin/bash

if ! command -v nix &>/dev/null; then
    echo "Error: nix is required to install orca." >&2
    echo "Install Nix first, then re-run this script: https://determinate.systems/nix" >&2
    exit 1
fi

# Orca本体をインストールします。
if nix profile list --json 2>/dev/null | grep -q "dotfiles?dir=orca"; then
    echo "Orcaは既にインストールされています。"
else
    echo "Orcaをインストールしています..."
    nix profile add ~/dotfiles/orca
    echo "Orcaのインストールが完了しました。"
fi

orca_path="$(command -v orca)"
if [ "$orca_path" != "$HOME/.nix-profile/bin/orca" ]; then
    echo "Warning: orca resolves to ${orca_path:-none}, not $HOME/.nix-profile/bin/orca." >&2
fi

# .appはnix store配下にあり、/Applicationsには来ません。
# Spotlight / Raycastからは引けないため、起動は `orca open` かLaunchpad以外の導線を使います。
echo "GUIの起動: orca open (実体: $HOME/.nix-profile/Applications/Orca.app)"
