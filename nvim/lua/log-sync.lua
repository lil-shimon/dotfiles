local log_daily_dir = vim.fn.expand("~/src/github.com/lil-shimon/log/log/daily")
local interval_ms = 10 * 60 * 1000

local pending = false
local timer = vim.uv.new_timer()

local function sync()
  pending = false
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
    pending = true
    timer:stop()
    timer:start(interval_ms, 0, vim.schedule_wrap(sync))
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
