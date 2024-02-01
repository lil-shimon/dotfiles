local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "f", "<Plug>(eft-f)")
keymap("x", "f", "<Plug>(eft-f)")
keymap("o", "f", "<Plug>(eft-f)")
