local on_attach = function(client, bufnr)
  -- TypeScript specific actions (using native LSP commands)
  if client.name == "ts_ls" then
    local Format = vim.api.nvim_create_augroup("Format", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = Format,
      buffer = bufnr,
      callback = function()
        -- フォーマットのみ実行（コードアクションは手動で実行）
        vim.lsp.buf.format()
      end,
    })
  end
end

-- 全サーバー共通のデフォルト設定 (旧: require('lspconfig').xxx.setup(lsp_config))
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = on_attach,
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls", -- Updated from deprecated 'tsserver'
    "eslint",
    "jsonls",
    "cssls", -- CSS language server
  },
})

-- Lua LSP
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- TypeScript LSP (using native ts_ls instead of typescript.nvim)
vim.lsp.config("ts_ls", {
  init_options = {
    preferences = {
      jsxAttributeCompletionStyle = "none",
    },
  },
})

-- CSS LSP
vim.lsp.config("cssls", {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore", -- CSS Modules対応
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
})

vim.lsp.enable({ "lua_ls", "ts_ls", "eslint", "jsonls", "cssls", "typos_lsp" })
