local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
  -- ColorScheme solarized
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  -- Lualine
  use 'hoob3rt/lualine.nvim'
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- Vscode-like pictograms
  use 'onsails/lspkind-nvim'
  -- Nvim-cmp source for buffer words
  use 'hrsh7th/cmp-buffer'
  -- Nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-nvim-lsp'
  -- Completion
  use 'hrsh7th/nvim-cmp'
  -- Snippet
  use 'L3MON4D3/LuaSnip'
  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- autopair
  use 'windwp/nvim-autopairs'
  -- autotag
  use 'windwp/nvim-ts-autotag'
end)
