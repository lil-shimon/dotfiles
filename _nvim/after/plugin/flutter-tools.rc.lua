local status, flutter = pcall(require, 'flutter-tools')

if (not status) then return end

flutter.setup {
  ui = {
    border = 'rounded',
    notification_style = "native"
  },
  decorations = {
    statusline = {
      app_version = false,
      device = true
    },
  },
  widget_guides = {
    enabled = true
  },
  closing_tags = {
    highlight = "ErrorMsg",
    prefix = "//",
    enabled = true,
  },
  lsp = {
    color = {
      enabled = false,
      background = false,
      foreground = false,
      virtual_text = true,
      virtual_str = "■",
    },
    setttings = {
      showTodos = true,
      completeFunctionCalls = true,
      enableSnippets = true,
    },
  },
  debugger = {
    enabled = true,
    run_via_dap = false
  }
}
