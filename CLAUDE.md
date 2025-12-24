# CLAUDE.md

## GitHub系の操作
GitHubの情報を取得するときとかは原則GitHub MCPを利用すること

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS development environment. Primary focus on Neovim as main editor. Comments throughout the codebase are written in Japanese (日本語).

## Common Commands

### Installation
- **Font installation**: `sh install.sh` (installs Fira Code via Homebrew)
- **Full setup**: `sh setup.sh` (LunarVim, symlinks, npm packages)
- **Neovim-only**: `cd nvim && sh install.sh`
- **VS Code**: `cd vscode && sh install.sh`
- **WezTerm**: `cd wezterm && sh install.sh`

### Neovim Plugin Management
- **Install/update plugins**: `:Lazy sync`
- **Check plugin health**: `:checkhealth [plugin-name]`
- **Mason LSP troubleshooting**: Check `~/.local/share/nvim/mason/staging/` for lock files

### Testing (Nx monorepo)
- **Run tests for app**: `npx nx test [app-name]`
- **Run tests in watch mode**: `<leader>tw` in Neovim
- **Debug neotest**: `:checkhealth neotest`

### Claude Code Custom Command
- **`/commit`**: Creates git commits with context-aware staging (separates implementation from test files)

## High-Level Architecture

### Neovim Configuration (`nvim/`)

```
nvim/
├── init.lua         # Plugin declarations via lazy.nvim + require() calls for all p-*.lua
├── lua/
│   ├── base.lua     # Core Vim settings
│   ├── color.lua    # Theme (fluoromachine currently)
│   ├── maps.lua     # Global keymappings (leader = space)
│   └── p-*.lua      # Plugin configs (30+ files)
```

**Plugin Configuration Pattern**: Each plugin gets a `p-[name].lua` file. When adding plugins:
1. Add to `init.lua` plugin list
2. Create `lua/p-[name].lua` with setup
3. Add `require('p-[name]')` at bottom of `init.lua`

**Key Plugin Configs**:
- `p-lsp.lua`: LSP for Lua, TypeScript (ts_ls), ESLint, JSON, CSS/SCSS
- `p-mason.lua`: Auto-installs LSPs and tools (prettierd, stylua, graphql-language-service)
- `p-neotest.lua`: Jest runner optimized for Nx monorepo (see `NEOTEST_CONFIG.md`)
- `p-telescope.lua`: Fuzzy finder with file browser extension
- `p-cmp.lua`: Autocompletion (LSP, buffer, path, luasnip sources)
- `p-gitlinker.lua`: Generate GitHub/GitLab permalinks
- `p-claudecode.lua` (in init.lua): AI integration with `<leader>cc` to toggle

### Symlink Strategy

`setup.sh` creates symlinks:
- `~/dotfiles/fish` → `~/.config/fish`
- `~/dotfiles/nvim` → `~/.config/nvim`
- `~/dotfiles/alacritty` → `~/.config/alacritty`
- `~/dotfiles/tmux/.tmux.conf` → `~/.tmux.conf` (home directory)

### tmux Configuration (`tmux/`)

- **Prefix**: `Ctrl+t` (not default `Ctrl+b`)
- **Pane navigation**: `Ctrl+h,j,k,l` without prefix
- **Window switch**: `Shift+←,→` without prefix
- **Copy mode**: vim keybindings, `y`/`Y` copies to macOS clipboard via pbcopy
- Config location: `tmux/.tmux.conf`

### Testing Architecture (Nx Monorepo)

Neotest dynamically detects project structure:
- `/apps/[app-name]/` → uses `apps/[app-name]/jest.config.ts`
- `/libs/[category]/[lib-name]/` → uses `libs/[category]/[lib-name]/jest.config.ts`
- Uses `npx nx test` command with appropriate project context

Key keymaps:
- `<leader>tr`: Run nearest test
- `<leader>tf`: Run current file
- `<leader>tp`: Run current Nx project's tests

### Key Integrations

- **Claude Code**: `<leader>cc` toggles, `<leader>cs` sends selection (visual mode)
- **Japanese Search**: Kensaku enables romaji search in Japanese text (e.g., "nihon" finds "日本")
- **Commitizen**: `git cz` for conventional commits
- **GitHub CLI**: Use `gh` for PR/issue management

## Requirements

- macOS with Homebrew
- Neovim 0.8+
- Nerd Fonts (Fira Code recommended)
- ripgrep (for Telescope grep)
- Deno (for denops.vim plugins like kensaku)
