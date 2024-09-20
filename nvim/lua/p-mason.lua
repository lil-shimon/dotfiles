require("mason").setup()

require('mason-tool-installer').setup {
  ensure_installed = {
    'eslint-lsp',
    'json-lsp',
    'prettierd',
    'stylua',
    'typescript-language-server',
    -- アップデート時にlockFileが存在しているのでアプデできないエラーになったら、/User/<username>/.local/share/nvim/mason/staging/内を確認する
    'graphql-language-service-cli',
    'lua-language-server'
  },
  auto_update = true,
}
