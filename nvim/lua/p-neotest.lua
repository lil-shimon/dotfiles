-- jest.config.tsを取得する
local function getTsConfigPath(file)
  local matchedPath

  if string.find(file, "feature-") then
    -- feature-から始まるファイルの場合はsrcディレクトリを探す
    matchedPath = string.match(file, "(.-/[^/]+/)src")

    if not matchedPath then
      matchedPath = string.match(file, "(.-/[^/]+/)app")

      if not matchedPath then
        print('Error: Could not find `src` or `app` directory in file path')
        return nil
      end
    end

    return matchedPath .. "jest.config.ts"
  else
    return vim.fn.getcwd() .. "/jest.config.ts"
  end
end

-- jest.config.jsを取得する
local function getJsConfigPath(tsConfigPath)
  return string.gsub(tsConfigPath, "%.ts$", ".js")
end

local function jestConfigFile(file)
  local tsConfigPath = getTsConfigPath(file)

  -- jest.config.tsが存在する場合はjest.config.tsを返す
  if vim.loop.fs_stat(tsConfigPath) then
    return tsConfigPath
  end

  -- jest.config.tsが存在しない場合はjest.config.jsを返す
  local jsConfigPath = getJsConfigPath(tsConfigPath)
  if vim.loop.fs_stat(jsConfigPath) then
    return jsConfigPath
  end

  -- どちらも存在しない場合はjest.config.jsを返す
  return vim.fn.getcwd() .. "/jest.config.js"
end

require("neotest").setup({
  adapters = {
    require("neotest-jest")({
      jestCommand = "npm test --",
      jestConfigFile = jestConfigFile,
      env = { CI = true },
    }),
  },
})

vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
  {})
