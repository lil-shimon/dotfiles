# dotfiles

個人の開発環境設定ファイル。nix-darwin と、その中に組み込んだ home-manager（flakes）で管理している。

## セットアップ

1. Nix を入れる（[Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)。flakes が最初から有効になる）

   ```bash
   curl -fsSL https://install.determinate.systems/nix | sh -s -- install
   ```

   Homebrew も入れておく。
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

   生成される `.zprofile` が `/opt/homebrew/bin/brew shellenv` を読む（Nix に無い cask などは Homebrew で入れている）。

2. このリポジトリを `~/dotfiles` に clone する（設定ファイルは `~/dotfiles` を絶対パスで指している）

   ```bash
   git clone https://github.com/lil-shimon/dotfiles.git ~/dotfiles
   ```

3. nix-darwin で適用する（初回は `darwin-rebuild` コマンドが無いので `nix run` で呼ぶ）。home-manager の設定もこの 1 回で適用される

   ```bash
   sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix#shimonlil
   ```

   既存の `~/.zshrc` などがあると、中身が違う場合は適用が止まる。退避してからやり直す。

4. AeroSpace を起動し、システム設定 → プライバシーとセキュリティ → アクセシビリティで許可する

   ```bash
   open ~/Applications/"Home Manager Apps"/AeroSpace.app
   ```

5. 画面ロックまでの猶予を即時にする。nix-darwin の `system.defaults.screensaver.askForPasswordDelay` は macOS 26 では効かないので、一度だけ手で実行する（ログインパスワードを聞かれる）

   ```bash
   sysadminctl -screenLock immediate -password -
   ```

## 更新

```bash
sudo /run/current-system/sw/bin/darwin-rebuild switch --flake ~/dotfiles/nix#shimonlil   # nix/ 配下を変えたとき
nix flake update --flake ~/dotfiles/nix                                                  # パッケージの版を上げるとき（通常は Dependabot の PR で）
```

sudo は `secure_path` で PATH を置き換えるので、`darwin-rebuild` はフルパスで呼ぶ。
