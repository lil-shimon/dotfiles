-- dropbar.nvim の設定
-- IDE風のブレッドクラムナビゲーション

local dropbar_api = require('dropbar.api')

-- キーマッピング
vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = "Dropbar picker" })

-- オプション設定（デフォルトで十分だが、必要に応じてカスタマイズ可能）
require('dropbar').setup({
  -- general = {
  --   enable = true,
  -- },
  -- icons = {
  --   enable = true, -- nvim-web-deviconsを使用
  -- },
  -- bar = {
  --   truncate = true, -- 長い場合は自動的に省略
  -- },
})

-- 必要に応じて追加のキーマッピング
-- vim.keymap.set('n', '<Leader>dp', dropbar_api.pick, { desc = "Dropbar pick" })
-- vim.keymap.set('n', '<Leader>dg', dropbar_api.goto_context_start, { desc = "Dropbar goto context start" })
-- vim.keymap.set('n', '<Leader>ds', dropbar_api.select_next_context, { desc = "Dropbar select next context" })