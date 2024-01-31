local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

require('lspsaga').setup({
  ui = {
    border = 'rounded',
  }
})

-- hover_doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

-- エラーを表示
-- TODO: エラーになるので、確認する
-- コマンド直打ちでは機能している
keymap("n", "D", "<cmd>Lspsaga show_line_diagnostic<CR>", opts)
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)

-- コードアクション
keymap("n", "V", "<cmd>Lspsaga code_action<CR>", opts)

keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
keymap("n", "pd", "<cmd>Lspsaga peek_definition<CR>", opts)

keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

keymap("n", "<C-r>", "<cmd>Lspsaga rename<CR>", opts)

keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
