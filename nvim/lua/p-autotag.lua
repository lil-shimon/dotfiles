require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    -- Auto close tag
    enable_close = true,
    -- Auto rename pairs of tags
    enable_rename = true,
    -- Auto close on trailing </
    enable_close_on_slash = false
  }
})
