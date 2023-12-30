local hlchunk = require("hlchunk")

hlchunk.setup({
  -- indent-lineのcolor設定
  --
  line_num = {
    style = "#806d9c",
  },

  -- blankの設定
  --
  indent = {
    chars = {
      "․",
    },
    style = {
      { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), "" },
      "#806d9c",
      "#c06f98",
    },
  }
  -- indentのbackground colorが薄く白くなる設定
  -- blank = {
  --   enable = true,
  --   chars = {
  --     " ",
  --   },
  --   style = {
  --     { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("cursorline")), "bg", "gui") },
  --     { bg = "",                                                                         fg = "" },
  --   },
  -- }
})
