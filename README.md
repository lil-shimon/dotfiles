# dotfiles

個人の開発環境設定ファイル。home-manager（standalone + flakes）で管理している。

## セットアップ

1. Nix を入れる（[Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)。flakes が最初から有効になる）

   ```bash
   curl -fsSL https://install.determinate.systems/nix | sh -s -- install
   ```

   Homebrew も入れておく。生成される `.zprofile` が `/opt/homebrew/bin/brew shellenv` を読む（Nix に無い cask などは Homebrew で入れている）。

2. このリポジトリを `~/dotfiles` に clone する（設定ファイルは `~/dotfiles` を絶対パスで指している）

   ```bash
   git clone https://github.com/lil-shimon/dotfiles.git ~/dotfiles
   ```

3. home-manager で適用する（初回は `home-manager` コマンドが無いので `nix run` で呼ぶ）

   ```bash
   nix run home-manager/master -- switch --flake ~/dotfiles
   ```

   既存の `~/.zshrc` などがあると、中身が違う場合は適用が止まる。退避してからやり直す。

4. AeroSpace を起動し、システム設定 → プライバシーとセキュリティ → アクセシビリティで許可する

   ```bash
   open ~/Applications/"Home Manager Apps"/AeroSpace.app
   ```

## 更新

```bash
home-manager switch --flake ~/dotfiles   # home.nix を変えたとき
nix flake update --flake ~/dotfiles       # パッケージの版を上げるとき（通常は Dependabot の PR で）
```
