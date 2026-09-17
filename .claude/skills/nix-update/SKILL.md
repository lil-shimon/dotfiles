---
name: nix-update
description: >
  Nix flake (nvim/flake.nix) で pin している neovim のバージョンを上げる手順スキル。
  「neovim のバージョン上げて」「nvim を X.Y.Z にして」「flake 更新して」「/nix-update」
  などのトリガーで起動する。
  nix flake update で lock を nixpkgs-unstable の先端へ進める → nix eval でバージョン差を確認 →
  build でバージョンを実測 → commit / PR → マージ後に nix profile upgrade、
  という一連の流れを実行する。
---

# nix-update

## 前提

- 対象リポジトリは `~/dotfiles`
- `nvim/flake.nix` の `nixpkgs.url` は **branch 参照**（`github:NixOS/nixpkgs/nixpkgs-unstable`）
- 実体の固定は `nvim/flake.lock` が持つ rev。バージョンを動かすのは lock の更新
- neovim は `nix profile` 経由でインストール済み（profile 上の element 名は `nvim`）

## 最重要の前提: 更新は先端へ飛ぶ

`nix flake update` は lock を nixpkgs-unstable の **その時点の先端** へ進める。
目標バージョンを選べないので、**neovim が意図せず動く / 動かない**ことがある。
手順 3 の `nix eval` でバージョン差を必ず確認する。

先端より古いバージョンに固定したい時は「特定バージョンに固定する（退避手段）」を使う。

## 手順

### 1. 現状を記録する

```bash
nvim --version | head -1
nix profile list
```

- 今のバージョンと、profile の `Store paths`（`neovim-unwrapped-X.Y.Z`）を控える
- 作業ツリーが汚れていないか `git -C ~/dotfiles status --short` で確認する

### 2. lock を先端へ進める

```bash
cd ~/dotfiles && nix flake update --flake ./nvim
git -C ~/dotfiles diff nvim/flake.lock
```

- `rev` / `narHash` / `lastModified` の 3 つが動いていれば正常
- **diff が出なければ先端が前回から動いていない**。更新するものは無いのでここで止める
- `warning: Git tree '/Users/shimonlil/dotfiles' is dirty` は commit 前なので正常。無視してよい

### 3. バージョン差を確認する

```bash
nix eval --raw "git+file://$HOME/dotfiles?dir=nvim&rev=$(git -C ~/dotfiles rev-parse HEAD)#default.version"; echo
nix eval --raw ~/dotfiles/nvim#default.version; echo
```

- 1 行目が commit 済みの旧 lock、2 行目が作業ツリーの新 lock の neovim バージョン。ビルド不要で即返る
- **バージョンが動かなかった場合**、neovim 以外の nixpkgs だけが進んでいる。上げる意味が無いので
  lock を戻して止める（`git -C ~/dotfiles checkout nvim/flake.lock`）
- ユーザーが目標バージョンを指定していて先端と一致しない場合は「特定バージョンに固定する（退避手段）」へ

### 4. build してバージョンを実測する

```bash
"$(nix build ~/dotfiles/nvim --no-link --print-out-paths)"/bin/nvim --version | head -1
```

- 出力が目標バージョンと一致することを確認する
- ここで初めてビルドが走るので、初回は数分かかることがある
- 手順 3 の `nix eval` の値と一致しなければ lock の更新に失敗している。手順 2 に戻る

### 5. 機能を検証する

`nvim --version` が通ることは「動く」証拠にならない。バージョンの載せ替えで壊れるのは
treesitter parser のコンパイル・mason の新規取得・ネイティブビルドを伴うプラグインで、
どれも通常の編集操作では踏まない経路にある。明示的に叩いて確認する。

**マイナーバージョンをまたぐ場合（0.11 → 0.12 等）は隔離環境で行う。**
既存の `~/.local/share/nvim` を共有すると treesitter parser が新 ABI で焼き直され、
lazy の state も書き換わる。この変更は `nix profile rollback` では戻らない（「ロールバック」参照）。

```bash
NVIM_BIN="$(nix build ~/dotfiles/nvim --no-link --print-out-paths)/bin/nvim"
cp -R ~/dotfiles/nvim ~/.config/nvim-nix
NVIM_APPNAME=nvim-nix "$NVIM_BIN"
```

**config は symlink ではなくコピーにする。** lazy.nvim のロックファイルは
`stdpath("config")/lazy-lock.json`、つまり `~/dotfiles/nvim/lazy-lock.json` そのものなので、
symlink で共有すると隔離環境の `:Lazy sync` がリポジトリの lock を書き換えてしまう。
コピーなら書き込みは `~/.config/nvim-nix/` に閉じ、リポジトリは無傷のまま。

データは `~/.local/share/nvim-nix/` 以下に分離されるので既存環境も無傷。
背景と詳細は Issue #59 の「後続 Issue（0.12 系へのアップグレード）に引き継ぐ内容」を参照。

起動したら以下を実行する。

- `:checkhealth` — エラーが無いこと（provider 系の warn は unwrapped を選んだ結果なので許容）
- `:Lazy restore` — lock 固定のままプラグインの取得が通る
- `:TSInstall <未導入の言語>` — parser が新 ABI でコンパイルできる
- `:MasonInstall <未導入の LSP>` — 新規取得して実際に起動する
- `:Lazy build telescope-fzf-native.nvim` — ネイティブビルドを伴うプラグインが通る

**`:Lazy sync` ではなく `:Lazy restore` を打つ。** sync はプラグインを最新へ動かすため、
「neovim を上げた結果」と「プラグインを上げた結果」が混ざって切り分けできなくなる。
検証したいのは neovim の載せ替えだけなので、プラグインは lock のバージョンに固定する。

検証が終わったら片付ける。

```bash
rm -rf ~/.config/nvim-nix
rm -rf ~/.local/share/nvim-nix ~/.local/state/nvim-nix ~/.cache/nvim-nix
```

エラーが出た時に「新バージョン固有か」を切り分けたい場合は、**旧バージョンのバイナリで
同じことを別の APPNAME でもう一度回す**。両方で出るなら neovim の載せ替えとは無関係。

```bash
# 手順 1 の `nix profile list` で控えた Store paths がそのまま旧バイナリ
OLD_BIN="/nix/store/<旧 hash>-neovim-unwrapped-<旧バージョン>/bin/nvim"
cp -R ~/dotfiles/nvim ~/.config/nvim-old
NVIM_APPNAME=nvim-old "$OLD_BIN"
```

パッチバージョンのみの更新（0.11.5 → 0.11.6 等）は隔離を省略してよい。
その場合も上のチェック自体は手順 8 の後に本番環境で行う。

### 6. commit する

差分は `nvim/flake.lock` だけになる（`flake.nix` は branch 参照のまま触らない）。

メッセージは Why 中心。例:

```
bump neovim to 0.12.4

0.11.5 pin は Nix 化の移行期間の一時措置だったため、追随を再開する。
```

### 7. PR を出す

- PR 本文には **旧バージョン → 新バージョン** と、手順 4 で実測した `nvim --version` の出力を貼る
- `flake.lock` の diff だけでは neovim 単体のバージョン差は読めないため、この実測値が唯一の根拠になる
- 手順 5 で叩いたチェック項目と結果も併記する（隔離環境で行ったか本番で行ったかも書く）

### 8. マージ後に反映する

profile の locked URL は `git+file:///Users/shimonlil/dotfiles?dir=nvim&ref=refs/heads/master`
なので、**ローカル master にマージが取り込まれるまで upgrade は拾わない**。

```bash
git -C ~/dotfiles switch master && git -C ~/dotfiles pull
nix profile upgrade nvim
nvim --version | head -1
```

- 手順 5 を隔離環境で行った場合、本番の `~/.local/share/nvim` はまだ旧バージョンのまま。
  起動して treesitter のハイライトが崩れていたら `:TSUpdate` で parser を焼き直す

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

**リポジトリごと戻す**: `flake.lock` を旧 rev に戻す PR を出し、手順 4〜8 をやり直す。
profile の rollback だけでは lock が新しいバージョンのままなので、次の upgrade でまた上がる。

**データディレクトリは戻らない**: 上のどちらもバイナリと宣言を戻すだけで、
`~/.local/share/nvim` は戻らない。新しいバージョンで一度でも起動していれば、
treesitter parser は新 ABI で焼き直され lazy の state も書き換わっている。
旧バージョンに戻した後にハイライトが壊れていたら `:TSUpdate` で焼き直す。
手順 5 で隔離環境を挟むのは、この非対称性を踏まないため。

## 特定バージョンに固定する（退避手段）

先端より古いバージョンに固定したい時（ダウングレード、先端で壊れた時の退避）だけ使う。

1. https://www.nixhub.io/packages/neovim で目標バージョンを含む **nixpkgs commit hash（40 桁）** を取る
2. lock だけをその rev に固定する

```bash
cd ~/dotfiles && nix flake lock ./nvim --override-input nixpkgs github:NixOS/nixpkgs/<rev>
nix eval --raw ~/dotfiles/nvim#default.version; echo
```

3. 以降は手順 4 から同じ

`flake.nix` の branch 参照は変えない。次に `nix flake update` を打つと先端へ戻る。

## メモ

- nix store が数 GB 消費するので、たまに `nix-collect-garbage -d` を打つ
  （ただし打つと `nix profile rollback` 先の世代も消える。ロールバックの目が無くなってから打つ）
- mason が取ってくる LSP バイナリは `~/.local/share/nvim/mason` 以下で Nix の管理外。
  バージョンを上げても mason 側は追随しない
- マイナーバージョンをまたぐ更新（0.11 → 0.12 等）では treesitter parser の ABI がズレうる。
  起動後に `:TSUpdate` を打って parser を再生成する
