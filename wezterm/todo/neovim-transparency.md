# Neovim 背景透過設定 - 調査メモ

## 目標
- Neovim の背景を透過にする
- Telescope, Notify などの floating window も透過にする
- WezTerm の blur 効果と組み合わせる

## 現在の環境
- WezTerm: `window_background_opacity = 0.6`, `macos_window_background_blur = 20` (設定済み)
- Neovim: `vscode.nvim` カラースキーム使用中
- プラグイン: `xiyaowong/transparent.nvim` を導入

## 試したこと

### 1. transparent.nvim の基本設定
**結果: NG (Telescope, Notify は透過されない)**

```lua
require("transparent").setup({
  groups = { 'Normal', 'NormalNC', ... },
  extra_groups = {
    "TelescopeNormal",
    "TelescopeBorder",
    ...
  },
})
```

### 2. enable = true オプション追加
**結果: NG**

- Issue #25 のコメントで `enable = true` が必要と記載あり
- しかしソースコード確認 → `enable` は setup のオプションではない
- `vim.g.transparent_enabled` で制御される（キャッシュまたは `:TransparentEnable` で設定）

### 3. lazy = false, priority = 1000 追加
**結果: NG**

```lua
{
  "xiyaowong/transparent.nvim",
  lazy = false,
  priority = 1000,
}
```

### 4. clear_prefix 関数使用
**結果: NG**

```lua
transparent.clear_prefix('Telescope')
transparent.clear_prefix('NvimTree')
transparent.clear_prefix('Noice')
transparent.clear_prefix('Notify')
```

README によると動的に生成されるハイライトグループを一括クリアできるはずだが、効果なし。

### 5. nvim-notify の background_colour 設定
**結果: NG (何度試しても効果なし)**

```lua
require("notify").setup({
  background_colour = "#000000",
})
```

警告は出続ける:
> Highlight group 'NotifyBackground' has no background highlight
> Defaulting to #000000

## GitHub 調査結果

### README の重要ポイント
1. lazy-loading を避ける
2. `vim.g.transparent_groups` で任意の場所からグループ追加可能
3. `clear_prefix` で動的ハイライトを一括クリア
4. **Floating window の透過は非推奨** (作者見解: すべてが混ざって見づらくなる)

### Issue #25 のコメント (2023/03)
- `:Telescope highlights` でハイライトグループ名を確認可能
- `SagaBorder`, `SagaNormal` なども追加が必要

## 未解決の問題
1. Telescope の floating window が黒背景のまま
2. nvim-notify の警告が消えない / 背景が黒のまま
3. clear_prefix が期待通りに動作しない原因不明

## 新しい発見 (2024-12-24)

### `:Telescope highlights` で grep した結果
ハイライトグループは**存在している**:

**Notify:**
- `NotifyTRACEBorder`, `NotifyTRACETitle`, `NotifyTRACEIcon`, `NotifyTRACEBody`

**Noice:** (大量)
- `NoicePopup`, `NoicePopupBorder`, `NoiceMini`
- `NoiceCmdlinePopup`, `NoiceCmdlinePopupBorder`
- `NoiceFormatLevelError`, `NoiceFormatLevelWarn`, `NoiceFormatLevelInfo`
- etc.

→ `clear_prefix` が効かない原因は「ハイライトグループが存在しない」ではない

### 考えられる原因
1. タイミング問題: p-transparent.lua 実行時にはまだ Noice/Notify が読み込まれていない？
2. vim.g.transparent_enabled が false?
3. clear_prefix の戻り値/動作確認が必要
4. **不明** - 全てのアプローチが失敗している

## 試したこと (追加)

### 6. vim.g.transparent_groups を使用
**結果: NG**

```lua
-- Noice
vim.g.transparent_groups = vim.list_extend(
  vim.g.transparent_groups or {},
  { "NoicePopup", "NoicePopupBorder", "NoiceMini", "NoiceCmdlinePopup", "NoiceCmdlinePopupBorder" }
)

-- Telescope
vim.g.transparent_groups = vim.list_extend(
  vim.g.transparent_groups or {},
  { "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal", "TelescopePromptBorder",
    "TelescopeResultsNormal", "TelescopeResultsBorder", "TelescopePreviewNormal", "TelescopePreviewBorder" }
)

-- Floating windows
vim.g.transparent_groups = vim.list_extend(
  vim.g.transparent_groups or {},
  { "NormalFloat", "FloatBorder", "Pmenu", "PmenuSel" }
)
```

README によると「どこでも何度でも実行可能」だが効果なし。

## デバッグ結果

### `:echo g:transparent_enabled`
**結果: `v:true`**
→ transparent.nvim は有効

### `:hi NoicePopup`
**結果: `NoicePopup xxx links to NormalFloat`**
→ NoicePopup は NormalFloat にリンクしている

### `:hi NormalFloat`
**結果: `NormalFloat xxx cleared`**
→ NormalFloat は**クリアされている** (背景なし)

### 重要な発見
- transparent.nvim は**正しく動作している**
- ハイライトグループは cleared になっている
- しかし黒背景が表示される → **別の原因がある**

### 考えられる原因
1. **winhl** - プラグインがウィンドウローカルでハイライトを上書きしている
2. **winblend** - 透過ブレンド設定の問題
3. floating window 作成時に別のハイライトが適用されている

### winblend テスト結果
- Telescope の `&winblend` デフォルト値: **5**
- `:set winblend=100` を実行 → **背後のテキストは透けるが、黒背景は残る**
- これは winblend が「Neovim内の他ウィンドウ」とブレンドしているだけ
- **ターミナルの背景とはブレンドされない** ← これが根本原因の可能性

### 結論: Neovim の既知の制限 (Issue #10685)

**根本原因**: Neovim は `winblend > 0` の場合、常に色をブレンドする。
`bg=NONE` でもブレンド計算が行われ、結果として黒背景になる。

bfredl (Neovim コア開発者) のコメント:
> "It is because with `blend>0` we always blend the color. We could add an edge case for `blend=100` to preserve the back layer background exactly (including `bg=NONE`)"

**現状**: Neovim 0.11.x では floating window のターミナル背景透過は**不可能**

**修正予定**: Issue #10685 は **Neovim 0.12** マイルストーンで 2025/07/10 に closed
→ Neovim 0.12 にアップグレードすれば解決する可能性あり

### ワークアラウンド (Issue コメントより)
- `winblend=0` に設定する（ただし透過なし）
- `NormalFloat` に `bg=NONE` 以外の色を設定する（黒以外の背景色）

## 次に試すべきこと
- [x] `:Telescope highlights` で実際のハイライトグループ名を確認 → 存在確認済み
- [x] `vim.g.transparent_groups` を使う方法を試す → NG
- [x] `:echo g:transparent_enabled` で状態確認 → v:true (有効)
- [x] `:hi NoicePopup` で現在のハイライト設定を確認 → links to NormalFloat
- [x] `:hi NormalFloat` で確認 → cleared (透過設定済み)
- [ ] floating window 内で `:echo &winhl` を確認
- [ ] Telescope/Noice の設定で winhl や winblend を調査
- [ ] on_clear コールバックで clear_prefix を実行する
- [ ] Telescope 自体の設定で背景を制御できるか調査
- [ ] transparent.nvim 以外のプラグインを検討

## 参考リンク
- https://github.com/xiyaowong/transparent.nvim
- https://github.com/xiyaowong/transparent.nvim/issues/25
- https://github.com/xiyaowong/transparent.nvim/issues/35
