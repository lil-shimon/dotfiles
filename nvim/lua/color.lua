-- Tokyo Night setup (目に優しいダークテーマ)
require('tokyonight').setup({
  style = "night", -- night / storm / day / moon
  transparent = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = false },
    variables = { italic = true },
  },
})

vim.cmd.colorscheme('tokyonight')

-- Diff highlights（diffview用）
vim.api.nvim_create_autocmd('User', {
  pattern = 'DiffviewDiffBufWinEnter',
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, 'DiffviewDiffAdd', { bg = '#2a5834' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = '#6b2c3a' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffChange', { bg = '#3a3a2d' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffText', { bg = '#5a5a3d' })
      print('Diff highlights applied')
    end, 100)
  end,
})
