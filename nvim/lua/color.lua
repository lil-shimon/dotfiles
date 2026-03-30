-- Everforest setup (目に優しい緑系ダークテーマ)
vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1
vim.g.everforest_transparent_background = 1

vim.cmd.colorscheme('everforest')

-- Diff highlights（diffview用）
vim.api.nvim_create_autocmd('User', {
  pattern = 'DiffviewDiffBufWinEnter',
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, 'DiffviewDiffAdd',    { bg = '#3c4a3e' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = '#4c3743' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffChange', { bg = '#3d4841' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffText',   { bg = '#4a5a40' })
    end, 100)
  end,
})
