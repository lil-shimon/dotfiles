if vim.g.vscode == 1 then
  print('vscode')
else
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print('err')
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  -- エディタのビジュアルテーマ
  "sainnhe/everforest",
  "joshdick/onedark.vim",
  "folke/tokyonight.nvim",

  -- ステータスラインのカスタマイズ
  "nvim-lualine/lualine.nvim",

  -- LSP (Language Server Protocol) と関連ツールのインストールと管理
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  -- オートペアリング（括弧やクォートの自動補完）
  "windwp/nvim-autopairs",

  -- マルチカーソル機能
  "mg979/vim-visual-multi",

  -- テキスト選択の拡張機能
  "gcmt/wildfire.vim",

  -- テキスト周りの操作のカスタマイズ（サラウンド）
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- ファイル検索や様々なリスト表示のための拡張機能
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-lua/plenary.nvim",

  -- オートコンプリート機能
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "onsails/lspkind-nvim",
  "glepnir/lspsaga.nvim",

  -- スニペット機能
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- TypeScriptに特化したLSP機能
  "jose-elias-alvarez/typescript.nvim",
  "jose-elias-alvarez/null-ls.nvim",

  -- Treesitterベースの構文解析とハイライト
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  "nvim-treesitter/nvim-treesitter-context",
  "windwp/nvim-ts-autotag",
  "p00f/nvim-ts-rainbow",
  "axelvc/template-string.nvim",

  -- TODOコメントのハイライトと管理
  "folke/todo-comments.nvim",

  -- コメントの追加と管理
  "numToStr/Comment.nvim",

  -- ターミナルのトグル
  "akinsho/toggleterm.nvim",

  -- Git blame情報の表示
  "f-person/git-blame.nvim",

  -- GitHub Copilotの統合
  "github/copilot.vim",

  -- ファイルエクスプローラ
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  -- クリップボード履歴の管理
  "gbprod/yanky.nvim",

  -- フラッシュ機能（検索結果のハイライト）
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "F", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  -- ノーティフィケーションとUI改善
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "munifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -- カーソルがいる場所のスコープを矢印で示してくれる
  -- vscodeでいうところのindent raindowなどの機能も提供してくれる
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" }
  },
})

require('base')
require('maps')
require('p-mason')
require('p-null')
require('p-lsp')
require('p-lspsaga')
require('color')
require('text')
require('p-lualine')
require('p-telescope')
require('p-lspkind')
require('p-cmp')
require('p-snip')
require('p-treesitter')
require('other')
require('p-tree')
require('p-yanky')
require('p-comment')
require('p-noice')
require('p-hlchunk')

end
