local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

require('lspsaga').setup({
  ui = {
    border = 'rounded',
  }
})

keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)

keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")

keymap("n", "<C-r>", "<cmd>Lspsaga rename<CR>")

keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
