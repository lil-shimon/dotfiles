-- Nx monorepo configuration for neotest
local neotest = require("neotest")

-- Jest設定ファイルの動的検出 (Nx対応)
local function jestConfigFile(file)
  -- apps/配下の場合
  if string.find(file, "/apps/") then
    local app_dir = string.match(file, "(.-/apps/[^/]+/)")
    if app_dir and vim.fn.filereadable(app_dir .. "jest.config.ts") == 1 then
      return app_dir .. "jest.config.ts"
    end
  end

  -- libs/配下の場合
  if string.find(file, "/libs/") then
    local lib_dir = string.match(file, "(.-/libs/[^/]+/[^/]+/)")
    if lib_dir and vim.fn.filereadable(lib_dir .. "jest.config.ts") == 1 then
      return lib_dir .. "jest.config.ts"
    end
  end

  -- ルートのjest.config.tsを使用
  return vim.fn.getcwd() .. "/jest.config.ts"
end

-- 作業ディレクトリの設定 (Nx対応)
local function getCwd(file)
  -- apps/配下の場合
  if string.find(file, "/apps/") then
    local app_dir = string.match(file, "(.-/apps/[^/]+/)")
    if app_dir then
      return app_dir
    end
  end

  -- libs/配下の場合
  if string.find(file, "/libs/") then
    local lib_dir = string.match(file, "(.-/libs/[^/]+/[^/]+/)")
    if lib_dir then
      return lib_dir
    end
  end

  -- ルートディレクトリを使用
  return vim.fn.getcwd()
end

-- テストファイルの判定
local function isTestFile(file)
  return string.match(file, "%.spec%.[jt]sx?$") or string.match(file, "%.test%.[jt]sx?$")
end

neotest.setup({
  adapters = {
    require("neotest-jest")({
      -- Jest設定ファイルの動的検出
      jestConfigFile = jestConfigFile,

      -- 作業ディレクトリの設定
      cwd = getCwd,

      -- Jestコマンドの設定（Nx使用）
      jestCommand = "npx nx test",

      -- テスト発見を無効化（パフォーマンス向上）
      jest_test_discovery = false,

      -- 環境変数の設定
      env = { CI = true },

      -- テストファイルの判定
      is_test_file = isTestFile,
    }),
  },

  -- 出力ウィンドウの設定
  output = {
    enabled = true,
    open_on_run = "short",
  },

  -- ログレベルの設定
  log_level = vim.log.levels.WARN,

  -- サインの設定
  status = {
    enabled = true,
    signs = true,
    virtual_text = false,
  },

  -- 診断の設定
  diagnostic = {
    enabled = true,
    severity = vim.diagnostic.severity.ERROR,
  },
})

-- キーマップの設定
local opts = { noremap = true, silent = true }

-- 基本的なテスト実行
vim.keymap.set("n", "<leader>tr", function() neotest.run.run() end, vim.tbl_extend("force", opts, { desc = "Run nearest test" }))
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, vim.tbl_extend("force", opts, { desc = "Run current file" }))
vim.keymap.set("n", "<leader>ta", function() neotest.run.run({suite = true}) end, vim.tbl_extend("force", opts, { desc = "Run all tests" }))

-- 結果の表示
vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end, vim.tbl_extend("force", opts, { desc = "Open test output" }))
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, vim.tbl_extend("force", opts, { desc = "Toggle test summary" }))

-- Nxプロジェクト固有のテスト実行
vim.keymap.set("n", "<leader>tp", function()
  local current_file = vim.fn.expand("%:p")
  if string.find(current_file, "/apps/") then
    local app_name = string.match(current_file, "/apps/([^/]+)/")
    if app_name then
      vim.cmd("!npx nx test " .. app_name)
    end
  elseif string.find(current_file, "/libs/") then
    local lib_path = string.match(current_file, "/libs/([^/]+/[^/]+)")
    if lib_path then
      local lib_name = string.gsub(lib_path, "/", "-")
      vim.cmd("!npx nx test " .. lib_name)
    end
  end
end, vim.tbl_extend("force", opts, { desc = "Run current project tests" }))

-- ウォッチモードでのテスト実行
vim.keymap.set("n", "<leader>tw", function()
  neotest.run.run({ jestCommand = 'npx nx test --watch' })
end, vim.tbl_extend("force", opts, { desc = "Run tests in watch mode" }))
