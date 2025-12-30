-- GitHub今日のコミット数を取得（キャッシュ付き）
local commit_cache = { value = nil, updated_at = 0 }
local CACHE_TTL = 60 -- 60秒

local function get_today_commits()
  local now = os.time()
  if commit_cache.value and (now - commit_cache.updated_at) < CACHE_TTL then
    return commit_cache.value
  end

  local today = os.date("%Y-%m-%d")
  local cmd = 'gh api "/search/commits?q=author:@me+committer-date:' .. today .. '" --jq ".total_count" 2>/dev/null'
  local handle = io.popen(cmd)
  if handle then
    local result = handle:read("*a")
    handle:close()
    local count = result:gsub("%s+", "")
    if count ~= "" and tonumber(count) then
      commit_cache.value = " commits: " .. count
      commit_cache.updated_at = now
    end
  end

  return commit_cache.value or " commits: 0"
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
    lualine_x = { get_today_commits },
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
