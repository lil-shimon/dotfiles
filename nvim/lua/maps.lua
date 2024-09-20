vim.g.mapleader = ' '
local keymap = vim.keymap

-- Save and Quit
keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

keymap.set('n', '<c-a>', 'ggVG')

keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')

keymap.set('n', "j", [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', "k", [[v:count?'k':'gk']], { noremap = true, expr = true })

-- Insert to Normal
keymap.set('i', 'jj', '<esc>')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Next tab
keymap.set('n', 'tn', ':tabnext<Return>', { silent = true })
-- Previous tab
keymap.set('n', 'tp', ':tabprevious<Return>', { silent = true })
-- Close tab
keymap.set('n', 'tq', ':tabclose<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
keymap.set('', ' j', '<C-w>j')
keymap.set('', ' h', '<C-w>h')
keymap.set('', ' l', '<C-w>l')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all ( just in case )
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Do not yank with x
keymap.set('n', 'x', '"_x')
