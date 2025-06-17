local on_attach = function(client, bufnr)
  -- TypeScript specific actions (using native LSP commands)
  if client.name == "ts_ls" then
    local Format = vim.api.nvim_create_augroup("Format", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = Format,
      buffer = bufnr,
      callback = function()
        -- Use native LSP commands instead of typescript.nvim
        vim.lsp.buf.code_action({
          context = { only = { "source.addMissingImports" } },
          apply = true,
        })
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
        vim.lsp.buf.format()
      end,
    })
  end
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = {
  capabilities = capabilities,
  group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
  on_attach = on_attach
}

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = {
    'lua_ls',
    'ts_ls',  -- Updated from deprecated 'tsserver'
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

-- TypeScript LSP (using native ts_ls instead of typescript.nvim)
lspconfig.ts_ls.setup(vim.tbl_extend('force', lsp_config, {
  init_options = {
    preferences = {
      jsxAttributeCompletionStyle = 'none'
    }
  }
}))

-- ESLint LSP
lspconfig.eslint.setup(lsp_config)

-- JSON LSP
lspconfig.jsonls.setup(lsp_config)
