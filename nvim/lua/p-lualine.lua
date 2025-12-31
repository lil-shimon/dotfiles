-- GitHub今日のコミット数・PR数を取得（キャッシュ付き）
local github_cache = { commits = 0, prs = 0, updated_at = 0 }
local CACHE_TTL = 60 -- 60秒

local function fetch_github_stats()
  local now = os.time()
  if (now - github_cache.updated_at) < CACHE_TTL then
    return
  end

  local today = os.date("%Y-%m-%d")

  -- コミット数を取得
  local commit_cmd = 'gh api "/search/commits?q=author:@me+committer-date:' .. today .. '" --jq ".total_count" 2>/dev/null'
  local handle = io.popen(commit_cmd)
  if handle then
    local result = handle:read("*a"):gsub("%s+", "")
    handle:close()
    if result ~= "" and tonumber(result) then
      github_cache.commits = tonumber(result)
    end
  end

  -- PR数を取得
  local pr_cmd = 'gh api "/search/issues?q=author:@me+type:pr+created:' .. today .. '" --jq ".total_count" 2>/dev/null'
  handle = io.popen(pr_cmd)
  if handle then
    local result = handle:read("*a"):gsub("%s+", "")
    handle:close()
    if result ~= "" and tonumber(result) then
      github_cache.prs = tonumber(result)
    end
  end

  github_cache.updated_at = now
end

local function get_today_commits()
  fetch_github_stats()
  return " commits: " .. github_cache.commits
end

local function get_today_prs()
  fetch_github_stats()
  return " PRs: " .. github_cache.prs
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'ayu',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'filename', path = 3 } },
    lualine_c = { 'diagnostics' },
    lualine_x = { get_today_prs, get_today_commits },
    lualine_y = { '' },
    lualine_z = { 'filetype' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
