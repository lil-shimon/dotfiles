# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for macOS development environment configuration. The repository contains configurations for multiple tools with a primary focus on Neovim as the main development editor. Comments and documentation throughout the codebase are written in Japanese (日本語).

## Common Commands

### Installation and Setup
- **Initial font installation**: `sh install.sh`
- **Full environment setup**: `sh setup.sh` (installs LunarVim, creates symlinks, installs packages)
- **Neovim-only setup**: `cd nvim && sh install.sh`
- **VS Code setup**: `cd vscode && sh install.sh`
- **WezTerm setup**: `cd wezterm && sh install.sh`

### Neovim Plugin Management
- **Install/update plugins**: Open Neovim and run `:Lazy sync`
- **Check plugin health**: `:checkhealth [plugin-name]`

### Testing (for Nx monorepo projects)
- **Run tests for specific app**: `npx nx test [app-name]`
- **Run tests in watch mode**: Use `<leader>tw` in Neovim
- **Debug test issues**: `:checkhealth neotest`

## High-Level Architecture

### Neovim Configuration Structure

The Neovim configuration follows a modular plugin-based architecture:

```
nvim/
├── init.lua         # Main entry point - declares all plugins and loads configurations
├── lua/
│   ├── base.lua     # Core Vim settings (encoding, line numbers, etc.)
│   ├── color.lua    # Color scheme configuration
│   ├── maps.lua     # Global keymappings (leader key = space)
│   ├── text.lua     # Text editing settings
│   ├── other.lua    # Miscellaneous settings
│   └── p-*.lua      # Plugin-specific configurations
```

**Plugin Configuration Pattern**: Each plugin has its dedicated configuration file prefixed with `p-`. When adding or modifying plugins:
1. Declare the plugin in `init.lua` with its source and dependencies
2. Create a corresponding `p-[plugin-name].lua` file in the `lua/` directory
3. The init.lua automatically loads all `p-*.lua` files

**Key Plugin Configurations**:
- `p-lsp.lua`: Language server configuration with TypeScript, CSS/SCSS, PHP, Go, and Java support
- `p-neotest.lua`: Test runner specifically configured for Nx monorepo projects with Jest
- `p-telescope.lua`: Fuzzy finder for files, grep, and various search operations
- `p-cmp.lua`: Autocompletion with multiple sources (LSP, buffer, path, snippets)
- `p-git.lua`, `p-neogit.lua`: Git integration with various UI and blame features

### Repository-wide Patterns

1. **Symlink Strategy**: All configurations are symlinked from the dotfiles directory to their expected system locations
2. **Shell Support**: Multiple shells configured (fish, nushell) with fish as primary
3. **Terminal Multiplexing**: tmux configuration with custom prefix (Ctrl+t) and macOS clipboard integration
4. **Language Comments**: Inline comments in configuration files are written in Japanese

### Testing Architecture

The repository includes specialized Neotest configuration for Nx monorepo projects (`nvim/NEOTEST_CONFIG.md`). This setup:
- Dynamically discovers test files in Nx projects
- Supports both application and library testing
- Integrates with Jest runner
- Provides watch mode capabilities

### Key Integrations

- **Claude Code Plugin**: Integrated in Neovim configuration for AI assistance
- **GitHub CLI**: Configured for PR and issue management via `gh` commands
- **Japanese Search**: Kensaku plugins enable romaji-based searching in Japanese text
- **Commitizen**: Configured for conventional commits via `git cz`

## Important Notes

- The repository recently added CSS/SCSS language server support and removed the Octo plugin
- VS Code configuration syncs settings and keybindings for consistency across editors
- The setup assumes macOS with Homebrew as the package manager
- Requires Neovim 0.8+ and Nerd Fonts (Fira Code recommended) for proper display