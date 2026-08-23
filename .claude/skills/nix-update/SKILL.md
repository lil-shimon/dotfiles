---
name: nix-update
description: >
  Nix flake (nvim/flake.nix) で pin している neovim のバージョンを上げる手順スキル。
  「neovim のバージョン上げて」「nvim を X.Y.Z にして」「flake 更新して」「/nix-update」
  などのトリガーで起動する。
  nixhub で目標バージョンを含む nixpkgs revision を特定 → flake.nix の rev 差し替え →
  nix flake lock → build でバージョンを実測 → commit / PR → マージ後に nix profile upgrade、
  という一連の流れを実行する。
---

# nix-update

## 前提

- 対象リポジトリは `~/dotfiles`
- `nvim/flake.nix` の `nixpkgs.url` は **特定 rev 固定**（`github:NixOS/nixpkgs/<rev>`）
- neovim は `nix profile` 経由でインストール済み（profile 上の element 名は `nvim`）

## 最重要の前提: `nix flake update` は効かない

Issue #59 Phase 5 には「`nix flake update` → `flake.lock` の diff → PR」と書かれているが、
`nixpkgs.url` が rev 固定である限り `nix flake update` は **no-op**（lock は 1 バイトも動かない）。

バージョンを動かす実体は `flake.nix` の rev。したがって手順は
**「rev を差し替えて `nix flake lock` で lock を追随させる」** になる。
`nix flake update` は打たない。

## 手順

### 1. 現状を記録する

```bash
nvim --version | head -1
nix profile list
```

- 今のバージョンと、profile の `Store paths`（`neovim-unwrapped-X.Y.Z`）を控える
- 作業ツリーが汚れていないか `git -C ~/dotfiles status --short` で確認する

### 2. 目標バージョンを含む nixpkgs revision を特定する

https://www.nixhub.io/packages/neovim を引く（WebFetch で可）。

- 目標バージョンの行の **nixpkgs commit hash（40 桁）** を取る
- 複数候補があれば新しい方を採る
- 目標バージョンをユーザーが指定していない場合は、ここで候補を出して確認を取る（勝手に最新へ飛ばさない）

### 3. flake.nix の rev を差し替える

`nvim/flake.nix` を編集する。

- `description = "neovim pinned to X.Y.Z";` のバージョン表記を更新
- `nixpkgs.url` の rev を手順 2 で取った hash に差し替え
- rev の特定方法を書いた既存コメントは残す（削らない）
- `packages.${system}.default = pkgs.neovim-unwrapped;` は触らない
  （wrapper 版を選ばない理由は flake.nix のコメント参照）

### 4. lock を追随させる

```bash
cd ~/dotfiles && nix flake lock ./nvim
git -C ~/dotfiles diff nvim/flake.lock
```

- `rev` / `narHash` / `lastModified` の 3 つが動いていれば正常
- **diff が出なかったら rev の差し替えに失敗している**（手順 3 に戻る）
- `warning: Git tree '/Users/shimonlil/dotfiles' is dirty` は commit 前なので正常。無視してよい

### 5. build してバージョンを実測する

```bash
"$(nix build ~/dotfiles/nvim --no-link --print-out-paths)"/bin/nvim --version | head -1
```

- 出力が目標バージョンと一致することを確認する
- ここで初めてビルドが走るので、初回は数分かかることがある
- 一致しなければ rev の選定ミス。手順 2 に戻る

### 6. commit する

`flake.nix` と `flake.lock` は **1 コミットにまとめる**（片方だけ commit すると
lock と宣言が食い違った状態が履歴に残る）。

メッセージは Why 中心。例:

```
bump neovim to 0.12.4

0.11.5 pin は Nix 化の移行期間の一時措置だったため、追随を再開する。
```

### 7. PR を出す

- PR 本文には **旧バージョン → 新バージョン** と、手順 5 で実測した `nvim --version` の出力を貼る
- `flake.lock` の diff だけでは neovim 単体のバージョン差は読めないため、この実測値が唯一の根拠になる

### 8. マージ後に反映する

profile の locked URL は `git+file:///Users/shimonlil/dotfiles?dir=nvim&ref=refs/heads/master`
なので、**ローカル master にマージが取り込まれるまで upgrade は拾わない**。

```bash
git -C ~/dotfiles switch master && git -C ~/dotfiles pull
nix profile upgrade nvim
nvim --version | head -1
```

### 9. 差分を確認する

```bash
nix profile diff-closures | tail -20
```

- クロージャに入った / 消えたパッケージとバージョン差が出る
- 履歴を見たい時は `nix profile history`

## ロールバック

**profile だけ戻す**（お試しを取り消す）:

```bash
nix profile rollback
nvim --version | head -1
```

**リポジトリごと戻す**: `flake.nix` の rev を旧 hash に戻して手順 4〜8 をやり直す。
profile の rollback だけでは宣言（flake.nix）が新しいバージョンのままなので、次の upgrade でまた上がる。

## メモ

- nix store が数 GB 消費するので、たまに `nix-collect-garbage -d` を打つ
  （ただし打つと `nix profile rollback` 先の世代も消える。ロールバックの目が無くなってから打つ）
- mason が取ってくる LSP バイナリは `~/.local/share/nvim/mason` 以下で Nix の管理外。
  バージョンを上げても mason 側は追随しない
- マイナーバージョンをまたぐ更新（0.11 → 0.12 等）では treesitter parser の ABI がズレうる。
  起動後に `:TSUpdate` を打って parser を再生成する
