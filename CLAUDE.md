# CLAUDE.md

# ファイル構造

```
aerospace/    # AeroSpace (タイル型ウィンドウマネージャ)
git/          # Git設定
herdr/        # herdr (ターミナルマルチプレクサ)
mise/         # mise のグローバル設定 (~/.config/mise/config.toml へ symlink)
nix/          # nix-darwin と home-manager (standalone + flakes)。flake.nix が入口、darwin.nix が macOS 全体、home.nix がホーム設定
nvim/         # Neovim (Lazy.nvim)
starship/     # starship (プロンプト) の設定
wezterm/      # ターミナル
mise.toml     # このリポジトリ内でだけ効くプロジェクト設定 (mise/ はグローバル側)
```

# nix-darwin / home-manager

パッケージと設定ファイルの配置は、すべて home-manager で管理する。macOS 全体の設定は nix-darwin で管理する。

```bash
sudo darwin-rebuild switch --flake ~/dotfiles/nix#shimonlil   # 設定名はホスト名ではなく固定の shimonlil。#shimonlil は省略できない
home-manager switch --flake ~/dotfiles/nix                     # 設定名が $USER と同じなので #shimonlil は省略できる
home-manager generations                                       # 世代の一覧。戻すときは該当世代の activate を叩く
```
