local status, git = pcall(require, 'git')
if (not status) then return end

-- Git config
--
-- Keymap
-- Normal Mode
-- Space b to open blame window
-- C-b to open git on browser
git.setup {
  keymaps = {
    blame = " b",
    browse = "<C-b>"
  }
}
