local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettierd.with({
      -- 設定を追加しないのでプロジェクトのprettier設定を参照する
    }),
  },
})
