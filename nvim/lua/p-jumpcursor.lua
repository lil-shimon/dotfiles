local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "ff", "<Plug>(jumpcursor-jump)", opts)
