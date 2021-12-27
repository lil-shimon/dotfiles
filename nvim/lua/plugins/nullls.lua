use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }

local nullls = require "null-ls"

nullls.config {
  sources = {
    nullls.builtins.formatting.prettier,
  },
}
require("lspconfig")["null-ls"].setup {}
