local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettierd.with({
      -- 設定を追加しないのでプロジェクトのprettier設定を参照する
    }),
    formatting.stylua,
  },
})

-- Luaファイル保存時に自動フォーマット
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
