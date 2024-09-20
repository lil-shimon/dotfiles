local hlchunk = require("hlchunk")

hlchunk.setup({
  chunk = {
    enable = true,
  },
  -- indent-lineのcolor設定
  --
  line_num = {
    enable = true,
    style = "#806d9c",
    use_treesitter = true,
  },

  -- blankの設定
  --
  indent = {
    enable = true,
    chars = {
      "│",
    },
  }
})
