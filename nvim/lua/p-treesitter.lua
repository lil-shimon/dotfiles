-- nvim-treesitter は main ブランチ。master (アーカイブ済み) の `nvim-treesitter.configs`
-- による一括設定は無くなり、パーサ導入とハイライト/インデントの有効化を分けて書く。
local nvim_treesitter = require("nvim-treesitter")

-- 導入するパーサ。導入済みのものは no-op なので毎回起動時に呼んで問題ない。
nvim_treesitter.install({
  "typescript", "javascript", "html", "css", "tsx", "lua", "rust", "json", "graphql", "regex",
  "prisma", "markdown", "markdown_inline",
  "go", "gomod", "gosum", "gowork",
  -- master 時代に auto_install で溜まっていた分。main に auto_install は無いので明示する。
  -- jsonc は main では非対応 (filetype jsonc は json パーサに解決される)。
  "bash", "csv", "dockerfile", "elixir", "git_config", "gitignore", "ini", "nix",
  "php", "python", "ruby", "scss", "toml", "vim", "vimdoc", "yaml", "zig",
})

-- main はハイライト/インデントを自動で有効化しない。
-- パーサが入っている filetype でのみ Neovim 側の機能を立ち上げる。
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang or not vim.tbl_contains(nvim_treesitter.get_installed("parsers"), lang) then
      return
    end

    -- ハイライト (Neovim 提供)
    vim.treesitter.start(args.buf)
    -- インデント (nvim-treesitter 提供、experimental)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

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
