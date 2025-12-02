-- render-markdown.nvim の設定
-- Markdownファイルの表示を強化するプラグイン

require('render-markdown').setup({
  -- マークダウンレンダリングを有効にする
  enabled = true,
  
  -- ファイルタイプの設定
  file_types = { 'markdown' },
  
  -- レンダリングする要素の設定
  render = {
    min_width = 100,
    left_pad = 0,
    right_pad = 0,
  },
  
  -- 見出しの設定
  heading = {
    enabled = true,
    sign = true,
    position = 'overlay',
    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    signs = { '󰫎 ' },
    width = 'full',
    left_pad = 0,
    right_pad = 0,
    min_width = 0,
    border = false,
    border_virtual = false,
    border_prefix = false,
    above = '▄',
    below = '▀',
    backgrounds = {
      'RenderMarkdownH1Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH3Bg',
      'RenderMarkdownH4Bg',
      'RenderMarkdownH5Bg',
      'RenderMarkdownH6Bg',
    },
    foregrounds = {
      'RenderMarkdownH1',
      'RenderMarkdownH2',
      'RenderMarkdownH3',
      'RenderMarkdownH4',
      'RenderMarkdownH5',
      'RenderMarkdownH6',
    },
  },
  
  -- コードブロックの設定
  code = {
    enabled = true,
    sign = true,
    style = 'full',
    position = 'left',
    language_pad = 0,
    disable_background = { 'diff' },
    width = 'full',
    left_pad = 0,
    right_pad = 0,
    min_width = 0,
    border = 'thin',
    above = '▄',
    below = '▀',
    highlight = 'RenderMarkdownCode',
    highlight_inline = 'RenderMarkdownCodeInline',
  },
  
  -- リストの設定
  bullet = {
    enabled = true,
    icons = { '●', '○', '◆', '◇' },
    left_pad = 0,
    right_pad = 0,
    highlight = 'RenderMarkdownBullet',
  },
  
  -- チェックボックスの設定
  checkbox = {
    enabled = true,
    unchecked = {
      icon = '󰄱 ',
      highlight = 'RenderMarkdownUnchecked',
    },
    checked = {
      icon = '󰱒 ',
      highlight = 'RenderMarkdownChecked',
    },
    custom = {
      todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
    },
  },
  
  -- 引用の設定
  quote = {
    enabled = true,
    icon = '▋',
    repeat_linebreak = false,
    highlight = 'RenderMarkdownQuote',
  },
  
  -- テーブルの設定
  pipe_table = {
    enabled = true,
    preset = 'none',
    style = 'full',
    cell = 'padded',
    min_width = 0,
    border = {
      '┌', '┬', '┐',
      '├', '┼', '┤',
      '└', '┴', '┘',
      '│', '─',
    },
    alignment_indicator = '━',
    head = 'RenderMarkdownTableHead',
    row = 'RenderMarkdownTableRow',
    filler = 'RenderMarkdownTableFill',
  },
  
  -- リンクの設定
  link = {
    enabled = true,
    image = '󰥶 ',
    email = '󰀓 ',
    hyperlink = '󰌹 ',
    highlight = 'RenderMarkdownLink',
    wiki = { icon = '󱗖 ', highlight = 'RenderMarkdownWikiLink' },
    custom = {
      web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
    },
  },
  
  -- サインの設定
  sign = {
    enabled = true,
    highlight = 'RenderMarkdownSign',
  },
  
  -- インデントの設定
  indent = {
    enabled = false,
    per_level = 2,
    skip_level = 1,
    skip_heading = false,
  },
  
  -- ウィンドウオプションの設定
  win_options = {
    conceallevel = {
      default = vim.api.nvim_get_option_value('conceallevel', {}),
      rendered = 3,
    },
    concealcursor = {
      default = vim.api.nvim_get_option_value('concealcursor', {}),
      rendered = '',
    },
  },
})