require("mason").setup()

require('mason-tool-installer').setup {
  ensure_installed = {
    'eslint-lsp',
    'json-lsp',
    'prettierd',
    'stylua',
    'typescript-language-server'
  },
  auto_update = true,
}
