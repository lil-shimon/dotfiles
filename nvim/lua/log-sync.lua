local log_daily_dir = vim.fn.expand("~/src/github.com/lil-shimon/log/log/daily")
local interval_ms = 10 * 60 * 1000

local last_synced_at = 0
local pending = false
local timer = nil

local function sync()
  pending = false
  last_synced_at = vim.uv.now()
  vim.system({ "log-daily-sync" }, { text = true }, function(result)
    if result.code ~= 0 then
      vim.schedule(function()
        vim.notify("log-daily-sync に失敗しました\n" .. result.stderr, vim.log.levels.WARN)
      end)
    end
  end)
end

local group = vim.api.nvim_create_augroup("LogDailySync", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = log_daily_dir .. "/*.md",
  callback = function()
    local elapsed = vim.uv.now() - last_synced_at
    if elapsed >= interval_ms then
      sync()
      return
    end
    pending = true
    if timer == nil or not timer:is_active() then
      timer = vim.defer_fn(function()
        if pending then
          sync()
        end
      end, interval_ms - elapsed)
    end
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  group = group,
  callback = function()
    if pending then
      vim.fn.jobstart({ "log-daily-sync" }, { detach = true })
    end
  end,
})
