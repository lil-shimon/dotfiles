local neogit = require('neogit')

neogit.setup({
  kind = "tab",
  disable_commit_confirmation = false,
  disable_insert_on_commit = false,
  integrations = {
    diffview = true,
    telescope = true,
  },
})

-- キーマップ設定
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Neogit メイン画面を開く (Git status)
keymap('n', '<leader>gg', '<cmd>Neogit<cr>', opts)