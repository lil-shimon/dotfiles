local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- https://github.com/bkad/CamelCaseMotion
keymap("n", "w", "<Plug>CamelCaseMotion_w", opts)
keymap("n", "e", "<Plug>CamelCaseMotion_e", opts)
keymap("n", "b", "<Plug>CamelCaseMotion_b", opts)
keymap("n", "ge", "<Plug>CamelCaseMotion_ge", opts)
