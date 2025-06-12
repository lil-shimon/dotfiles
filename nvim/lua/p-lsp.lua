local on_attach = function()
  local Format = vim.api.nvim_create_augroup("Format", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = Format,
    callback = function()
      local ts = require('typescript').actions
      ts.addMissingImports { sync = true }
      ts.organizeImports { sync = true }
      vim.lsp.buf.format()
    end,
  })
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = {
  capabilities = capabilities,
  group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
  on_attach = function()
    on_attach()
  end
}

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = {
    'lua_ls',
    'tsserver',
    'eslint',
    'jsonls'
  }
})

-- Manual LSP setup since mason-lspconfig handlers might not be working
local lspconfig = require('lspconfig')

-- Lua LSP
lspconfig.lua_ls.setup(vim.tbl_extend('force', lsp_config, {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}))

-- TypeScript LSP
require('typescript').setup({
  server = vim.tbl_extend('force', lsp_config, {
    on_attach = function()
      on_attach()
    end,
    init_options = {
      preferences = {
        jsxAttributeCompletionStyle = 'none'
      }
    }
  })
})

-- ESLint LSP
lspconfig.eslint.setup(lsp_config)

-- JSON LSP
lspconfig.jsonls.setup(lsp_config)
