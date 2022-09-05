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
end)
