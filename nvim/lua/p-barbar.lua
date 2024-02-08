local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', 'ap', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', 'an', '<Cmd>BufferNext<CR>', opts)
keymap('n', 'Ap', '<Cmd>BufferPin<CR>', opts)
keymap('n', 'bd', '<Cmd>BufferClose<CR>', opts)
