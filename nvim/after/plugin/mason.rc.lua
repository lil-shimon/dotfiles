local status, mason = pcall(require, 'mason')
local status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status) then return end
if (not status2) then return end

-- Mason config
-- Commands
-- :Mason to open dashboard
mason.setup {}
lspconfig.setup {
  ensure_installed = { 'tailwindcss', 'pylsp', 'pyright', 'intelephense' }
}

require 'lspconfig'.tailwindcss.setup {}
require 'lspconfig'.phpactor.setup {}
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.pylsp.setup {}
require 'lspconfig'.intelephense.setup {}
