local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- move to forward
keymap("n", "f", "<Plug>(eft-f)")
keymap("x", "f", "<Plug>(eft-f)")
keymap("o", "f", "<Plug>(eft-f)")

-- move to backward
keymap("n", "F", "<Plug>(eft-F)")
keymap("o", "F", "<Plug>(eft-F)")
keymap("x", "F", "<Plug>(eft-F)")
