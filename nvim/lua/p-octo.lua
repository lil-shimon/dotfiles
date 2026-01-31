-- Octo.nvim 設定
-- https://github.com/pwntester/octo.nvim

local M = {}

function M.setup(opts)
  require("octo").setup(opts)

  -- OctoバッファでTreesitterのmarkdownパーサーを使用 (render-markdown.nvim連携用)
  vim.treesitter.language.register("markdown", "octo")

  -- チームレビュワーをアサインするカスタムコマンド (Octo.nvim未サポートのため GitHub API を使用)
  vim.api.nvim_create_user_command("OctoTeamReviewer", function(cmd_opts)
    local team = cmd_opts.args
    -- org/team-name から team slug を取得
    local _, team_slug = team:match("([^/]+)/(.+)")
    if not team_slug then
      vim.notify("Invalid format. Use: Org/team-name", vim.log.levels.ERROR)
      return
    end

    -- Octoバッファからrepoとpr_numberを取得 (例: octo://Findy/Ifrit/pull/12171)
    local bufname = vim.api.nvim_buf_get_name(0)
    local owner, repo, pr_number = bufname:match("octo://([^/]+)/([^/]+)/pull/(%d+)")
    if not pr_number then
      vim.notify("Not in Octo PR buffer: " .. bufname, vim.log.levels.ERROR)
      return
    end

    -- GitHub APIでチームレビュワーを追加
    local cmd = string.format(
      'gh api repos/%s/%s/pulls/%s/requested_reviewers -f "team_reviewers[]=%s"',
      owner,
      repo,
      pr_number,
      team_slug
    )
    local result = vim.fn.system(cmd)
    if vim.v.shell_error == 0 then
      vim.notify("Team reviewer added: " .. team, vim.log.levels.INFO)
    else
      vim.notify("Failed to add team reviewer: " .. result, vim.log.levels.ERROR)
    end
  end, { nargs = 1, desc = "Add team reviewer to PR (e.g., Org/team-name)" })
end

return M
