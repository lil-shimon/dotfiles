require('base')
require('highlights')
require('maps')
require('plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"

if is_mac then
  -- sync vim yank and os paste
  require('macos')
end
