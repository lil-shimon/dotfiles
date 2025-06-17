require('gitlinker').setup({
  opts = {
    -- ビジュアル選択した行でURLを開く
    remote = nil, -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- callback for what to do with the url
    action_callback = require("gitlinker.actions").copy_to_clipboard,
    -- print the url after performing the action
    print_url = true,
  },
  callbacks = {
    ["github.com"] = require("gitlinker.hosts").get_github_type_url,
    ["gitlab.com"] = require("gitlinker.hosts").get_gitlab_type_url,
    ["try.gitea.io"] = require("gitlinker.hosts").get_gitea_type_url,
    ["codeberg.org"] = require("gitlinker.hosts").get_gitea_type_url,
    ["bitbucket.org"] = require("gitlinker.hosts").get_bitbucket_type_url,
    ["try.gogs.io"] = require("gitlinker.hosts").get_gogs_type_url,
    ["git.sr.ht"] = require("gitlinker.hosts").get_srht_type_url,
    ["git.launchpad.net"] = require("gitlinker.hosts").get_launchpad_type_url,
    ["repo.or.cz"] = require("gitlinker.hosts").get_repoorcz_type_url,
    ["git.kernel.org"] = require("gitlinker.hosts").get_cgit_type_url,
    ["git.savannah.gnu.org"] = require("gitlinker.hosts").get_cgit_type_url,
  },
})

-- キーマップ設定
local opts = { noremap = true, silent = true }

-- 現在の行でGitHubページを開く
vim.keymap.set('n', '<leader>gy', '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', 
  vim.tbl_extend("force", opts, { desc = "Copy GitHub URL for current line" }))

-- ビジュアル選択した範囲でGitHubページを開く
vim.keymap.set('v', '<leader>gy', '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', 
  vim.tbl_extend("force", opts, { desc = "Copy GitHub URL for selected range" }))

-- ブラウザで直接開く版
vim.keymap.set('n', '<leader>gY', function()
  require("gitlinker").get_buf_range_url("n", {
    action_callback = require("gitlinker.actions").open_in_browser
  })
end, vim.tbl_extend("force", opts, { desc = "Open GitHub URL in browser" }))

vim.keymap.set('v', '<leader>gY', function()
  require("gitlinker").get_buf_range_url("v", {
    action_callback = require("gitlinker.actions").open_in_browser
  })
end, vim.tbl_extend("force", opts, { desc = "Open GitHub URL in browser" }))