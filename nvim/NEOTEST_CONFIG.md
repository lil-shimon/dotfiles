# Neotest Configuration for Nx Monorepo

## 概要

このドキュメントは、Nx monorepo環境でのneotest設定について説明します。設定は`lua/p-neotest.lua`に記載されており、Jest testingフレームワークを使用したプロジェクトに最適化されています。

## プラグイン構成

### 必要なプラグイン

```lua
{
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest" -- Jestアダプター
  }
}
```

## 設定詳細

### プロジェクト構造対応

設定は以下のNx monorepo構造に対応しています：

```
/
├── jest.config.ts (ルート設定)
├── apps/
│   ├── ifrit/
│   │   └── jest.config.ts
│   └── gau/
│       └── jest.config.ts
└── libs/
    └── [category]/
        └── [lib-name]/
            └── jest.config.ts
```

### 動的設定関数

#### 1. Jest設定ファイルの検出 (`jestConfigFile`)

```lua
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

  -- フォールバック: ルートのjest.config.ts
  return vim.fn.getcwd() .. "/jest.config.ts"
end
```

**動作:**
- `/apps/[app-name]/` パス内のファイルの場合 → `apps/[app-name]/jest.config.ts`
- `/libs/[category]/[lib-name]/` パス内のファイルの場合 → `libs/[category]/[lib-name]/jest.config.ts`
- それ以外 → ルートの `jest.config.ts`

#### 2. 作業ディレクトリの設定 (`getCwd`)

```lua
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

  -- フォールバック: ルートディレクトリ
  return vim.fn.getcwd()
end
```

**動作:**
- 各プロジェクトのルートディレクトリを作業ディレクトリとして設定
- Jestがプロジェクト固有の設定とパスで実行される

#### 3. テストファイルの判定 (`isTestFile`)

```lua
local function isTestFile(file)
  return string.match(file, "%.spec%.[jt]sx?$") or string.match(file, "%.test%.[jt]sx?$")
end
```

**対応ファイル形式:**
- `*.spec.js`, `*.spec.ts`, `*.spec.jsx`, `*.spec.tsx`
- `*.test.js`, `*.test.ts`, `*.test.jsx`, `*.test.tsx`

### Neotest設定

```lua
neotest.setup({
  adapters = {
    require("neotest-jest")({
      jestConfigFile = jestConfigFile,
      cwd = getCwd,
      jestCommand = "npx nx test",
      jest_test_discovery = false,
      env = { CI = true },
      is_test_file = isTestFile,
    }),
  },
  
  output = {
    enabled = true,
    open_on_run = "short",
  },
  
  log_level = vim.log.levels.WARN,
  
  status = {
    enabled = true,
    signs = true,
    virtual_text = false,
  },
  
  diagnostic = {
    enabled = true,
    severity = vim.diagnostic.severity.ERROR,
  },
})
```

**主要設定:**
- `jestCommand = "npx nx test"`: Nxの最適化されたテスト実行
- `jest_test_discovery = false`: パフォーマンス向上のためテスト自動発見を無効化
- `env = { CI = true }`: CI環境変数を設定してテスト出力を最適化

## キーマップ

### 基本的なテスト実行

| キー | 機能 | 説明 |
|------|------|------|
| `<leader>tr` | Run nearest test | カーソル位置に最も近いテストを実行 |
| `<leader>tf` | Run current file | 現在のファイルのすべてのテストを実行 |
| `<leader>ta` | Run all tests | プロジェクト内のすべてのテストを実行 |

### 結果表示

| キー | 機能 | 説明 |
|------|------|------|
| `<leader>to` | Open test output | テスト実行結果の詳細を表示 |
| `<leader>ts` | Toggle test summary | テストサマリーパネルの表示切り替え |

### Nx固有機能

| キー | 機能 | 説明 |
|------|------|------|
| `<leader>tp` | Run current project tests | 現在のファイルが属するプロジェクトのテストを実行 |
| `<leader>tw` | Run tests in watch mode | ウォッチモードでテストを実行 |

### Nx固有テスト実行の動作

`<leader>tp` キーマップは以下のように動作します：

```lua
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
end)
```

**例:**
- `apps/ifrit/src/components/Button.spec.tsx` → `npx nx test ifrit`
- `libs/ui/button/src/Button.spec.tsx` → `npx nx test ui-button`

## セットアップ手順

1. **プラグインのインストール:**
   ```
   :Lazy sync
   ```

2. **Neovimの再起動:**
   ```
   :q
   nvim
   ```

3. **テスト実行の確認:**
   - テストファイルを開く
   - `<leader>tr` でテストが実行されることを確認

## トラブルシューティング

### よくある問題

1. **Jest設定ファイルが見つからない**
   - パスの正規表現が正しく動作しているか確認
   - `jest.config.ts` ファイルが期待される場所に存在するか確認

2. **Nxコマンドが見つからない**
   - プロジェクトルートで `npx nx --version` が実行できるか確認
   - `package.json` に `@nrwl/cli` または `nx` が含まれているか確認

3. **テストが実行されない**
   - `:checkhealth neotest` でneotestの状態を確認
   - ログレベルを `vim.log.levels.DEBUG` に変更して詳細を確認

### デバッグ設定

デバッグが必要な場合は、以下の設定を一時的に変更：

```lua
-- ログレベルをDEBUGに変更
log_level = vim.log.levels.DEBUG,

-- テスト発見を有効化（問題の特定のため）
jest_test_discovery = true,
```

## パフォーマンス最適化

- `jest_test_discovery = false`: 大規模プロジェクトでのパフォーマンス向上
- `log_level = vim.log.levels.WARN`: 不要なログ出力を抑制
- `virtual_text = false`: エディタの描画パフォーマンス向上

## カスタマイズ

設定をさらにカスタマイズする場合は、`lua/p-neotest.lua`ファイルを編集してください。特に以下の関数をプロジェクトの構造に合わせて調整することができます：

- `jestConfigFile()`: Jest設定ファイルの検出ロジック
- `getCwd()`: 作業ディレクトリの決定ロジック
- `isTestFile()`: テストファイルの判定ロジック