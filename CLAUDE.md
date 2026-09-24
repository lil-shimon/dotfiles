# CLAUDE.md

# ファイル構造

```
aerospace/    # AeroSpace (タイル型ウィンドウマネージャ)
emacs/        # Emacs
git/          # Git設定
herdr/        # herdr (ターミナルマルチプレクサ)
mise/         # mise のグローバル設定 (~/.config/mise/config.toml へ symlink)
nvim/         # Neovim (Lazy.nvim)
orca/         # Orca (ADE: 並列エージェント用デスクトップアプリ)
tree-sitter/  # tree-sitter CLI (nvim-treesitter のパーサビルド)
wezterm/      # ターミナル
zsh/          # zsh (Oh My Zsh + powerlevel10k)
mise.toml     # このリポジトリ内でだけ効くプロジェクト設定 (mise/ はグローバル側)
flake.nix     # home-manager (standalone + flakes) の入口。homeConfigurations."shimonlil"
home.nix      # home-manager のホーム設定
```

# home-manager

`install.sh` から home-manager への移行中 (#108)。移行が済むまで両者は併存する。

```bash
home-manager switch --flake ~/dotfiles   # 設定名が $USER と同じなので #shimonlil は省略できる
home-manager generations                 # 世代の一覧。戻すときは該当世代の activate を叩く
```
