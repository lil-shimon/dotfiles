local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print('err')
  vim.fn.system({ "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

if vim.g.vscode == 1 then
else
  require("lazy").setup({
    -- エディタのビジュアルテーマ
    "navarasu/onedark.nvim",
    "folke/tokyonight.nvim",
    "Mofiqul/vscode.nvim",
    "projekt0n/github-nvim-theme",
    "tiagovla/tokyodark.nvim",
    "olivercederborg/poimandres.nvim",
    "morhetz/gruvbox",
    "maxmx03/fluoromachine.nvim",
    "rebelot/kanagawa.nvim",

    -- https://github.com/Shatur/neovim-ayu
    "Shatur/neovim-ayu",

    -- Markdownレンダリング強化
    "MeanderingProgrammer/render-markdown.nvim",

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
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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

    -- TypeScriptに特化したLSP機能 (archived, using ts_ls LSP instead)
    "nvimtools/none-ls.nvim",

    -- Treesitterベースの構文解析とハイライト
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = {}
    },
    "nvim-treesitter/nvim-treesitter-context",
    -- https://github.com/windwp/nvim-ts-autotag
    -- tsxなどでタグを自動で追加する。必須級プラグイン
    "windwp/nvim-ts-autotag",
    "HiPhish/rainbow-delimiters.nvim",
    "axelvc/template-string.nvim",

    -- TODOコメントのハイライトと管理
    "folke/todo-comments.nvim",

    -- コメントの追加と管理
    "numToStr/Comment.nvim",

    -- Git blame情報の表示
    "f-person/git-blame.nvim",

    -- ファイルエクスプローラ
    "nvim-tree/nvim-web-devicons",

    -- クリップボード履歴の管理
    "gbprod/yanky.nvim",

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
    -- Show match number and index for searching
    {
      "kevinhwang91/nvim-hlslens",
      branch = "main",
      keys = { "*", "#", "n", "N" },
      config = function()
        require('hlslens').setup({
          calm_down = true,
          nearest_only = true,
          nearest_float_when = 'always'
        })
      end
    },
    -- Smooth scrolling
    {
      "gen740/SmoothCursor.nvim"
    },
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "haydenmeade/neotest-jest" -- 正しいJestアダプター
      }
    },
    {
      "LhKipp/nvim-nu",
      config = function()
        require('nu').setup({})
      end
    },
    {
      'lil-shimon/snapshot-runner',
      dependencies = {'vim-denops/denops.vim'}
    },
    -- Claude Code AI integration
    {
      'coder/claudecode.nvim',
      dependencies = { "folke/snacks.nvim" },
      event = "VeryLazy",
      opts = {
        -- alias ではなくフルパスを指定
        terminal_cmd = "/Users/shimonlil/.claude/local/claude",
        terminal = {
          snacks_win_opts = {
            position = "bottom",
            height = 0.4,
          },
        },
      },
      keys = {
        { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
        { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", desc = "Send selection", mode = "v" },
        { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current file" },
      },
    },
    -- GitHub Copilot AI integration
    -- Node.js 22
    --   {
    -- "github/copilot.vim"
    --   },
       {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
    opts = {},
      keys = {
        "<leader>a"
      },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
},
    -- TODO: 設定をする
    -- FYI: https://zenn.dev/layerx/articles/8c29b0367238b8#modes.nvim%3A-%E3%83%A2%E3%83%BC%E3%83%89%E3%81%AE%E6%83%85%E5%A0%B1%E3%81%AF%E7%8F%BE%E5%9C%A8%E8%A1%8C%E3%83%8F%E3%82%A4%E3%83%A9%E3%82%A4%E3%83%88%E3%81%AE%E8%89%B2%E3%81%A7%E8%A1%A8%E3%81%99
    {
      "mvllow/modes.nvim",
      tag = "v0.2.1",
      config = function()
        require("modes").setup()
      end
    },
    {
      "github/copilot.vim"
    },
    -- 背景透過プラグイン
    -- https://github.com/xiyaowong/transparent.nvim
    "xiyaowong/transparent.nvim",
    -- PRレビュープラグイン
    -- https://github.com/pwntester/octo.nvim
    {
      "pwntester/octo.nvim",
      cmd = "Octo",
      opts = {
        -- or "fzf-lua" or "snacks" or "default"
        picker = "telescope",
        -- bare Octo command opens picker of commands
        enable_builtin = true,
      },
      keys = {
        {
          ",oi",
          "<CMD>Octo issue list<CR>",
          desc = "List GitHub Issues",
        },
        {
          ",op",
          "<CMD>Octo pr list<CR>",
          desc = "List GitHub PullRequests",
        },
        {
          ",on",
          "<CMD>Octo notification list<CR>",
          desc = "List GitHub Notifications",
        },
      },
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        -- OR "ibhagwan/fzf-lua",
        -- OR "folke/snacks.nvim",
        "nvim-tree/nvim-web-devicons",
      },
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
  require('p-yanky')
  require('p-comment')
  require('p-noice')
  require('p-hlchunk')
  require('p-gitsigns')
  require('p-smoothcursor')
  require('p-neotest')
  require('p-git')
  require('p-colorizer')
  require('p-diagnostic')
  require('p-render-markdown')
  require('p-autotag')
  require("p-oil")
  require("p-transparent")
end
