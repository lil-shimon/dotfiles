if !exist('g:lsconfig')
  finish
endif

lua << EOF
local nvim_lsp = require('lsconfig')
local protocol =require('vim.lsp.protocol')

local on_attach = function(client, bnfnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Mappings
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gd', '<Cmt>lua vim.lsp.buf.definition()<CR>', opts)

end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = {"typescript", "typescriptreact", "typescript.tsx"}
  }
EOF

