require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "html", "css", "tsx", "lua", "rust", "json", "graphql", "regex",
    "prisma", "markdown",
    "markdown_inline" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {}
  },
  -- autotag moved to p-autotag.lua (new API)
  -- rainbow moved to separate plugin (rainbow-delimiters.nvim)
  -- context_commentstring is built-in to Neovim 0.10+ (no longer needed)
}

require('template-string').setup({
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' }, -- filetypes where the plugin is active
  jsx_brackets = true,                                                                        -- must add brackets to jsx attributes
  remove_template_string = false,                                                             -- remove backticks when there are no template string
  restore_quotes = {
    -- quotes used when "remove_template_string" option is enabled
    normal = [[']],
    jsx = [["]],
  },
})

-- Add error handling for treesitter-context
local status_ok, treesitter_context = pcall(require, 'treesitter-context')
if status_ok then
  treesitter_context.setup {
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
    on_attach = nil,
  }
end
