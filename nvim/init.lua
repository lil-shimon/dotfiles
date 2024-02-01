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
    "Mofiqul/vscode.nvim",

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
    -- "mg979/vim-visual-multi",
    --
    -- -- テキスト選択の拡張機能
    -- "gcmt/wildfire.vim",

    -- テキスト周りの操作のカスタマイズ（サラウンド）
    -- TODO: 使えるようにする
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

    -- lspのUIを拡張
    -- hover_docやshow_line_diagnosticなどの機能を提供してくれる
    "glepnir/lspsaga.nvim",

    -- スニペット機能
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp"
    },

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
    -- {
    --   "folke/flash.nvim",
    --   event = "VeryLazy",
    --   opts = {},
    --   keys = {
    --     { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
    --     { "F", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --   },
    -- },

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

    -- tablineを強力に拡張してくれる
    {
      "romgrk/barbar.nvim"
    },

    -- :Git〇〇でGitの操作を可能にする
    -- TODO: 挙動の確認ができていない. diffなどができない.
    {
      "dinhhuy258/git.nvim"
    },

    -- ファイルの変更箇所をおしゃれに表示
    {
      "lewis6991/gitsigns.nvim"
    },

    -- カラーコードの色を再現
    {
      'norcalli/nvim-colorizer.lua'
    },

    -- git diffをリッチに表示
    {
      "sindrets/diffview.nvim"
    },
    -- テキスト移動をより便利に
    -- 文字の先頭にいく(fで設定)
    {
      "hrsh7th/vim-eft",
    },
    -- テキスト移動をより便利に
    -- 画面上全体から移動できる(ffで設定)
    {
      "skanehira/jumpcursor.vim",
    },
    -- Git操作を簡単にする
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required by neogit
        "sindrets/diffview.nvim",        -- optional - Diff integration

        "nvim-telescope/telescope.nvim", -- optional
      },
      config = true
    },
    -- 移動で記号などを無視してアルファベットの頭に移動できる
    {
      "kana/vim-smartword",
    },
    -- camelCaseとかsnake_caseとかの単語の境界に移動できるプラグイン
    {
      "bkad/CamelCaseMotion",
    },
    -- denops
    {
      "vim-denops/denops.vim",
    },
    -- ローマ字で日本語を検索できるプラグイン
    {
      "lambdalisue/kensaku.vim",
      dependencies = {
        "vim-denops/denops.vim",
      }
    },
    -- 下記が機能有効化のためのプラグイン
    -- nihon -> 日本
    {
      "lambdalisue/kensaku-search.vim",
      config = function()
        vim.keymap.set('c', "<CR>", '<Plug>(kensaku-search-replace)<CR>')
      end,
      dependencies = {
        "lambdalisue/kensaku.vim",
      }
    },
    -- インサートモードを便利にしてくれるプラグイン
    -- 公式のREADMEの動画を参照
    -- あまり便利度がわかっていない
    {
      "hrsh7th/nvim-insx",
    }
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
  -- TODO: fix cannot find p-hlchunk
  -- require('p-hlchunk')
  require('p-jumpcursor')
  require('p-smartword')
  require('p-camel')
  require('p-insx')
  require('p-eft')
end
