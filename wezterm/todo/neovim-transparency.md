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

## 次に試すべきこと
- [x] `:Telescope highlights` で実際のハイライトグループ名を確認 → 存在確認済み
- [x] `vim.g.transparent_groups` を使う方法を試す → NG
- [ ] `:echo vim.g.transparent_enabled` で状態確認
- [ ] `:hi NoicePopup` で現在のハイライト設定を確認
- [ ] on_clear コールバックで clear_prefix を実行する
- [ ] 手動で `vim.api.nvim_set_hl(0, "NoicePopup", { bg = "NONE" })` を試す
- [ ] Telescope 自体の設定で背景を制御できるか調査
- [ ] カラースキーム (vscode.nvim) 側の transparent オプション確認
- [ ] transparent.nvim 以外のプラグインを検討

## 参考リンク
- https://github.com/xiyaowong/transparent.nvim
- https://github.com/xiyaowong/transparent.nvim/issues/25
- https://github.com/xiyaowong/transparent.nvim/issues/35
