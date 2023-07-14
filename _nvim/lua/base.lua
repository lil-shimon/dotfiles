-- Created by Kenta Shimosawa

vim.cmd('autocmd!')

-- Set ColorScheme
-- Use the "tokyonight" color scheme
-- vim.cmd [[colorscheme tokyonight]]

-- Use the "gruvbox" color scheme
vim.cmd [[colorscheme gruvbox]]

vim.scriptencoding = 'utf-8'

vim.opt.encoding = 'utf-8'           -- Set the encoding of the file to UTF-8
vim.opt.fileencoding = 'utf-8'       -- Set the encoding of the current file to UTF-8
vim.opt.title = true                 -- Show the title of the window

vim.opt.autoindent = true            -- Enable automatic indentation
vim.opt.hlsearch = true              -- Highlight search results
vim.opt.backup = false               -- Disable backup files
vim.opt.showcmd = true               -- Show command in the status line
vim.opt.cmdheight = 1                -- Set the command-line height
vim.opt.laststatus = 2               -- Always show the status line
vim.opt.expandtab = true             -- Use spaces instead of tabs for indentation
vim.opt.scrolloff = 10               -- Keep at least 10 lines above/below the cursor when scrolling
vim.opt.shell = 'fish'               -- Set the shell used for executing commands
vim.opt.backupskip = '/tmp/*,/private/tmp/*'  -- Skip certain files/directories when making backups

vim.cmd [[ set sessionoptions-=blank]]  -- Remove the "blank" option from session options

vim.opt.inccommand = 'split'         -- Show a live preview of substitute command
vim.opt.ignorecase = true            -- Ignore case when searching
vim.opt.smarttab = true              -- Use smart tab behavior
vim.opt.breakindent = true           -- Preserve indentation on wrapped lines
vim.opt.shiftwidth = 2               -- Set the number of spaces for each indentation level to 2
vim.opt.tabstop = 2                  -- Set the number of spaces that a <Tab> counts for to 2
vim.opt.ai = true                    -- Enable auto-indentation
vim.opt.si = true                    -- Enable smart indent
vim.opt.wrap = false                 -- Disable line wrapping
vim.opt.backspace = 'start,eol,indent'  -- Allow backspace to delete across lines
vim.opt.path:append { '**' }         -- Search down into subfolders when finding files
vim.opt.wildignore:append { '*/node_modules/*', '*/vender/*' }  -- Ignore "node_modules" and "vender" directories

-- Undercurl
-- Set undercurl highlighting start and end sequences (example for iTerm2)
vim.cmd([[let &t_Cs = "\e[4:3m"]])  -- Start sequence for undercurl highlighting
vim.cmd([[let &t_Ce = "\e[4:0m"]])  -- End sequence for undercurl highlighting

-- Turn off paste mode when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = 'set nopaste'
})

vim.opt.formatoptions:append { 'r' }  -- Enable automatic line wrapping when using the "gq" command

vim.wo.number = true                 -- Show line numbers

vim.g.neovide_cursor_vfx_mode = "wireframe"  -- Set Neovide cursor visual effects mode to "wireframe"

