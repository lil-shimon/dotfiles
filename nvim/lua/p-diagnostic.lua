-- 診断表示の設定
vim.diagnostic.config({
  -- 仮想テキスト（インライン表示）の設定
  virtual_text = {
    source = "always",  -- エラーソースを表示
    prefix = "●",       -- プレフィックスアイコン
    spacing = 2,        -- テキストとの間隔
  },
  -- フロートウィンドウの設定
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  -- サイン表示
  signs = true,
  -- テキストの下線
  underline = true,
  -- インサートモードでも更新
  update_in_insert = false,
  -- 重要度でソート
  severity_sort = true,
})

-- 診断のハイライトグループをカスタマイズ（オプション）
vim.cmd [[
  hi DiagnosticVirtualTextError guifg=#db4b4b gui=italic
  hi DiagnosticVirtualTextWarn guifg=#e0af68 gui=italic
  hi DiagnosticVirtualTextInfo guifg=#0db9d7 gui=italic
  hi DiagnosticVirtualTextHint guifg=#10B981 gui=italic
]]

