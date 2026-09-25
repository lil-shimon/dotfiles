# CLAUDE.md

# ファイル構造

```
aerospace/    # AeroSpace (タイル型ウィンドウマネージャ)
git/          # Git設定
herdr/        # herdr (ターミナルマルチプレクサ)
mise/         # mise のグローバル設定 (~/.config/mise/config.toml へ symlink)
nvim/         # Neovim (Lazy.nvim)
starship/     # starship (プロンプト) の設定
wezterm/      # ターミナル
mise.toml     # このリポジトリ内でだけ効くプロジェクト設定 (mise/ はグローバル側)
flake.nix     # home-manager (standalone + flakes) の入口。homeConfigurations."shimonlil"
home.nix      # home-manager のホーム設定
```

# home-manager

パッケージと設定ファイルの配置は、すべて home-manager で管理する。

```bash
home-manager switch --flake ~/dotfiles   # 設定名が $USER と同じなので #shimonlil は省略できる
home-manager generations                 # 世代の一覧。戻すときは該当世代の activate を叩く
```
