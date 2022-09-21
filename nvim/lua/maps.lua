local keymap = vim.keymap

-- Save and Quit
keymap.set('n', '<Space>w', ':w<Return>')
keymap.set('n', '<Space>q', ':q<Return>')

-- Insert to Normal
keymap.set('i', 'jj', '<esc>')

-- New tab 
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true})
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
keymap.set('', '<Space>k', '<C-w>k')
keymap.set('', '<Space>j', '<C-w>j')
keymap.set('', '<Space>h', '<C-w>h')
keymap.set('', '<Space>l', '<C-w>l')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all ( just in case )
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

