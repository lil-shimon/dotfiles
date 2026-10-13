# CLAUDE.md

# ファイル構造

```
aerospace/    # AeroSpace (タイル型ウィンドウマネージャ)
git/          # Git設定
herdr/        # herdr (ターミナルマルチプレクサ)
mise/         # mise のグローバル設定 (~/.config/mise/config.toml へ symlink)
nix/          # nix-darwin と、その中に組み込んだ home-manager (flakes)。flake.nix が入口、darwin.nix が macOS 全体、home.nix がホーム設定
nvim/         # Neovim (Lazy.nvim)
starship/     # starship (プロンプト) の設定
wezterm/      # ターミナル
mise.toml     # このリポジトリ内でだけ効くプロジェクト設定 (mise/ はグローバル側)
```

# nix-darwin / home-manager

パッケージと設定ファイルの配置は、すべて home-manager で管理する。macOS 全体の設定は nix-darwin で管理する。

```bash
sudo /run/current-system/sw/bin/darwin-rebuild switch --flake ~/dotfiles/nix#shimonlil   # home-manager もこの 1 回で適用される。設定名は固定の shimonlil で省略できない
/run/current-system/sw/bin/darwin-rebuild --list-generations                             # 世代の一覧。戻すときは sudo で --rollback
```

sudo は `secure_path` で PATH を置き換えるので、`darwin-rebuild` はフルパスで呼ぶ。

# コードのコメント

新しく書くコードには、頼まれない限りコメントを付けない。差分の意図はコミットメッセージと PR に書く。既存のコメントは勝手に消さず、編集するファイルのコメントの量に合わせる。移行の途中経過のように、時間が経つと古くなる説明は書かない。
