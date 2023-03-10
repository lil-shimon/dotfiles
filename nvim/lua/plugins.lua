local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd[[packadd packer.nvim]]

packer.startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- ColorScheme solarized
  -- use {
  --  'svrana/neosolarized.nvim',
  --  requires = { 'tjdevries/colorbuddy.nvim' }
  --}

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
  -- Autopair
  use 'windwp/nvim-autopairs'
  -- Autotag
  use 'windwp/nvim-ts-autotag'
  -- Common utilities
  use 'nvim-lua/plenary.nvim'
  -- Telescope for search file
  use 'nvim-telescope/telescope.nvim'
  -- Telescope file browser
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- File icons
  use 'kyazdani42/nvim-web-devicons'
  -- Custom buffer line
  use 'akinsho/nvim-bufferline.lua'
  -- Flutter
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- Colorizr
  use 'norcalli/nvim-colorizer.lua'
  -- Lspsaga
  use 'glepnir/lspsaga.nvim'
  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via lua
  use 'jose-elias-alvarez/null-ls.nvim'
  -- Prettier
  use 'MunifTanjim/prettier.nvim'
  -- Gitsigns
  use 'lewis6991/gitsigns.nvim'
  -- Git blame and browse
  use 'dinhhuy258/git.nvim'
  -- For help to configure lsp
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- Darcula colorscheme
  use 'doums/darcula'
  use 'folke/tokyonight.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  -- Terminal
  use "akinsho/toggleterm.nvim"
  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
end)
