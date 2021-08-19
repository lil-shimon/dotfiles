# dotfiles
dotfiles
<pre>
├── alacritty
│   └── alacritty.yml
├── fish
│   ├── completions
│   │   ├── bd.fish
│   │   └── nvm.fish
│   ├── conf.d
│   │   ├── fzf.fish
│   │   ├── nvm.fish
│   │   └── z.fish
│   ├── config.fish
│   ├── fish_plugins
│   ├── fish_variables
│   └── functions
│       ├── __bobthefish_colors.fish
│       ├── __bobthefish_display_colors.fish
│       ├── __bobthefish_glyphs.fish
│       ├── __fzf_cd.fish
│       ├── __fzf_complete.fish
│       ├── __fzf_complete_preview.fish
│       ├── __fzf_find_file.fish
│       ├── __fzf_get_dir.fish
│       ├── __fzf_open.fish
│       ├── __fzf_parse_commandline.fish
│       ├── __fzf_reverse_isearch.fish
│       ├── __fzfcmd.fish
│       ├── __z.fish
│       ├── __z_add.fish
│       ├── __z_clean.fish
│       ├── __z_complete.fish
│       ├── _nvm_index_update.fish
│       ├── _nvm_list.fish
│       ├── _nvm_version_activate.fish
│       ├── _nvm_version_deactivate.fish
│       ├── bd.fish
│       ├── bobthefish_display_colors.fish
│       ├── br.fish -> /Users/shimozawakenta/Library/Application\ Support/org.dystroy.broot/launcher/fish/br.fish
│       ├── fish_greeting.fish
│       ├── fish_mode_prompt.fish
│       ├── fish_prompt.fish
│       ├── fish_right_prompt.fish
│       ├── fish_title.fish
│       ├── fish_user_key_bindings.fish
│       ├── fisher.fish
│       ├── fzf_key_bindings.fish -> /Users/shimozawakenta/.cache/dein/repos/github.com/junegunn/fzf/shell/key-bindings.fish
│       ├── nvm.fish
│       └── uninstall.fish
├── nvim
│   ├── README.md
│   ├── after
│   │   └── plugin
│   │       ├── compe.lua
│   │       ├── formatter.rc.vim
│   │       ├── lspconfig.rc.vim
│   │       ├── lspsage.rc.vim
│   │       ├── lualine.rc.lua
│   │       ├── luasnip.lua
│   │       ├── neoscroll.lua
│   │       ├── tabline.rc.vim
│   │       ├── telescope.rc.vim
│   │       └── treesitter.rc.vim
│   ├── cheatsheet.md
│   ├── colors
│   │   └── dracula
│   │       ├── INSTALL.md
│   │       ├── LICENSE
│   │       ├── README.md
│   │       └── screenshot.png
│   ├── dein.toml
│   ├── init.vim
│   ├── lazy.toml
│   ├── lua
│   │   ├── init.lua
│   │   ├── plugins
│   │   │   ├── compe.lua
│   │   │   └── init.lua
│   │   └── settings
│   │       ├── init.lua
│   │       └── utils.lua
│   ├── plugged
│   │   ├── LuaSnip
│   │   │   ├── DOC.md
│   │   │   ├── Examples
│   │   │   │   └── snippets.lua
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── doc
│   │   │   │   ├── luasnip.txt
│   │   │   │   └── tags
│   │   │   ├── lua
│   │   │   │   └── luasnip
│   │   │   │       ├── config.lua
│   │   │   │       ├── extras
│   │   │   │       │   ├── _lambda.lua
│   │   │   │       │   └── init.lua
│   │   │   │       ├── init.lua
│   │   │   │       ├── loaders
│   │   │   │       │   └── from_vscode.lua
│   │   │   │       ├── nodes
│   │   │   │       │   ├── choiceNode.lua
│   │   │   │       │   ├── dynamicNode.lua
│   │   │   │       │   ├── functionNode.lua
│   │   │   │       │   ├── insertNode.lua
│   │   │   │       │   ├── node.lua
│   │   │   │       │   ├── snippet.lua
│   │   │   │       │   └── textNode.lua
│   │   │   │       └── util
│   │   │   │           ├── functions.lua
│   │   │   │           ├── parser.lua
│   │   │   │           └── util.lua
│   │   │   └── plugin
│   │   │       └── luasnip.vim
│   │   ├── completion-nvim
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── autoload
│   │   │   │   ├── completion.vim
│   │   │   │   └── health
│   │   │   │       └── completion_nvim.vim
│   │   │   ├── doc
│   │   │   │   ├── completion-nvim.txt
│   │   │   │   └── tags
│   │   │   ├── lua
│   │   │   │   ├── completion
│   │   │   │   │   ├── chain_completion.lua
│   │   │   │   │   ├── complete.lua
│   │   │   │   │   ├── health.lua
│   │   │   │   │   ├── hover.lua
│   │   │   │   │   ├── manager.lua
│   │   │   │   │   ├── matching.lua
│   │   │   │   │   ├── option.lua
│   │   │   │   │   ├── signature_help.lua
│   │   │   │   │   ├── source
│   │   │   │   │   │   ├── ins_complete.lua
│   │   │   │   │   │   ├── lsp.lua
│   │   │   │   │   │   ├── path.lua
│   │   │   │   │   │   └── snippet.lua
│   │   │   │   │   ├── source.lua
│   │   │   │   │   └── util.lua
│   │   │   │   └── completion.lua
│   │   │   └── plugin
│   │   │       └── completion.vim
│   │   ├── darktango.vim
│   │   │   ├── README
│   │   │   └── colors
│   │   │       └── darktango.vim
│   │   ├── dart-vim-plugin
│   │   │   ├── AUTHORS
│   │   │   ├── CHANGELOG.md
│   │   │   ├── CONTRIBUTING.md
│   │   │   ├── DartFmt.gif
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── autoload
│   │   │   │   └── dart.vim
│   │   │   ├── doc
│   │   │   │   ├── dart.txt
│   │   │   │   └── tags
│   │   │   ├── ftdetect
│   │   │   │   └── dart.vim
│   │   │   ├── ftplugin
│   │   │   │   └── dart.vim
│   │   │   ├── indent
│   │   │   │   └── dart.vim
│   │   │   ├── plugin
│   │   │   │   └── dart.vim
│   │   │   └── syntax
│   │   │       └── dart.vim
│   │   ├── flutter-tools.nvim
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── ftplugin
│   │   │   │   ├── flutter_tools_notification.vim
│   │   │   │   └── flutter_tools_popup.vim
│   │   │   ├── lua
│   │   │   │   ├── flutter-tools
│   │   │   │   │   ├── commands.lua
│   │   │   │   │   ├── config.lua
│   │   │   │   │   ├── dap.lua
│   │   │   │   │   ├── decorations.lua
│   │   │   │   │   ├── dev_tools.lua
│   │   │   │   │   ├── devices.lua
│   │   │   │   │   ├── executable.lua
│   │   │   │   │   ├── guides.lua
│   │   │   │   │   ├── labels.lua
│   │   │   │   │   ├── log.lua
│   │   │   │   │   ├── lsp
│   │   │   │   │   │   ├── code_actions.lua
│   │   │   │   │   │   └── init.lua
│   │   │   │   │   ├── menu.lua
│   │   │   │   │   ├── outline.lua
│   │   │   │   │   ├── ui.lua
│   │   │   │   │   └── utils
│   │   │   │   │       ├── init.lua
│   │   │   │   │       └── path.lua
│   │   │   │   ├── flutter-tools.lua
│   │   │   │   └── telescope
│   │   │   │       └── _extensions
│   │   │   │           └── flutter.lua
│   │   │   ├── stylua.toml
│   │   │   └── tests
│   │   │       ├── devices_spec.lua
│   │   │       └── minimal.vim
│   │   ├── formatter.nvim
│   │   │   ├── README.md
│   │   │   ├── lua
│   │   │   │   ├── format
│   │   │   │   │   └── init.lua
│   │   │   │   └── formatter
│   │   │   │       ├── complete.lua
│   │   │   │       ├── config.lua
│   │   │   │       ├── format.lua
│   │   │   │       ├── init.lua
│   │   │   │       └── util.lua
│   │   │   ├── plugin
│   │   │   │   └── formatter.vim
│   │   │   └── test
│   │   │       ├── r-test
│   │   │       │   └── test.R
│   │   │       ├── test.js
│   │   │       ├── test.lua
│   │   │       ├── test.py
│   │   │       ├── test.rs
│   │   │       └── test2.rs
│   │   ├── lspsaga.nvim
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── lua
│   │   │   │   └── lspsaga
│   │   │   │       ├── action.lua
│   │   │   │       ├── codeaction.lua
│   │   │   │       ├── command.lua
│   │   │   │       ├── diagnostic.lua
│   │   │   │       ├── floaterm.lua
│   │   │   │       ├── hover.lua
│   │   │   │       ├── implement.lua
│   │   │   │       ├── init.lua
│   │   │   │       ├── libs.lua
│   │   │   │       ├── provider.lua
│   │   │   │       ├── rename.lua
│   │   │   │       ├── signaturehelp.lua
│   │   │   │       ├── window.lua
│   │   │   │       └── wrap.lua
│   │   │   └── plugin
│   │   │       └── lspsaga.vim
│   │   ├── lualine.nvim
│   │   │   ├── CONTRIBUTING.md
│   │   │   ├── LICENSE
│   │   │   ├── Makefile
│   │   │   ├── README.md
│   │   │   ├── THEMES.md
│   │   │   ├── doc
│   │   │   │   ├── lualine.txt
│   │   │   │   └── tags
│   │   │   └── lua
│   │   │       ├── lualine
│   │   │       │   ├── component.lua
│   │   │       │   ├── components
│   │   │       │   │   ├── branch.lua
│   │   │       │   │   ├── diagnostics.lua
│   │   │       │   │   ├── diff.lua
│   │   │       │   │   ├── encoding.lua
│   │   │       │   │   ├── fileformat.lua
│   │   │       │   │   ├── filename.lua
│   │   │       │   │   ├── filetype.lua
│   │   │       │   │   ├── hostname.lua
│   │   │       │   │   ├── location.lua
│   │   │       │   │   ├── mode.lua
│   │   │       │   │   ├── progress.lua
│   │   │       │   │   └── special
│   │   │       │   │       ├── eval_func_component.lua
│   │   │       │   │       ├── function_component.lua
│   │   │       │   │       └── vim_var_component.lua
│   │   │       │   ├── config.lua
│   │   │       │   ├── extensions
│   │   │       │   │   ├── chadtree.lua
│   │   │       │   │   ├── fugitive.lua
│   │   │       │   │   ├── fzf.lua
│   │   │       │   │   ├── nerdtree.lua
│   │   │       │   │   ├── nvim-tree.lua
│   │   │       │   │   └── quickfix.lua
│   │   │       │   ├── highlight.lua
│   │   │       │   ├── init.lua
│   │   │       │   ├── themes
│   │   │       │   │   ├── 16color.lua
│   │   │       │   │   ├── auto.lua
│   │   │       │   │   ├── ayu_dark.lua
│   │   │       │   │   ├── ayu_light.lua
│   │   │       │   │   ├── ayu_mirage.lua
│   │   │       │   │   ├── codedark.lua
│   │   │       │   │   ├── dracula.lua
│   │   │       │   │   ├── everforest.lua
│   │   │       │   │   ├── gruvbox.lua
│   │   │       │   │   ├── gruvbox_light.lua
│   │   │       │   │   ├── gruvbox_material.lua
│   │   │       │   │   ├── horizon.lua
│   │   │       │   │   ├── iceberg_dark.lua
│   │   │       │   │   ├── iceberg_light.lua
│   │   │       │   │   ├── jellybeans.lua
│   │   │       │   │   ├── material.lua
│   │   │       │   │   ├── modus_vivendi.lua
│   │   │       │   │   ├── molokai.lua
│   │   │       │   │   ├── nightfly.lua
│   │   │       │   │   ├── nord.lua
│   │   │       │   │   ├── oceanicnext.lua
│   │   │       │   │   ├── onedark.lua
│   │   │       │   │   ├── onelight.lua
│   │   │       │   │   ├── palenight.lua
│   │   │       │   │   ├── papercolor.lua
│   │   │       │   │   ├── papercolor_dark.lua
│   │   │       │   │   ├── papercolor_light.lua
│   │   │       │   │   ├── powerline.lua
│   │   │       │   │   ├── seoul256.lua
│   │   │       │   │   ├── solarized.lua
│   │   │       │   │   ├── solarized_dark.lua
│   │   │       │   │   ├── solarized_light.lua
│   │   │       │   │   ├── tomorrow.lua
│   │   │       │   │   └── wombat.lua
│   │   │       │   └── utils
│   │   │       │       ├── async.lua
│   │   │       │       ├── cterm_colors.lua
│   │   │       │       ├── loader.lua
│   │   │       │       ├── mode.lua
│   │   │       │       ├── section.lua
│   │   │       │       └── utils.lua
│   │   │       └── tests
│   │   │           ├── helpers.lua
│   │   │           ├── minimal_init.lua
│   │   │           └── spec
│   │   │               ├── component_spec.lua
│   │   │               ├── config_spec.lua
│   │   │               └── utils_spec.lua
│   │   ├── moonlight.nvim
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── colors
│   │   │   │   └── moonlight.vim
│   │   │   └── lua
│   │   │       ├── lualine
│   │   │       │   └── themes
│   │   │       │       └── moonlight.lua
│   │   │       └── moonlight
│   │   │           ├── colors.lua
│   │   │           ├── init.lua
│   │   │           ├── moonlight-palette.png
│   │   │           ├── theme.lua
│   │   │           └── util.lua
│   │   ├── neon
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── colors
│   │   │   │   └── neon.vim
│   │   │   ├── doc
│   │   │   │   ├── neon.txt
│   │   │   │   └── tags
│   │   │   └── lua
│   │   │       ├── lualine
│   │   │       │   └── themes
│   │   │       │       └── neon.lua
│   │   │       └── neon
│   │   │           ├── colors.lua
│   │   │           ├── config.lua
│   │   │           ├── init.lua
│   │   │           └── utils.lua
│   │   ├── neoscroll.nvim
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── doc
│   │   │   │   ├── neoscroll.txt
│   │   │   │   └── tags
│   │   │   └── lua
│   │   │       └── neoscroll
│   │   │           ├── config.lua
│   │   │           ├── init.lua
│   │   │           └── utils.lua
│   │   ├── nvim-compe
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── after
│   │   │   │   └── plugin
│   │   │   │       └── compe.vim
│   │   │   ├── autoload
│   │   │   │   ├── compe
│   │   │   │   │   ├── confirmation.vim
│   │   │   │   │   ├── helper.vim
│   │   │   │   │   └── vim_bridge.vim
│   │   │   │   ├── compe.vim
│   │   │   │   ├── compe_vim_lsc
│   │   │   │   │   └── source.vim
│   │   │   │   ├── compe_vim_lsp
│   │   │   │   │   └── source.vim
│   │   │   │   ├── health
│   │   │   │   │   └── compe.vim
│   │   │   │   └── vital
│   │   │   │       ├── _compe
│   │   │   │       │   └── VS
│   │   │   │       │       ├── LSP
│   │   │   │       │       │   ├── CompletionItem.vim
│   │   │   │       │       │   ├── MarkupContent.vim
│   │   │   │       │       │   ├── Position.vim
│   │   │   │       │       │   ├── Text.vim
│   │   │   │       │       │   └── TextEdit.vim
│   │   │   │       │       └── Vim
│   │   │   │       │           ├── Buffer.vim
│   │   │   │       │           ├── Option.vim
│   │   │   │       │           ├── Syntax
│   │   │   │       │           │   └── Markdown.vim
│   │   │   │       │           ├── Window
│   │   │   │       │           │   └── FloatingWindow.vim
│   │   │   │       │           └── Window.vim
│   │   │   │       ├── _compe.vim
│   │   │   │       ├── compe.vim
│   │   │   │       └── compe.vital
│   │   │   ├── doc
│   │   │   │   ├── compe.txt
│   │   │   │   └── tags
│   │   │   ├── lua
│   │   │   │   ├── compe
│   │   │   │   │   ├── completion.lua
│   │   │   │   │   ├── config.lua
│   │   │   │   │   ├── context.lua
│   │   │   │   │   ├── float.lua
│   │   │   │   │   ├── helper.lua
│   │   │   │   │   ├── init.lua
│   │   │   │   │   ├── lazy.lua
│   │   │   │   │   ├── matcher.lua
│   │   │   │   │   ├── pattern.lua
│   │   │   │   │   ├── source.lua
│   │   │   │   │   ├── utils
│   │   │   │   │   │   ├── async.lua
│   │   │   │   │   │   ├── boolean.lua
│   │   │   │   │   │   ├── cache.lua
│   │   │   │   │   │   ├── callback.lua
│   │   │   │   │   │   ├── character.lua
│   │   │   │   │   │   ├── compat.lua
│   │   │   │   │   │   ├── debug.lua
│   │   │   │   │   │   ├── perf.lua
│   │   │   │   │   │   └── string.lua
│   │   │   │   │   └── vim_bridge.lua
│   │   │   │   ├── compe_buffer
│   │   │   │   │   ├── buffer.lua
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_calc
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_emoji
│   │   │   │   │   ├── emoji.json
│   │   │   │   │   ├── init.lua
│   │   │   │   │   ├── items.lua
│   │   │   │   │   └── update.lua
│   │   │   │   ├── compe_luasnip
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_nvim_lsp
│   │   │   │   │   ├── init.lua
│   │   │   │   │   └── source.lua
│   │   │   │   ├── compe_nvim_lua
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_omni
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_path
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_snippets_nvim
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_spell
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_tags
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_treesitter
│   │   │   │   │   └── init.lua
│   │   │   │   ├── compe_ultisnips
│   │   │   │   │   └── init.lua
│   │   │   │   └── compe_vsnip
│   │   │   │       └── init.lua
│   │   │   ├── misc
│   │   │   │   └── minimal.vim
│   │   │   └── plugin
│   │   │       └── compe.vim
│   │   ├── nvim-lspconfig
│   │   │   ├── ADVANCED_README.md
│   │   │   ├── CONFIG.md
│   │   │   ├── CONTRIBUTING.md
│   │   │   ├── LICENSE.md
│   │   │   ├── Makefile
│   │   │   ├── README.md
│   │   │   ├── autoload
│   │   │   │   └── health
│   │   │   │       └── lspconfig.vim
│   │   │   ├── doc
│   │   │   │   ├── lspconfig.txt
│   │   │   │   └── tags
│   │   │   ├── lua
│   │   │   │   ├── lspconfig
│   │   │   │   │   ├── _lspui.lua
│   │   │   │   │   ├── als.lua
│   │   │   │   │   ├── angularls.lua
│   │   │   │   │   ├── bashls.lua
│   │   │   │   │   ├── beancount.lua
│   │   │   │   │   ├── ccls.lua
│   │   │   │   │   ├── clangd.lua
│   │   │   │   │   ├── clojure_lsp.lua
│   │   │   │   │   ├── cmake.lua
│   │   │   │   │   ├── codeqlls.lua
│   │   │   │   │   ├── configs.lua
│   │   │   │   │   ├── crystalline.lua
│   │   │   │   │   ├── cssls.lua
│   │   │   │   │   ├── dartls.lua
│   │   │   │   │   ├── denols.lua
│   │   │   │   │   ├── dhall_lsp_server.lua
│   │   │   │   │   ├── diagnosticls.lua
│   │   │   │   │   ├── dockerls.lua
│   │   │   │   │   ├── dotls.lua
│   │   │   │   │   ├── efm.lua
│   │   │   │   │   ├── elixirls.lua
│   │   │   │   │   ├── elmls.lua
│   │   │   │   │   ├── ember.lua
│   │   │   │   │   ├── erlangls.lua
│   │   │   │   │   ├── flow.lua
│   │   │   │   │   ├── fortls.lua
│   │   │   │   │   ├── fsautocomplete.lua
│   │   │   │   │   ├── gdscript.lua
│   │   │   │   │   ├── ghcide.lua
│   │   │   │   │   ├── gopls.lua
│   │   │   │   │   ├── graphql.lua
│   │   │   │   │   ├── groovyls.lua
│   │   │   │   │   ├── haxe_language_server.lua
│   │   │   │   │   ├── health.lua
│   │   │   │   │   ├── hie.lua
│   │   │   │   │   ├── hls.lua
│   │   │   │   │   ├── html.lua
│   │   │   │   │   ├── intelephense.lua
│   │   │   │   │   ├── java_language_server.lua
│   │   │   │   │   ├── jdtls.lua
│   │   │   │   │   ├── jedi_language_server.lua
│   │   │   │   │   ├── jsonls.lua
│   │   │   │   │   ├── julials.lua
│   │   │   │   │   ├── kotlin_language_server.lua
│   │   │   │   │   ├── lean3ls.lua
│   │   │   │   │   ├── leanls.lua
│   │   │   │   │   ├── lspinfo.lua
│   │   │   │   │   ├── metals.lua
│   │   │   │   │   ├── nimls.lua
│   │   │   │   │   ├── ocamlls.lua
│   │   │   │   │   ├── ocamllsp.lua
│   │   │   │   │   ├── omnisharp.lua
│   │   │   │   │   ├── perlls.lua
│   │   │   │   │   ├── perlpls.lua
│   │   │   │   │   ├── phpactor.lua
│   │   │   │   │   ├── powershell_es.lua
│   │   │   │   │   ├── prismals.lua
│   │   │   │   │   ├── puppet.lua
│   │   │   │   │   ├── purescriptls.lua
│   │   │   │   │   ├── pylsp.lua
│   │   │   │   │   ├── pyright.lua
│   │   │   │   │   ├── r_language_server.lua
│   │   │   │   │   ├── racket_langserver.lua
│   │   │   │   │   ├── rescriptls.lua
│   │   │   │   │   ├── rls.lua
│   │   │   │   │   ├── rnix.lua
│   │   │   │   │   ├── rome.lua
│   │   │   │   │   ├── rust_analyzer.lua
│   │   │   │   │   ├── scry.lua
│   │   │   │   │   ├── serve_d.lua
│   │   │   │   │   ├── solargraph.lua
│   │   │   │   │   ├── sorbet.lua
│   │   │   │   │   ├── sourcekit.lua
│   │   │   │   │   ├── sqlls.lua
│   │   │   │   │   ├── sqls.lua
│   │   │   │   │   ├── stylelint_lsp.lua
│   │   │   │   │   ├── sumneko_lua.lua
│   │   │   │   │   ├── svelte.lua
│   │   │   │   │   ├── svls.lua
│   │   │   │   │   ├── tailwindcss.lua
│   │   │   │   │   ├── terraformls.lua
│   │   │   │   │   ├── texlab.lua
│   │   │   │   │   ├── tflint.lua
│   │   │   │   │   ├── tsserver.lua
│   │   │   │   │   ├── util.lua
│   │   │   │   │   ├── vala_ls.lua
│   │   │   │   │   ├── vimls.lua
│   │   │   │   │   ├── vls.lua
│   │   │   │   │   ├── vuels.lua
│   │   │   │   │   ├── yamlls.lua
│   │   │   │   │   ├── zeta_note.lua
│   │   │   │   │   └── zls.lua
│   │   │   │   └── lspconfig.lua
│   │   │   ├── plugin
│   │   │   │   └── lspconfig.vim
│   │   │   ├── scripts
│   │   │   │   ├── README_template.md
│   │   │   │   ├── docgen.lua
│   │   │   │   ├── docgen.sh
│   │   │   │   ├── run_test.sh
│   │   │   │   └── vimdocgen.lua
│   │   │   └── test
│   │   │       ├── lspconfig_spec.lua
│   │   │       ├── minimal_init.lua
│   │   │       └── test_dir
│   │   │           ├── a
│   │   │           │   └── a_marker.txt
│   │   │           └── root_marker.txt
│   │   ├── nvim-treesitter
│   │   │   ├── CONTRIBUTING.md
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── after
│   │   │   │   └── ftplugin
│   │   │   │       └── query.vim
│   │   │   ├── assets
│   │   │   │   ├── example-cpp.png
│   │   │   │   └── logo.png
│   │   │   ├── autoload
│   │   │   │   ├── health
│   │   │   │   │   └── nvim_treesitter.vim
│   │   │   │   └── nvim_treesitter.vim
│   │   │   ├── doc
│   │   │   │   ├── nvim-treesitter.txt
│   │   │   │   └── tags
│   │   │   ├── ftdetect
│   │   │   │   ├── gdscript.vim
│   │   │   │   ├── gomod.vim
│   │   │   │   └── query.vim
│   │   │   ├── lockfile.json
│   │   │   ├── lua
│   │   │   │   ├── nvim-treesitter
│   │   │   │   │   ├── caching.lua
│   │   │   │   │   ├── configs.lua
│   │   │   │   │   ├── fold.lua
│   │   │   │   │   ├── health.lua
│   │   │   │   │   ├── highlight.lua
│   │   │   │   │   ├── incremental_selection.lua
│   │   │   │   │   ├── indent.lua
│   │   │   │   │   ├── info.lua
│   │   │   │   │   ├── install.lua
│   │   │   │   │   ├── locals.lua
│   │   │   │   │   ├── parsers.lua
│   │   │   │   │   ├── query.lua
│   │   │   │   │   ├── query_predicates.lua
│   │   │   │   │   ├── shell_command_selectors.lua
│   │   │   │   │   ├── ts_utils.lua
│   │   │   │   │   ├── tsrange.lua
│   │   │   │   │   └── utils.lua
│   │   │   │   └── nvim-treesitter.lua
│   │   │   ├── parser
│   │   │   │   ├── fish.so
│   │   │   │   ├── html.so
│   │   │   │   ├── javascript.so
│   │   │   │   ├── json.so
│   │   │   │   ├── php.so
│   │   │   │   ├── scss.so
│   │   │   │   ├── swift.so
│   │   │   │   ├── toml.so
│   │   │   │   ├── tsx.so
│   │   │   │   └── yaml.so
│   │   │   ├── parser-info
│   │   │   │   ├── fish.revision
│   │   │   │   ├── html.revision
│   │   │   │   ├── javascript.revision
│   │   │   │   ├── json.revision
│   │   │   │   ├── php.revision
│   │   │   │   ├── scss.revision
│   │   │   │   ├── swift.revision
│   │   │   │   ├── toml.revision
│   │   │   │   ├── tsx.revision
│   │   │   │   └── yaml.revision
│   │   │   ├── plugin
│   │   │   │   └── nvim-treesitter.vim
│   │   │   ├── queries
│   │   │   │   ├── bash
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── beancount
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   └── highlights.scm
│   │   │   │   ├── bibtex
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── indents.scm
│   │   │   │   ├── c
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── c_sharp
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── clojure
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── cmake
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   └── highlights.scm
│   │   │   │   ├── comment
│   │   │   │   │   └── highlights.scm
│   │   │   │   ├── commonlisp
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── cpp
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── css
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── cuda
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── dart
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── devicetree
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── dockerfile
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── ecma
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── elixir
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── fennel
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── fish
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── fortran
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── indents.scm
│   │   │   │   ├── gdscript
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── glimmer
│   │   │   │   │   └── highlights.scm
│   │   │   │   ├── go
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── gomod
│   │   │   │   │   └── highlights.scm
│   │   │   │   ├── graphql
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── haskell
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── hcl
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── html
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── html_tags
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── java
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── javascript
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── jsdoc
│   │   │   │   │   └── highlights.scm
│   │   │   │   ├── json
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── jsonc
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── jsx
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── indents.scm
│   │   │   │   ├── julia
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── kotlin
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── latex
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── ledger
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── lua
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── markdown
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── nix
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── ocaml
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── ocaml_interface
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── ocamllex
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── php
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── python
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── ql
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── query
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── r
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── regex
│   │   │   │   │   └── highlights.scm
│   │   │   │   ├── rst
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── ruby
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── rust
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── scss
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── indents.scm
│   │   │   │   ├── sparql
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── supercollider
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── svelte
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── teal
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── toml
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── tsx
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── turtle
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── typescript
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── verilog
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   ├── vue
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   └── injections.scm
│   │   │   │   ├── yaml
│   │   │   │   │   ├── folds.scm
│   │   │   │   │   ├── highlights.scm
│   │   │   │   │   ├── indents.scm
│   │   │   │   │   ├── injections.scm
│   │   │   │   │   └── locals.scm
│   │   │   │   └── zig
│   │   │   │       ├── folds.scm
│   │   │   │       ├── highlights.scm
│   │   │   │       ├── indents.scm
│   │   │   │       ├── injections.scm
│   │   │   │       └── locals.scm
│   │   │   ├── scripts
│   │   │   │   ├── check-queries.lua
│   │   │   │   ├── ci-install-macos-latest.sh
│   │   │   │   ├── ci-install-ubuntu-latest.sh
│   │   │   │   ├── ci-install-windows-latest.sh
│   │   │   │   ├── minimal_init.lua
│   │   │   │   ├── pre-push
│   │   │   │   ├── run_tests.sh
│   │   │   │   ├── update-readme.lua
│   │   │   │   └── write-lockfile.lua
│   │   │   └── tests
│   │   │       └── indent
│   │   │           ├── c
│   │   │           │   ├── array.c
│   │   │           │   ├── comment.c
│   │   │           │   ├── cond.c
│   │   │           │   ├── enum.c
│   │   │           │   ├── expr.c
│   │   │           │   ├── func.c
│   │   │           │   ├── label.c
│   │   │           │   ├── loop.c
│   │   │           │   ├── no_braces.c
│   │   │           │   ├── preproc_cond.c
│   │   │           │   ├── preproc_func.c
│   │   │           │   ├── string.c
│   │   │           │   ├── struct.c
│   │   │           │   ├── switch.c
│   │   │           │   └── ternary.c
│   │   │           ├── c_spec.lua
│   │   │           ├── common.lua
│   │   │           ├── cpp
│   │   │           │   ├── access.cpp
│   │   │           │   ├── class.cpp
│   │   │           │   └── stream.cpp
│   │   │           ├── cpp_spec.lua
│   │   │           ├── lua
│   │   │           │   ├── comment.lua
│   │   │           │   ├── cond.lua
│   │   │           │   ├── func.lua
│   │   │           │   ├── loop.lua
│   │   │           │   ├── string.lua
│   │   │           │   └── table.lua
│   │   │           ├── lua_spec.lua
│   │   │           ├── python
│   │   │           │   ├── aligned_indent.py
│   │   │           │   ├── basic_blocks.py
│   │   │           │   ├── basic_collections.py
│   │   │           │   ├── branches.py
│   │   │           │   ├── comprehensions.py
│   │   │           │   ├── control_flow.py
│   │   │           │   ├── hanging_indent.py
│   │   │           │   ├── join_lines.py
│   │   │           │   ├── nested_collections.py
│   │   │           │   └── strings.py
│   │   │           ├── python_spec.lua
│   │   │           ├── rust
│   │   │           │   ├── array.rs
│   │   │           │   ├── comment.rs
│   │   │           │   ├── cond.rs
│   │   │           │   ├── enum.rs
│   │   │           │   ├── func.rs
│   │   │           │   ├── impl.rs
│   │   │           │   ├── loop.rs
│   │   │           │   ├── macro.rs
│   │   │           │   ├── match.rs
│   │   │           │   ├── mod.rs
│   │   │           │   ├── string.rs
│   │   │           │   ├── struct.rs
│   │   │           │   ├── trait.rs
│   │   │           │   └── where.rs
│   │   │           └── rust_spec.lua
│   │   ├── nvim-web-devicons
│   │   │   ├── README.md
│   │   │   ├── lua
│   │   │   │   └── nvim-web-devicons.lua
│   │   │   └── plugin
│   │   │       └── nvim-web-devicons.vim
│   │   ├── paige
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   └── colors
│   │   │       ├── paige-dark-system.vim
│   │   │       ├── paige-dark.vim
│   │   │       ├── paige-system.vim
│   │   │       └── paige.vim
│   │   ├── plenary.nvim
│   │   │   ├── CHANGELOG.md
│   │   │   ├── LICENSE
│   │   │   ├── Makefile
│   │   │   ├── README.md
│   │   │   ├── TESTS_README.md
│   │   │   ├── data
│   │   │   │   └── plenary
│   │   │   │       └── filetypes
│   │   │   │           ├── base.lua
│   │   │   │           └── builtin.lua
│   │   │   ├── lua
│   │   │   │   ├── luassert
│   │   │   │   │   ├── array.lua
│   │   │   │   │   ├── assert.lua
│   │   │   │   │   ├── assertions.lua
│   │   │   │   │   ├── compatibility.lua
│   │   │   │   │   ├── formatters
│   │   │   │   │   │   ├── binarystring.lua
│   │   │   │   │   │   └── init.lua
│   │   │   │   │   ├── init.lua
│   │   │   │   │   ├── languages
│   │   │   │   │   │   └── en.lua
│   │   │   │   │   ├── match.lua
│   │   │   │   │   ├── matchers
│   │   │   │   │   │   ├── composite.lua
│   │   │   │   │   │   ├── core.lua
│   │   │   │   │   │   └── init.lua
│   │   │   │   │   ├── mock.lua
│   │   │   │   │   ├── modifiers.lua
│   │   │   │   │   ├── namespaces.lua
│   │   │   │   │   ├── spy.lua
│   │   │   │   │   ├── state.lua
│   │   │   │   │   ├── stub.lua
│   │   │   │   │   └── util.lua
│   │   │   │   ├── plenary
│   │   │   │   │   ├── async
│   │   │   │   │   │   ├── api.lua
│   │   │   │   │   │   ├── async.lua
│   │   │   │   │   │   ├── control.lua
│   │   │   │   │   │   ├── init.lua
│   │   │   │   │   │   ├── lsp.lua
│   │   │   │   │   │   ├── structs.lua
│   │   │   │   │   │   ├── tests.lua
│   │   │   │   │   │   ├── util.lua
│   │   │   │   │   │   └── uv_async.lua
│   │   │   │   │   ├── async_lib
│   │   │   │   │   │   ├── api.lua
│   │   │   │   │   │   ├── async.lua
│   │   │   │   │   │   ├── init.lua
│   │   │   │   │   │   ├── lsp.lua
│   │   │   │   │   │   ├── structs.lua
│   │   │   │   │   │   ├── tests.lua
│   │   │   │   │   │   ├── util.lua
│   │   │   │   │   │   └── uv_async.lua
│   │   │   │   │   ├── busted.lua
│   │   │   │   │   ├── class.lua
│   │   │   │   │   ├── collections
│   │   │   │   │   │   └── py_list.lua
│   │   │   │   │   ├── context_manager.lua
│   │   │   │   │   ├── curl.lua
│   │   │   │   │   ├── debug_utils.lua
│   │   │   │   │   ├── enum.lua
│   │   │   │   │   ├── errors.lua
│   │   │   │   │   ├── filetype.lua
│   │   │   │   │   ├── fun.lua
│   │   │   │   │   ├── functional.lua
│   │   │   │   │   ├── init.lua
│   │   │   │   │   ├── iterators.lua
│   │   │   │   │   ├── job.lua
│   │   │   │   │   ├── log.lua
│   │   │   │   │   ├── lsp
│   │   │   │   │   │   └── override.lua
│   │   │   │   │   ├── neorocks
│   │   │   │   │   │   └── init.lua
│   │   │   │   │   ├── nvim_meta.lua
│   │   │   │   │   ├── operators.lua
│   │   │   │   │   ├── path.lua
│   │   │   │   │   ├── popup.lua
│   │   │   │   │   ├── profile
│   │   │   │   │   │   ├── lua_profiler.lua
│   │   │   │   │   │   ├── memory_profiler.lua
│   │   │   │   │   │   └── p.lua
│   │   │   │   │   ├── profile.lua
│   │   │   │   │   ├── reload.lua
│   │   │   │   │   ├── run.lua
│   │   │   │   │   ├── scandir.lua
│   │   │   │   │   ├── strings.lua
│   │   │   │   │   ├── tbl.lua
│   │   │   │   │   ├── test_harness.lua
│   │   │   │   │   ├── vararg
│   │   │   │   │   │   ├── init.lua
│   │   │   │   │   │   └── rotate.lua
│   │   │   │   │   └── window
│   │   │   │   │       ├── border.lua
│   │   │   │   │       ├── float.lua
│   │   │   │   │       └── init.lua
│   │   │   │   └── say.lua
│   │   │   ├── plugin
│   │   │   │   └── plenary.vim
│   │   │   ├── scratch
│   │   │   │   ├── _reference_count.lua
│   │   │   │   ├── busted_tester.lua
│   │   │   │   ├── coroutine_examples.lua
│   │   │   │   ├── iterators.lua
│   │   │   │   ├── job_graveyard.lua
│   │   │   │   ├── job_memory_leaker.lua
│   │   │   │   ├── memory_profiler.lua
│   │   │   │   ├── memory_tracker.lua
│   │   │   │   ├── minimal_init.vim
│   │   │   │   ├── new_line_finder.lua
│   │   │   │   ├── rotate_bench.lua
│   │   │   │   ├── run_tester.lua
│   │   │   │   ├── term_open_checker.lua
│   │   │   │   └── window_test.lua
│   │   │   ├── scripts
│   │   │   │   ├── minimal.vim
│   │   │   │   ├── update_filetypes_from_github.lua
│   │   │   │   ├── update_vararg.py
│   │   │   │   └── vararg
│   │   │   │       └── rotate.lua
│   │   │   └── tests
│   │   │       ├── manual
│   │   │       │   └── large_job_spec.lua
│   │   │       ├── minimal_init.vim
│   │   │       └── plenary
│   │   │           ├── async
│   │   │           │   ├── async_spec.lua
│   │   │           │   ├── channel_spec.lua
│   │   │           │   ├── condvar_spec.lua
│   │   │           │   ├── deque_spec.lua
│   │   │           │   ├── read_file_bench.lua
│   │   │           │   ├── semaphore_spec.lua
│   │   │           │   └── util_spec.lua
│   │   │           ├── context_manager_spec.lua
│   │   │           ├── curl_spec.lua
│   │   │           ├── enum_spec.lua
│   │   │           ├── filetype_spec.lua
│   │   │           ├── iterators_spec.lua
│   │   │           ├── job
│   │   │           │   └── validation_spec.lua
│   │   │           ├── job_spec.lua
│   │   │           ├── path_spec.lua
│   │   │           ├── py_list_spec.lua
│   │   │           ├── rotate_spec.lua
│   │   │           ├── scandir_spec.lua
│   │   │           ├── simple_busted_spec.lua
│   │   │           ├── strings_spec.lua
│   │   │           ├── tbl_spec.lua
│   │   │           └── uses_nvim_spec.lua
│   │   ├── popup.nvim
│   │   │   ├── README.md
│   │   │   └── lua
│   │   │       ├── popup
│   │   │       │   ├── _compat.lua
│   │   │       │   ├── init.lua
│   │   │       │   └── utils.lua
│   │   │       └── tests
│   │   │           └── basic_popup_spec.lua
│   │   ├── telescope.nvim
│   │   │   ├── CONTRIBUTING.md
│   │   │   ├── LICENSE
│   │   │   ├── Makefile
│   │   │   ├── README.md
│   │   │   ├── data
│   │   │   │   ├── memes
│   │   │   │   │   └── planets
│   │   │   │   │       ├── earth
│   │   │   │   │       ├── jupiter
│   │   │   │   │       ├── mars
│   │   │   │   │       ├── mercury
│   │   │   │   │       ├── moon
│   │   │   │   │       ├── neptune
│   │   │   │   │       ├── pluto
│   │   │   │   │       ├── saturn
│   │   │   │   │       ├── uranus
│   │   │   │   │       └── venus
│   │   │   │   └── options
│   │   │   │       └── options.lua
│   │   │   ├── developers.md
│   │   │   ├── doc
│   │   │   │   ├── secret.txt
│   │   │   │   ├── tags
│   │   │   │   ├── telescope.txt
│   │   │   │   └── telescope_changelog.txt
│   │   │   ├── lua
│   │   │   │   ├── telescope
│   │   │   │   │   ├── WIP.lua
│   │   │   │   │   ├── _compat.lua
│   │   │   │   │   ├── _extensions
│   │   │   │   │   │   └── init.lua
│   │   │   │   │   ├── actions
│   │   │   │   │   │   ├── history.lua
│   │   │   │   │   │   ├── init.lua
│   │   │   │   │   │   ├── mt.lua
│   │   │   │   │   │   ├── set.lua
│   │   │   │   │   │   ├── state.lua
│   │   │   │   │   │   └── utils.lua
│   │   │   │   │   ├── algos
│   │   │   │   │   │   ├── fzy.lua
│   │   │   │   │   │   ├── linked_list.lua
│   │   │   │   │   │   └── string_distance.lua
│   │   │   │   │   ├── builtin
│   │   │   │   │   │   ├── files.lua
│   │   │   │   │   │   ├── git.lua
│   │   │   │   │   │   ├── init.lua
│   │   │   │   │   │   ├── internal.lua
│   │   │   │   │   │   └── lsp.lua
│   │   │   │   │   ├── command.lua
│   │   │   │   │   ├── config
│   │   │   │   │   │   └── resolve.lua
│   │   │   │   │   ├── config.lua
│   │   │   │   │   ├── debounce.lua
│   │   │   │   │   ├── deprecated.lua
│   │   │   │   │   ├── entry_manager.lua
│   │   │   │   │   ├── finders
│   │   │   │   │   │   ├── async_job_finder.lua
│   │   │   │   │   │   ├── async_oneshot_finder.lua
│   │   │   │   │   │   └── async_static_finder.lua
│   │   │   │   │   ├── finders.lua
│   │   │   │   │   ├── from_entry.lua
│   │   │   │   │   ├── init.lua
│   │   │   │   │   ├── log.lua
│   │   │   │   │   ├── make_entry.lua
│   │   │   │   │   ├── mappings.lua
│   │   │   │   │   ├── path.lua
│   │   │   │   │   ├── pickers
│   │   │   │   │   │   ├── _test.lua
│   │   │   │   │   │   ├── _test_helpers.lua
│   │   │   │   │   │   ├── entry_display.lua
│   │   │   │   │   │   ├── highlights.lua
│   │   │   │   │   │   ├── layout_strategies.lua
│   │   │   │   │   │   ├── multi.lua
│   │   │   │   │   │   ├── scroller.lua
│   │   │   │   │   │   └── window.lua
│   │   │   │   │   ├── pickers.lua
│   │   │   │   │   ├── previewers
│   │   │   │   │   │   ├── buffer_previewer.lua
│   │   │   │   │   │   ├── init.lua
│   │   │   │   │   │   ├── previewer.lua
│   │   │   │   │   │   ├── term_previewer.lua
│   │   │   │   │   │   └── utils.lua
│   │   │   │   │   ├── sorters.lua
│   │   │   │   │   ├── state.lua
│   │   │   │   │   ├── themes.lua
│   │   │   │   │   └── utils.lua
│   │   │   │   └── tests
│   │   │   │       ├── automated
│   │   │   │       │   ├── action_spec.lua
│   │   │   │       │   ├── entry_display_spec.lua
│   │   │   │       │   ├── entry_manager_spec.lua
│   │   │   │       │   ├── layout_strategies_spec.lua
│   │   │   │       │   ├── linked_list_spec.lua
│   │   │   │       │   ├── pickers
│   │   │   │       │   │   ├── find_files_spec.lua
│   │   │   │       │   │   └── scrolling_spec.lua
│   │   │   │       │   ├── resolver_spec.lua
│   │   │   │       │   ├── scroller_spec.lua
│   │   │   │       │   └── telescope_spec.lua
│   │   │   │       ├── fixtures
│   │   │   │       │   ├── file_a.txt
│   │   │   │       │   └── file_abc.txt
│   │   │   │       ├── helpers.lua
│   │   │   │       ├── manual
│   │   │   │       │   ├── all_defaults.lua
│   │   │   │       │   ├── auto_picker.lua
│   │   │   │       │   ├── find_and_sort_spec.lua
│   │   │   │       │   ├── large_search.lua
│   │   │   │       │   ├── newline_tables.lua
│   │   │   │       │   ├── profile_for_sorters.lua
│   │   │   │       │   ├── reference_tracker.lua
│   │   │   │       │   ├── resolver_spec.lua
│   │   │   │       │   └── slow_oneshot.lua
│   │   │   │       └── pickers
│   │   │   │           ├── find_files__readme.lua
│   │   │   │           ├── find_files__scrolling_descending_cycle.lua
│   │   │   │           └── find_files__with_ctrl_n.lua
│   │   │   ├── media
│   │   │   │   ├── demo_script.lua
│   │   │   │   ├── demo_script_2.lua
│   │   │   │   ├── simple_rg_example.hnt
│   │   │   │   └── worflow.txt
│   │   │   ├── plugin
│   │   │   │   └── telescope.vim
│   │   │   ├── scratch
│   │   │   │   ├── batched_finder_and_sorter.lua
│   │   │   │   ├── better_defaults_init.vim
│   │   │   │   ├── bk_tree.lua
│   │   │   │   ├── buffer_highlights.lua
│   │   │   │   ├── clason_finders.lua
│   │   │   │   ├── completion_init.vim
│   │   │   │   ├── diag_test.lua
│   │   │   │   ├── digia_init.vim
│   │   │   │   ├── example.lua
│   │   │   │   ├── fast_split.lua
│   │   │   │   ├── file_finder.lua
│   │   │   │   ├── fuzzy_tester.lua
│   │   │   │   ├── how_long_does_time_take.lua
│   │   │   │   ├── ivy.lua
│   │   │   │   ├── new_index.lua
│   │   │   │   ├── ngrams.lua
│   │   │   │   ├── nvim_ffi.lua
│   │   │   │   ├── picker_locations.lua
│   │   │   │   ├── piped_to_fzf.lua
│   │   │   │   ├── prime_prompt_cache.lua
│   │   │   │   ├── rg_lua_jobstart.lua
│   │   │   │   ├── rocker_example.lua
│   │   │   │   ├── short_buf.lua
│   │   │   │   ├── simple_rg.lua
│   │   │   │   ├── simplest_test.lua
│   │   │   │   ├── slow_proc.sh
│   │   │   │   ├── string_distance_stuff.lua
│   │   │   │   ├── temp_goals.txt
│   │   │   │   ├── test_fuzzy_file.lua
│   │   │   │   ├── threaded_lua.lua
│   │   │   │   └── ts_example.lua
│   │   │   └── scripts
│   │   │       ├── gendocs.lua
│   │   │       └── minimal_init.vim
│   │   ├── vim-devicons
│   │   │   ├── CHANGELOG.md
│   │   │   ├── CODE_OF_CONDUCT.md
│   │   │   ├── CONTRIBUTING.md
│   │   │   ├── DEVELOPER.md
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── autoload
│   │   │   │   ├── airline
│   │   │   │   │   └── extensions
│   │   │   │   │       └── tabline
│   │   │   │   │           └── formatters
│   │   │   │   │               └── webdevicons.vim
│   │   │   │   ├── devicons
│   │   │   │   │   └── plugins
│   │   │   │   │       ├── ctrlp.vim
│   │   │   │   │       ├── denite.vim
│   │   │   │   │       ├── flagship.vim
│   │   │   │   │       ├── startify.vim
│   │   │   │   │       ├── unite.vim
│   │   │   │   │       └── vimfiler.vim
│   │   │   │   └── vimfiler
│   │   │   │       └── columns
│   │   │   │           └── devicons.vim
│   │   │   ├── doc
│   │   │   │   ├── tags
│   │   │   │   └── webdevicons.txt
│   │   │   ├── nerdtree_plugin
│   │   │   │   └── webdevicons.vim
│   │   │   ├── plugin
│   │   │   │   └── webdevicons.vim
│   │   │   ├── pythonx
│   │   │   │   └── vim_devicons
│   │   │   │       ├── __init__.py
│   │   │   │       └── powerline
│   │   │   │           ├── __init__.py
│   │   │   │           └── segments.py
│   │   │   ├── rplugin
│   │   │   │   └── python3
│   │   │   │       └── denite
│   │   │   │           └── filter
│   │   │   │               └── devicons_denite_converter.py
│   │   │   └── test
│   │   │       ├── default_setting.vim
│   │   │       ├── fileformat.vim
│   │   │       └── filetype.vim
│   │   ├── vim-github-dark
│   │   │   ├── LICENSE
│   │   │   ├── README.md
│   │   │   ├── assets
│   │   │   │   ├── airline1.png
│   │   │   │   ├── airline2.png
│   │   │   │   ├── airline3.png
│   │   │   │   ├── airline4.png
│   │   │   │   ├── colors.png
│   │   │   │   ├── lightline1.png
│   │   │   │   ├── lightline2.png
│   │   │   │   ├── lightline3.png
│   │   │   │   ├── lightline4.png
│   │   │   │   ├── screen-soft.png
│   │   │   │   ├── screen.png
│   │   │   │   └── screen1.png
│   │   │   ├── autoload
│   │   │   │   ├── airline
│   │   │   │   │   └── themes
│   │   │   │   │       └── ghdark.vim
│   │   │   │   └── lightline
│   │   │   │       └── colorscheme
│   │   │   │           └── ghdark.vim
│   │   │   └── colors
│   │   │       └── ghdark.vim
│   │   ├── vim-gotham
│   │   │   ├── LICENSE.txt
│   │   │   ├── README.md
│   │   │   ├── autoload
│   │   │   │   ├── airline
│   │   │   │   │   └── themes
│   │   │   │   │       ├── gotham.vim
│   │   │   │   │       └── gotham256.vim
│   │   │   │   └── lightline
│   │   │   │       └── colorscheme
│   │   │   │           ├── gotham.vim
│   │   │   │           └── gotham256.vim
│   │   │   └── colors
│   │   │       ├── gotham.vim
│   │   │       └── gotham256.vim
│   │   ├── vim-php-cs-fixer
│   │   │   ├── README.md
│   │   │   ├── autoload
│   │   │   │   └── php_cs_fixer.vim
│   │   │   ├── doc
│   │   │   │   ├── tags
│   │   │   │   └── vim-php-cs-fixer.txt
│   │   │   ├── plugin
│   │   │   │   └── php_cs_fixer.vim
│   │   │   └── tests
│   │   │       ├── fixtures
│   │   │       │   └── misc
│   │   │       │       ├── class_definition,no_trailing_whitespace.php
│   │   │       │       ├── imports.php
│   │   │       │       ├── no_closing_tag,full_opening_tag.php
│   │   │       │       ├── phpdoc_to_comment,phpdoc_var_without_name.php
│   │   │       │       ├── phpdocs.test.php
│   │   │       │       ├── semicolon_after_instruction,no_unneeded_control_parentheses.php
│   │   │       │       ├── simplified_null_return,no_useless_return,no_whitespace_in_blank_line,blank_line_before_return,no_extra_consecutive_blank_lines.php
│   │   │       │       └── single_import_per_statement,ordered_imports.php
│   │   │       ├── misc.vim
│   │   │       └── results
│   │   │           └── misc
│   │   │               ├── class_definition,no_trailing_whitespace.php
│   │   │               ├── imports.php
│   │   │               ├── no_closing_tag,full_opening_tag.php
│   │   │               ├── phpdoc_to_comment,phpdoc_var_without_name.php
│   │   │               ├── phpdocs.test.php
│   │   │               ├── semicolon_after_instruction,no_unneeded_control_parentheses.php
│   │   │               ├── simplified_null_return,no_useless_return,no_whitespace_in_blank_line,blank_line_before_return,no_extra_consecutive_blank_lines.php
│   │   │               └── single_import_per_statement,ordered_imports.php
│   │   └── vim-wakatime
│   │       ├── AUTHORS
│   │       ├── HISTORY.rst
│   │       ├── LICENSE.txt
│   │       ├── README.md
│   │       ├── doc
│   │       │   ├── tags
│   │       │   └── wakatime.txt
│   │       ├── packages
│   │       │   └── wakatime
│   │       │       ├── __about__.py
│   │       │       ├── __init__.py
│   │       │       ├── api.py
│   │       │       ├── arguments.py
│   │       │       ├── cli.py
│   │       │       ├── compat.py
│   │       │       ├── configs.py
│   │       │       ├── constants.py
│   │       │       ├── dependencies
│   │       │       │   ├── __init__.py
│   │       │       │   ├── c_cpp.py
│   │       │       │   ├── data.py
│   │       │       │   ├── dotnet.py
│   │       │       │   ├── elm.py
│   │       │       │   ├── go.py
│   │       │       │   ├── haskell.py
│   │       │       │   ├── haxe.py
│   │       │       │   ├── html.py
│   │       │       │   ├── javascript.py
│   │       │       │   ├── jvm.py
│   │       │       │   ├── objective.py
│   │       │       │   ├── php.py
│   │       │       │   ├── python.py
│   │       │       │   ├── rust.py
│   │       │       │   └── unknown.py
│   │       │       ├── exceptions.py
│   │       │       ├── heartbeat.py
│   │       │       ├── language_priorities.py
│   │       │       ├── languages
│   │       │       │   ├── default.json
│   │       │       │   └── vim.json
│   │       │       ├── logger.py
│   │       │       ├── main.py
│   │       │       ├── offlinequeue.py
│   │       │       ├── packages
│   │       │       │   ├── OpenSSL
│   │       │       │   │   ├── SSL.py
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── _util.py
│   │       │       │   │   ├── crypto.py
│   │       │       │   │   ├── debug.py
│   │       │       │   │   ├── rand.py
│   │       │       │   │   ├── tsafe.py
│   │       │       │   │   └── version.py
│   │       │       │   ├── __init__.py
│   │       │       │   ├── argparse.py
│   │       │       │   ├── certifi
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── __main__.py
│   │       │       │   │   ├── cacert.pem
│   │       │       │   │   └── core.py
│   │       │       │   ├── chardet
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── big5freq.py
│   │       │       │   │   ├── big5prober.py
│   │       │       │   │   ├── chardistribution.py
│   │       │       │   │   ├── charsetgroupprober.py
│   │       │       │   │   ├── charsetprober.py
│   │       │       │   │   ├── cli
│   │       │       │   │   │   ├── __init__.py
│   │       │       │   │   │   └── chardetect.py
│   │       │       │   │   ├── codingstatemachine.py
│   │       │       │   │   ├── compat.py
│   │       │       │   │   ├── cp949prober.py
│   │       │       │   │   ├── enums.py
│   │       │       │   │   ├── escprober.py
│   │       │       │   │   ├── escsm.py
│   │       │       │   │   ├── eucjpprober.py
│   │       │       │   │   ├── euckrfreq.py
│   │       │       │   │   ├── euckrprober.py
│   │       │       │   │   ├── euctwfreq.py
│   │       │       │   │   ├── euctwprober.py
│   │       │       │   │   ├── gb2312freq.py
│   │       │       │   │   ├── gb2312prober.py
│   │       │       │   │   ├── hebrewprober.py
│   │       │       │   │   ├── jisfreq.py
│   │       │       │   │   ├── jpcntx.py
│   │       │       │   │   ├── langbulgarianmodel.py
│   │       │       │   │   ├── langcyrillicmodel.py
│   │       │       │   │   ├── langgreekmodel.py
│   │       │       │   │   ├── langhebrewmodel.py
│   │       │       │   │   ├── langhungarianmodel.py
│   │       │       │   │   ├── langthaimodel.py
│   │       │       │   │   ├── langturkishmodel.py
│   │       │       │   │   ├── latin1prober.py
│   │       │       │   │   ├── mbcharsetprober.py
│   │       │       │   │   ├── mbcsgroupprober.py
│   │       │       │   │   ├── mbcssm.py
│   │       │       │   │   ├── sbcharsetprober.py
│   │       │       │   │   ├── sbcsgroupprober.py
│   │       │       │   │   ├── sjisprober.py
│   │       │       │   │   ├── universaldetector.py
│   │       │       │   │   ├── utf8prober.py
│   │       │       │   │   └── version.py
│   │       │       │   ├── configparser
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   └── helpers.py
│   │       │       │   ├── idna
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── codec.py
│   │       │       │   │   ├── compat.py
│   │       │       │   │   ├── core.py
│   │       │       │   │   ├── idnadata.py
│   │       │       │   │   ├── intranges.py
│   │       │       │   │   ├── package_data.py
│   │       │       │   │   └── uts46data.py
│   │       │       │   ├── ipaddress.py
│   │       │       │   ├── ntlm_auth
│   │       │       │   │   ├── U32.py
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── compute_hash.py
│   │       │       │   │   ├── compute_keys.py
│   │       │       │   │   ├── compute_response.py
│   │       │       │   │   ├── constants.py
│   │       │       │   │   ├── des.py
│   │       │       │   │   ├── des_c.py
│   │       │       │   │   ├── des_data.py
│   │       │       │   │   ├── gss_channel_bindings.py
│   │       │       │   │   ├── messages.py
│   │       │       │   │   ├── ntlm.py
│   │       │       │   │   ├── rc4.py
│   │       │       │   │   ├── session_security.py
│   │       │       │   │   └── target_info.py
│   │       │       │   ├── ordereddict.py
│   │       │       │   ├── py27
│   │       │       │   │   └── cryptography
│   │       │       │   │       ├── __about__.py
│   │       │       │   │       ├── __init__.py
│   │       │       │   │       ├── exceptions.py
│   │       │       │   │       ├── fernet.py
│   │       │       │   │       ├── hazmat
│   │       │       │   │       │   ├── __init__.py
│   │       │       │   │       │   ├── _der.py
│   │       │       │   │       │   ├── _oid.py
│   │       │       │   │       │   ├── backends
│   │       │       │   │       │   │   ├── __init__.py
│   │       │       │   │       │   │   ├── interfaces.py
│   │       │       │   │       │   │   └── openssl
│   │       │       │   │       │   │       ├── __init__.py
│   │       │       │   │       │   │       ├── aead.py
│   │       │       │   │       │   │       ├── backend.py
│   │       │       │   │       │   │       ├── ciphers.py
│   │       │       │   │       │   │       ├── cmac.py
│   │       │       │   │       │   │       ├── decode_asn1.py
│   │       │       │   │       │   │       ├── dh.py
│   │       │       │   │       │   │       ├── dsa.py
│   │       │       │   │       │   │       ├── ec.py
│   │       │       │   │       │   │       ├── ed25519.py
│   │       │       │   │       │   │       ├── ed448.py
│   │       │       │   │       │   │       ├── encode_asn1.py
│   │       │       │   │       │   │       ├── hashes.py
│   │       │       │   │       │   │       ├── hmac.py
│   │       │       │   │       │   │       ├── ocsp.py
│   │       │       │   │       │   │       ├── poly1305.py
│   │       │       │   │       │   │       ├── rsa.py
│   │       │       │   │       │   │       ├── utils.py
│   │       │       │   │       │   │       ├── x25519.py
│   │       │       │   │       │   │       ├── x448.py
│   │       │       │   │       │   │       └── x509.py
│   │       │       │   │       │   ├── bindings
│   │       │       │   │       │   │   ├── __init__.py
│   │       │       │   │       │   │   └── openssl
│   │       │       │   │       │   │       ├── __init__.py
│   │       │       │   │       │   │       ├── _conditional.py
│   │       │       │   │       │   │       └── binding.py
│   │       │       │   │       │   └── primitives
│   │       │       │   │       │       ├── __init__.py
│   │       │       │   │       │       ├── asymmetric
│   │       │       │   │       │       │   ├── __init__.py
│   │       │       │   │       │       │   ├── dh.py
│   │       │       │   │       │       │   ├── dsa.py
│   │       │       │   │       │       │   ├── ec.py
│   │       │       │   │       │       │   ├── ed25519.py
│   │       │       │   │       │       │   ├── ed448.py
│   │       │       │   │       │       │   ├── padding.py
│   │       │       │   │       │       │   ├── rsa.py
│   │       │       │   │       │       │   ├── utils.py
│   │       │       │   │       │       │   ├── x25519.py
│   │       │       │   │       │       │   └── x448.py
│   │       │       │   │       │       ├── ciphers
│   │       │       │   │       │       │   ├── __init__.py
│   │       │       │   │       │       │   ├── aead.py
│   │       │       │   │       │       │   ├── algorithms.py
│   │       │       │   │       │       │   ├── base.py
│   │       │       │   │       │       │   └── modes.py
│   │       │       │   │       │       ├── cmac.py
│   │       │       │   │       │       ├── constant_time.py
│   │       │       │   │       │       ├── hashes.py
│   │       │       │   │       │       ├── hmac.py
│   │       │       │   │       │       ├── kdf
│   │       │       │   │       │       │   ├── __init__.py
│   │       │       │   │       │       │   ├── concatkdf.py
│   │       │       │   │       │       │   ├── hkdf.py
│   │       │       │   │       │       │   ├── kbkdf.py
│   │       │       │   │       │       │   ├── pbkdf2.py
│   │       │       │   │       │       │   ├── scrypt.py
│   │       │       │   │       │       │   └── x963kdf.py
│   │       │       │   │       │       ├── keywrap.py
│   │       │       │   │       │       ├── padding.py
│   │       │       │   │       │       ├── poly1305.py
│   │       │       │   │       │       ├── serialization
│   │       │       │   │       │       │   ├── __init__.py
│   │       │       │   │       │       │   ├── base.py
│   │       │       │   │       │       │   ├── pkcs12.py
│   │       │       │   │       │       │   └── ssh.py
│   │       │       │   │       │       └── twofactor
│   │       │       │   │       │           ├── __init__.py
│   │       │       │   │       │           ├── hotp.py
│   │       │       │   │       │           ├── totp.py
│   │       │       │   │       │           └── utils.py
│   │       │       │   │       ├── utils.py
│   │       │       │   │       └── x509
│   │       │       │   │           ├── __init__.py
│   │       │       │   │           ├── base.py
│   │       │       │   │           ├── certificate_transparency.py
│   │       │       │   │           ├── extensions.py
│   │       │       │   │           ├── general_name.py
│   │       │       │   │           ├── name.py
│   │       │       │   │           ├── ocsp.py
│   │       │       │   │           └── oid.py
│   │       │       │   ├── pygments
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── cmdline.py
│   │       │       │   │   ├── console.py
│   │       │       │   │   ├── filter.py
│   │       │       │   │   ├── filters
│   │       │       │   │   │   └── __init__.py
│   │       │       │   │   ├── formatter.py
│   │       │       │   │   ├── formatters
│   │       │       │   │   │   ├── __init__.py
│   │       │       │   │   │   ├── _mapping.py
│   │       │       │   │   │   ├── bbcode.py
│   │       │       │   │   │   ├── html.py
│   │       │       │   │   │   ├── img.py
│   │       │       │   │   │   ├── irc.py
│   │       │       │   │   │   ├── latex.py
│   │       │       │   │   │   ├── other.py
│   │       │       │   │   │   ├── rtf.py
│   │       │       │   │   │   ├── svg.py
│   │       │       │   │   │   ├── terminal.py
│   │       │       │   │   │   └── terminal256.py
│   │       │       │   │   ├── lexer.py
│   │       │       │   │   ├── lexers
│   │       │       │   │   │   ├── __init__.py
│   │       │       │   │   │   ├── _asy_builtins.py
│   │       │       │   │   │   ├── _cl_builtins.py
│   │       │       │   │   │   ├── _cocoa_builtins.py
│   │       │       │   │   │   ├── _csound_builtins.py
│   │       │       │   │   │   ├── _lasso_builtins.py
│   │       │       │   │   │   ├── _lua_builtins.py
│   │       │       │   │   │   ├── _mapping.py
│   │       │       │   │   │   ├── _mql_builtins.py
│   │       │       │   │   │   ├── _openedge_builtins.py
│   │       │       │   │   │   ├── _php_builtins.py
│   │       │       │   │   │   ├── _postgres_builtins.py
│   │       │       │   │   │   ├── _scilab_builtins.py
│   │       │       │   │   │   ├── _sourcemod_builtins.py
│   │       │       │   │   │   ├── _stan_builtins.py
│   │       │       │   │   │   ├── _stata_builtins.py
│   │       │       │   │   │   ├── _tsql_builtins.py
│   │       │       │   │   │   ├── _vim_builtins.py
│   │       │       │   │   │   ├── actionscript.py
│   │       │       │   │   │   ├── agile.py
│   │       │       │   │   │   ├── algebra.py
│   │       │       │   │   │   ├── ambient.py
│   │       │       │   │   │   ├── ampl.py
│   │       │       │   │   │   ├── apl.py
│   │       │       │   │   │   ├── archetype.py
│   │       │       │   │   │   ├── asm.py
│   │       │       │   │   │   ├── automation.py
│   │       │       │   │   │   ├── basic.py
│   │       │       │   │   │   ├── bibtex.py
│   │       │       │   │   │   ├── business.py
│   │       │       │   │   │   ├── c_cpp.py
│   │       │       │   │   │   ├── c_like.py
│   │       │       │   │   │   ├── capnproto.py
│   │       │       │   │   │   ├── chapel.py
│   │       │       │   │   │   ├── clean.py
│   │       │       │   │   │   ├── compiled.py
│   │       │       │   │   │   ├── configs.py
│   │       │       │   │   │   ├── console.py
│   │       │       │   │   │   ├── crystal.py
│   │       │       │   │   │   ├── csound.py
│   │       │       │   │   │   ├── css.py
│   │       │       │   │   │   ├── d.py
│   │       │       │   │   │   ├── dalvik.py
│   │       │       │   │   │   ├── data.py
│   │       │       │   │   │   ├── diff.py
│   │       │       │   │   │   ├── dotnet.py
│   │       │       │   │   │   ├── dsls.py
│   │       │       │   │   │   ├── dylan.py
│   │       │       │   │   │   ├── ecl.py
│   │       │       │   │   │   ├── eiffel.py
│   │       │       │   │   │   ├── elm.py
│   │       │       │   │   │   ├── erlang.py
│   │       │       │   │   │   ├── esoteric.py
│   │       │       │   │   │   ├── ezhil.py
│   │       │       │   │   │   ├── factor.py
│   │       │       │   │   │   ├── fantom.py
│   │       │       │   │   │   ├── felix.py
│   │       │       │   │   │   ├── forth.py
│   │       │       │   │   │   ├── fortran.py
│   │       │       │   │   │   ├── foxpro.py
│   │       │       │   │   │   ├── functional.py
│   │       │       │   │   │   ├── go.py
│   │       │       │   │   │   ├── grammar_notation.py
│   │       │       │   │   │   ├── graph.py
│   │       │       │   │   │   ├── graphics.py
│   │       │       │   │   │   ├── haskell.py
│   │       │       │   │   │   ├── haxe.py
│   │       │       │   │   │   ├── hdl.py
│   │       │       │   │   │   ├── hexdump.py
│   │       │       │   │   │   ├── html.py
│   │       │       │   │   │   ├── idl.py
│   │       │       │   │   │   ├── igor.py
│   │       │       │   │   │   ├── inferno.py
│   │       │       │   │   │   ├── installers.py
│   │       │       │   │   │   ├── int_fiction.py
│   │       │       │   │   │   ├── iolang.py
│   │       │       │   │   │   ├── j.py
│   │       │       │   │   │   ├── javascript.py
│   │       │       │   │   │   ├── julia.py
│   │       │       │   │   │   ├── jvm.py
│   │       │       │   │   │   ├── lisp.py
│   │       │       │   │   │   ├── make.py
│   │       │       │   │   │   ├── markup.py
│   │       │       │   │   │   ├── math.py
│   │       │       │   │   │   ├── matlab.py
│   │       │       │   │   │   ├── ml.py
│   │       │       │   │   │   ├── modeling.py
│   │       │       │   │   │   ├── modula2.py
│   │       │       │   │   │   ├── monte.py
│   │       │       │   │   │   ├── ncl.py
│   │       │       │   │   │   ├── nimrod.py
│   │       │       │   │   │   ├── nit.py
│   │       │       │   │   │   ├── nix.py
│   │       │       │   │   │   ├── oberon.py
│   │       │       │   │   │   ├── objective.py
│   │       │       │   │   │   ├── ooc.py
│   │       │       │   │   │   ├── other.py
│   │       │       │   │   │   ├── parasail.py
│   │       │       │   │   │   ├── parsers.py
│   │       │       │   │   │   ├── pascal.py
│   │       │       │   │   │   ├── pawn.py
│   │       │       │   │   │   ├── perl.py
│   │       │       │   │   │   ├── php.py
│   │       │       │   │   │   ├── praat.py
│   │       │       │   │   │   ├── prolog.py
│   │       │       │   │   │   ├── python.py
│   │       │       │   │   │   ├── qvt.py
│   │       │       │   │   │   ├── r.py
│   │       │       │   │   │   ├── rdf.py
│   │       │       │   │   │   ├── rebol.py
│   │       │       │   │   │   ├── resource.py
│   │       │       │   │   │   ├── rnc.py
│   │       │       │   │   │   ├── roboconf.py
│   │       │       │   │   │   ├── robotframework.py
│   │       │       │   │   │   ├── ruby.py
│   │       │       │   │   │   ├── rust.py
│   │       │       │   │   │   ├── sas.py
│   │       │       │   │   │   ├── scripting.py
│   │       │       │   │   │   ├── shell.py
│   │       │       │   │   │   ├── smalltalk.py
│   │       │       │   │   │   ├── smv.py
│   │       │       │   │   │   ├── snobol.py
│   │       │       │   │   │   ├── special.py
│   │       │       │   │   │   ├── sql.py
│   │       │       │   │   │   ├── stata.py
│   │       │       │   │   │   ├── supercollider.py
│   │       │       │   │   │   ├── tcl.py
│   │       │       │   │   │   ├── templates.py
│   │       │       │   │   │   ├── testing.py
│   │       │       │   │   │   ├── text.py
│   │       │       │   │   │   ├── textedit.py
│   │       │       │   │   │   ├── textfmts.py
│   │       │       │   │   │   ├── theorem.py
│   │       │       │   │   │   ├── trafficscript.py
│   │       │       │   │   │   ├── typoscript.py
│   │       │       │   │   │   ├── urbi.py
│   │       │       │   │   │   ├── varnish.py
│   │       │       │   │   │   ├── verification.py
│   │       │       │   │   │   ├── web.py
│   │       │       │   │   │   ├── webmisc.py
│   │       │       │   │   │   ├── whiley.py
│   │       │       │   │   │   ├── x10.py
│   │       │       │   │   │   └── xorg.py
│   │       │       │   │   ├── modeline.py
│   │       │       │   │   ├── plugin.py
│   │       │       │   │   ├── regexopt.py
│   │       │       │   │   ├── scanner.py
│   │       │       │   │   ├── sphinxext.py
│   │       │       │   │   ├── style.py
│   │       │       │   │   ├── styles
│   │       │       │   │   │   ├── __init__.py
│   │       │       │   │   │   ├── abap.py
│   │       │       │   │   │   ├── algol.py
│   │       │       │   │   │   ├── algol_nu.py
│   │       │       │   │   │   ├── arduino.py
│   │       │       │   │   │   ├── autumn.py
│   │       │       │   │   │   ├── borland.py
│   │       │       │   │   │   ├── bw.py
│   │       │       │   │   │   ├── colorful.py
│   │       │       │   │   │   ├── default.py
│   │       │       │   │   │   ├── emacs.py
│   │       │       │   │   │   ├── friendly.py
│   │       │       │   │   │   ├── fruity.py
│   │       │       │   │   │   ├── igor.py
│   │       │       │   │   │   ├── lovelace.py
│   │       │       │   │   │   ├── manni.py
│   │       │       │   │   │   ├── monokai.py
│   │       │       │   │   │   ├── murphy.py
│   │       │       │   │   │   ├── native.py
│   │       │       │   │   │   ├── paraiso_dark.py
│   │       │       │   │   │   ├── paraiso_light.py
│   │       │       │   │   │   ├── pastie.py
│   │       │       │   │   │   ├── perldoc.py
│   │       │       │   │   │   ├── rainbow_dash.py
│   │       │       │   │   │   ├── rrt.py
│   │       │       │   │   │   ├── sas.py
│   │       │       │   │   │   ├── stata.py
│   │       │       │   │   │   ├── tango.py
│   │       │       │   │   │   ├── trac.py
│   │       │       │   │   │   ├── vim.py
│   │       │       │   │   │   ├── vs.py
│   │       │       │   │   │   └── xcode.py
│   │       │       │   │   ├── token.py
│   │       │       │   │   ├── unistring.py
│   │       │       │   │   └── util.py
│   │       │       │   ├── pytz
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── exceptions.py
│   │       │       │   │   ├── lazy.py
│   │       │       │   │   ├── reference.py
│   │       │       │   │   ├── tzfile.py
│   │       │       │   │   ├── tzinfo.py
│   │       │       │   │   └── zoneinfo
│   │       │       │   │       ├── Africa
│   │       │       │   │       │   ├── Abidjan
│   │       │       │   │       │   ├── Accra
│   │       │       │   │       │   ├── Addis_Ababa
│   │       │       │   │       │   ├── Algiers
│   │       │       │   │       │   ├── Asmara
│   │       │       │   │       │   ├── Asmera
│   │       │       │   │       │   ├── Bamako
│   │       │       │   │       │   ├── Bangui
│   │       │       │   │       │   ├── Banjul
│   │       │       │   │       │   ├── Bissau
│   │       │       │   │       │   ├── Blantyre
│   │       │       │   │       │   ├── Brazzaville
│   │       │       │   │       │   ├── Bujumbura
│   │       │       │   │       │   ├── Cairo
│   │       │       │   │       │   ├── Casablanca
│   │       │       │   │       │   ├── Ceuta
│   │       │       │   │       │   ├── Conakry
│   │       │       │   │       │   ├── Dakar
│   │       │       │   │       │   ├── Dar_es_Salaam
│   │       │       │   │       │   ├── Djibouti
│   │       │       │   │       │   ├── Douala
│   │       │       │   │       │   ├── El_Aaiun
│   │       │       │   │       │   ├── Freetown
│   │       │       │   │       │   ├── Gaborone
│   │       │       │   │       │   ├── Harare
│   │       │       │   │       │   ├── Johannesburg
│   │       │       │   │       │   ├── Juba
│   │       │       │   │       │   ├── Kampala
│   │       │       │   │       │   ├── Khartoum
│   │       │       │   │       │   ├── Kigali
│   │       │       │   │       │   ├── Kinshasa
│   │       │       │   │       │   ├── Lagos
│   │       │       │   │       │   ├── Libreville
│   │       │       │   │       │   ├── Lome
│   │       │       │   │       │   ├── Luanda
│   │       │       │   │       │   ├── Lubumbashi
│   │       │       │   │       │   ├── Lusaka
│   │       │       │   │       │   ├── Malabo
│   │       │       │   │       │   ├── Maputo
│   │       │       │   │       │   ├── Maseru
│   │       │       │   │       │   ├── Mbabane
│   │       │       │   │       │   ├── Mogadishu
│   │       │       │   │       │   ├── Monrovia
│   │       │       │   │       │   ├── Nairobi
│   │       │       │   │       │   ├── Ndjamena
│   │       │       │   │       │   ├── Niamey
│   │       │       │   │       │   ├── Nouakchott
│   │       │       │   │       │   ├── Ouagadougou
│   │       │       │   │       │   ├── Porto-Novo
│   │       │       │   │       │   ├── Sao_Tome
│   │       │       │   │       │   ├── Timbuktu
│   │       │       │   │       │   ├── Tripoli
│   │       │       │   │       │   ├── Tunis
│   │       │       │   │       │   └── Windhoek
│   │       │       │   │       ├── America
│   │       │       │   │       │   ├── Adak
│   │       │       │   │       │   ├── Anchorage
│   │       │       │   │       │   ├── Anguilla
│   │       │       │   │       │   ├── Antigua
│   │       │       │   │       │   ├── Araguaina
│   │       │       │   │       │   ├── Argentina
│   │       │       │   │       │   │   ├── Buenos_Aires
│   │       │       │   │       │   │   ├── Catamarca
│   │       │       │   │       │   │   ├── ComodRivadavia
│   │       │       │   │       │   │   ├── Cordoba
│   │       │       │   │       │   │   ├── Jujuy
│   │       │       │   │       │   │   ├── La_Rioja
│   │       │       │   │       │   │   ├── Mendoza
│   │       │       │   │       │   │   ├── Rio_Gallegos
│   │       │       │   │       │   │   ├── Salta
│   │       │       │   │       │   │   ├── San_Juan
│   │       │       │   │       │   │   ├── San_Luis
│   │       │       │   │       │   │   ├── Tucuman
│   │       │       │   │       │   │   └── Ushuaia
│   │       │       │   │       │   ├── Aruba
│   │       │       │   │       │   ├── Asuncion
│   │       │       │   │       │   ├── Atikokan
│   │       │       │   │       │   ├── Atka
│   │       │       │   │       │   ├── Bahia
│   │       │       │   │       │   ├── Bahia_Banderas
│   │       │       │   │       │   ├── Barbados
│   │       │       │   │       │   ├── Belem
│   │       │       │   │       │   ├── Belize
│   │       │       │   │       │   ├── Blanc-Sablon
│   │       │       │   │       │   ├── Boa_Vista
│   │       │       │   │       │   ├── Bogota
│   │       │       │   │       │   ├── Boise
│   │       │       │   │       │   ├── Buenos_Aires
│   │       │       │   │       │   ├── Cambridge_Bay
│   │       │       │   │       │   ├── Campo_Grande
│   │       │       │   │       │   ├── Cancun
│   │       │       │   │       │   ├── Caracas
│   │       │       │   │       │   ├── Catamarca
│   │       │       │   │       │   ├── Cayenne
│   │       │       │   │       │   ├── Cayman
│   │       │       │   │       │   ├── Chicago
│   │       │       │   │       │   ├── Chihuahua
│   │       │       │   │       │   ├── Coral_Harbour
│   │       │       │   │       │   ├── Cordoba
│   │       │       │   │       │   ├── Costa_Rica
│   │       │       │   │       │   ├── Creston
│   │       │       │   │       │   ├── Cuiaba
│   │       │       │   │       │   ├── Curacao
│   │       │       │   │       │   ├── Danmarkshavn
│   │       │       │   │       │   ├── Dawson
│   │       │       │   │       │   ├── Dawson_Creek
│   │       │       │   │       │   ├── Denver
│   │       │       │   │       │   ├── Detroit
│   │       │       │   │       │   ├── Dominica
│   │       │       │   │       │   ├── Edmonton
│   │       │       │   │       │   ├── Eirunepe
│   │       │       │   │       │   ├── El_Salvador
│   │       │       │   │       │   ├── Ensenada
│   │       │       │   │       │   ├── Fort_Nelson
│   │       │       │   │       │   ├── Fort_Wayne
│   │       │       │   │       │   ├── Fortaleza
│   │       │       │   │       │   ├── Glace_Bay
│   │       │       │   │       │   ├── Godthab
│   │       │       │   │       │   ├── Goose_Bay
│   │       │       │   │       │   ├── Grand_Turk
│   │       │       │   │       │   ├── Grenada
│   │       │       │   │       │   ├── Guadeloupe
│   │       │       │   │       │   ├── Guatemala
│   │       │       │   │       │   ├── Guayaquil
│   │       │       │   │       │   ├── Guyana
│   │       │       │   │       │   ├── Halifax
│   │       │       │   │       │   ├── Havana
│   │       │       │   │       │   ├── Hermosillo
│   │       │       │   │       │   ├── Indiana
│   │       │       │   │       │   │   ├── Indianapolis
│   │       │       │   │       │   │   ├── Knox
│   │       │       │   │       │   │   ├── Marengo
│   │       │       │   │       │   │   ├── Petersburg
│   │       │       │   │       │   │   ├── Tell_City
│   │       │       │   │       │   │   ├── Vevay
│   │       │       │   │       │   │   ├── Vincennes
│   │       │       │   │       │   │   └── Winamac
│   │       │       │   │       │   ├── Indianapolis
│   │       │       │   │       │   ├── Inuvik
│   │       │       │   │       │   ├── Iqaluit
│   │       │       │   │       │   ├── Jamaica
│   │       │       │   │       │   ├── Jujuy
│   │       │       │   │       │   ├── Juneau
│   │       │       │   │       │   ├── Kentucky
│   │       │       │   │       │   │   ├── Louisville
│   │       │       │   │       │   │   └── Monticello
│   │       │       │   │       │   ├── Knox_IN
│   │       │       │   │       │   ├── Kralendijk
│   │       │       │   │       │   ├── La_Paz
│   │       │       │   │       │   ├── Lima
│   │       │       │   │       │   ├── Los_Angeles
│   │       │       │   │       │   ├── Louisville
│   │       │       │   │       │   ├── Lower_Princes
│   │       │       │   │       │   ├── Maceio
│   │       │       │   │       │   ├── Managua
│   │       │       │   │       │   ├── Manaus
│   │       │       │   │       │   ├── Marigot
│   │       │       │   │       │   ├── Martinique
│   │       │       │   │       │   ├── Matamoros
│   │       │       │   │       │   ├── Mazatlan
│   │       │       │   │       │   ├── Mendoza
│   │       │       │   │       │   ├── Menominee
│   │       │       │   │       │   ├── Merida
│   │       │       │   │       │   ├── Metlakatla
│   │       │       │   │       │   ├── Mexico_City
│   │       │       │   │       │   ├── Miquelon
│   │       │       │   │       │   ├── Moncton
│   │       │       │   │       │   ├── Monterrey
│   │       │       │   │       │   ├── Montevideo
│   │       │       │   │       │   ├── Montreal
│   │       │       │   │       │   ├── Montserrat
│   │       │       │   │       │   ├── Nassau
│   │       │       │   │       │   ├── New_York
│   │       │       │   │       │   ├── Nipigon
│   │       │       │   │       │   ├── Nome
│   │       │       │   │       │   ├── Noronha
│   │       │       │   │       │   ├── North_Dakota
│   │       │       │   │       │   │   ├── Beulah
│   │       │       │   │       │   │   ├── Center
│   │       │       │   │       │   │   └── New_Salem
│   │       │       │   │       │   ├── Ojinaga
│   │       │       │   │       │   ├── Panama
│   │       │       │   │       │   ├── Pangnirtung
│   │       │       │   │       │   ├── Paramaribo
│   │       │       │   │       │   ├── Phoenix
│   │       │       │   │       │   ├── Port-au-Prince
│   │       │       │   │       │   ├── Port_of_Spain
│   │       │       │   │       │   ├── Porto_Acre
│   │       │       │   │       │   ├── Porto_Velho
│   │       │       │   │       │   ├── Puerto_Rico
│   │       │       │   │       │   ├── Punta_Arenas
│   │       │       │   │       │   ├── Rainy_River
│   │       │       │   │       │   ├── Rankin_Inlet
│   │       │       │   │       │   ├── Recife
│   │       │       │   │       │   ├── Regina
│   │       │       │   │       │   ├── Resolute
│   │       │       │   │       │   ├── Rio_Branco
│   │       │       │   │       │   ├── Rosario
│   │       │       │   │       │   ├── Santa_Isabel
│   │       │       │   │       │   ├── Santarem
│   │       │       │   │       │   ├── Santiago
│   │       │       │   │       │   ├── Santo_Domingo
│   │       │       │   │       │   ├── Sao_Paulo
│   │       │       │   │       │   ├── Scoresbysund
│   │       │       │   │       │   ├── Shiprock
│   │       │       │   │       │   ├── Sitka
│   │       │       │   │       │   ├── St_Barthelemy
│   │       │       │   │       │   ├── St_Johns
│   │       │       │   │       │   ├── St_Kitts
│   │       │       │   │       │   ├── St_Lucia
│   │       │       │   │       │   ├── St_Thomas
│   │       │       │   │       │   ├── St_Vincent
│   │       │       │   │       │   ├── Swift_Current
│   │       │       │   │       │   ├── Tegucigalpa
│   │       │       │   │       │   ├── Thule
│   │       │       │   │       │   ├── Thunder_Bay
│   │       │       │   │       │   ├── Tijuana
│   │       │       │   │       │   ├── Toronto
│   │       │       │   │       │   ├── Tortola
│   │       │       │   │       │   ├── Vancouver
│   │       │       │   │       │   ├── Virgin
│   │       │       │   │       │   ├── Whitehorse
│   │       │       │   │       │   ├── Winnipeg
│   │       │       │   │       │   ├── Yakutat
│   │       │       │   │       │   └── Yellowknife
│   │       │       │   │       ├── Antarctica
│   │       │       │   │       │   ├── Casey
│   │       │       │   │       │   ├── Davis
│   │       │       │   │       │   ├── DumontDUrville
│   │       │       │   │       │   ├── Macquarie
│   │       │       │   │       │   ├── Mawson
│   │       │       │   │       │   ├── McMurdo
│   │       │       │   │       │   ├── Palmer
│   │       │       │   │       │   ├── Rothera
│   │       │       │   │       │   ├── South_Pole
│   │       │       │   │       │   ├── Syowa
│   │       │       │   │       │   ├── Troll
│   │       │       │   │       │   └── Vostok
│   │       │       │   │       ├── Arctic
│   │       │       │   │       │   └── Longyearbyen
│   │       │       │   │       ├── Asia
│   │       │       │   │       │   ├── Aden
│   │       │       │   │       │   ├── Almaty
│   │       │       │   │       │   ├── Amman
│   │       │       │   │       │   ├── Anadyr
│   │       │       │   │       │   ├── Aqtau
│   │       │       │   │       │   ├── Aqtobe
│   │       │       │   │       │   ├── Ashgabat
│   │       │       │   │       │   ├── Ashkhabad
│   │       │       │   │       │   ├── Atyrau
│   │       │       │   │       │   ├── Baghdad
│   │       │       │   │       │   ├── Bahrain
│   │       │       │   │       │   ├── Baku
│   │       │       │   │       │   ├── Bangkok
│   │       │       │   │       │   ├── Barnaul
│   │       │       │   │       │   ├── Beirut
│   │       │       │   │       │   ├── Bishkek
│   │       │       │   │       │   ├── Brunei
│   │       │       │   │       │   ├── Calcutta
│   │       │       │   │       │   ├── Chita
│   │       │       │   │       │   ├── Choibalsan
│   │       │       │   │       │   ├── Chongqing
│   │       │       │   │       │   ├── Chungking
│   │       │       │   │       │   ├── Colombo
│   │       │       │   │       │   ├── Dacca
│   │       │       │   │       │   ├── Damascus
│   │       │       │   │       │   ├── Dhaka
│   │       │       │   │       │   ├── Dili
│   │       │       │   │       │   ├── Dubai
│   │       │       │   │       │   ├── Dushanbe
│   │       │       │   │       │   ├── Famagusta
│   │       │       │   │       │   ├── Gaza
│   │       │       │   │       │   ├── Harbin
│   │       │       │   │       │   ├── Hebron
│   │       │       │   │       │   ├── Ho_Chi_Minh
│   │       │       │   │       │   ├── Hong_Kong
│   │       │       │   │       │   ├── Hovd
│   │       │       │   │       │   ├── Irkutsk
│   │       │       │   │       │   ├── Istanbul
│   │       │       │   │       │   ├── Jakarta
│   │       │       │   │       │   ├── Jayapura
│   │       │       │   │       │   ├── Jerusalem
│   │       │       │   │       │   ├── Kabul
│   │       │       │   │       │   ├── Kamchatka
│   │       │       │   │       │   ├── Karachi
│   │       │       │   │       │   ├── Kashgar
│   │       │       │   │       │   ├── Kathmandu
│   │       │       │   │       │   ├── Katmandu
│   │       │       │   │       │   ├── Khandyga
│   │       │       │   │       │   ├── Kolkata
│   │       │       │   │       │   ├── Krasnoyarsk
│   │       │       │   │       │   ├── Kuala_Lumpur
│   │       │       │   │       │   ├── Kuching
│   │       │       │   │       │   ├── Kuwait
│   │       │       │   │       │   ├── Macao
│   │       │       │   │       │   ├── Macau
│   │       │       │   │       │   ├── Magadan
│   │       │       │   │       │   ├── Makassar
│   │       │       │   │       │   ├── Manila
│   │       │       │   │       │   ├── Muscat
│   │       │       │   │       │   ├── Nicosia
│   │       │       │   │       │   ├── Novokuznetsk
│   │       │       │   │       │   ├── Novosibirsk
│   │       │       │   │       │   ├── Omsk
│   │       │       │   │       │   ├── Oral
│   │       │       │   │       │   ├── Phnom_Penh
│   │       │       │   │       │   ├── Pontianak
│   │       │       │   │       │   ├── Pyongyang
│   │       │       │   │       │   ├── Qatar
│   │       │       │   │       │   ├── Qyzylorda
│   │       │       │   │       │   ├── Rangoon
│   │       │       │   │       │   ├── Riyadh
│   │       │       │   │       │   ├── Saigon
│   │       │       │   │       │   ├── Sakhalin
│   │       │       │   │       │   ├── Samarkand
│   │       │       │   │       │   ├── Seoul
│   │       │       │   │       │   ├── Shanghai
│   │       │       │   │       │   ├── Singapore
│   │       │       │   │       │   ├── Srednekolymsk
│   │       │       │   │       │   ├── Taipei
│   │       │       │   │       │   ├── Tashkent
│   │       │       │   │       │   ├── Tbilisi
│   │       │       │   │       │   ├── Tehran
│   │       │       │   │       │   ├── Tel_Aviv
│   │       │       │   │       │   ├── Thimbu
│   │       │       │   │       │   ├── Thimphu
│   │       │       │   │       │   ├── Tokyo
│   │       │       │   │       │   ├── Tomsk
│   │       │       │   │       │   ├── Ujung_Pandang
│   │       │       │   │       │   ├── Ulaanbaatar
│   │       │       │   │       │   ├── Ulan_Bator
│   │       │       │   │       │   ├── Urumqi
│   │       │       │   │       │   ├── Ust-Nera
│   │       │       │   │       │   ├── Vientiane
│   │       │       │   │       │   ├── Vladivostok
│   │       │       │   │       │   ├── Yakutsk
│   │       │       │   │       │   ├── Yangon
│   │       │       │   │       │   ├── Yekaterinburg
│   │       │       │   │       │   └── Yerevan
│   │       │       │   │       ├── Atlantic
│   │       │       │   │       │   ├── Azores
│   │       │       │   │       │   ├── Bermuda
│   │       │       │   │       │   ├── Canary
│   │       │       │   │       │   ├── Cape_Verde
│   │       │       │   │       │   ├── Faeroe
│   │       │       │   │       │   ├── Faroe
│   │       │       │   │       │   ├── Jan_Mayen
│   │       │       │   │       │   ├── Madeira
│   │       │       │   │       │   ├── Reykjavik
│   │       │       │   │       │   ├── South_Georgia
│   │       │       │   │       │   ├── St_Helena
│   │       │       │   │       │   └── Stanley
│   │       │       │   │       ├── Australia
│   │       │       │   │       │   ├── ACT
│   │       │       │   │       │   ├── Adelaide
│   │       │       │   │       │   ├── Brisbane
│   │       │       │   │       │   ├── Broken_Hill
│   │       │       │   │       │   ├── Canberra
│   │       │       │   │       │   ├── Currie
│   │       │       │   │       │   ├── Darwin
│   │       │       │   │       │   ├── Eucla
│   │       │       │   │       │   ├── Hobart
│   │       │       │   │       │   ├── LHI
│   │       │       │   │       │   ├── Lindeman
│   │       │       │   │       │   ├── Lord_Howe
│   │       │       │   │       │   ├── Melbourne
│   │       │       │   │       │   ├── NSW
│   │       │       │   │       │   ├── North
│   │       │       │   │       │   ├── Perth
│   │       │       │   │       │   ├── Queensland
│   │       │       │   │       │   ├── South
│   │       │       │   │       │   ├── Sydney
│   │       │       │   │       │   ├── Tasmania
│   │       │       │   │       │   ├── Victoria
│   │       │       │   │       │   ├── West
│   │       │       │   │       │   └── Yancowinna
│   │       │       │   │       ├── Brazil
│   │       │       │   │       │   ├── Acre
│   │       │       │   │       │   ├── DeNoronha
│   │       │       │   │       │   ├── East
│   │       │       │   │       │   └── West
│   │       │       │   │       ├── CET
│   │       │       │   │       ├── CST6CDT
│   │       │       │   │       ├── Canada
│   │       │       │   │       │   ├── Atlantic
│   │       │       │   │       │   ├── Central
│   │       │       │   │       │   ├── East-Saskatchewan
│   │       │       │   │       │   ├── Eastern
│   │       │       │   │       │   ├── Mountain
│   │       │       │   │       │   ├── Newfoundland
│   │       │       │   │       │   ├── Pacific
│   │       │       │   │       │   ├── Saskatchewan
│   │       │       │   │       │   └── Yukon
│   │       │       │   │       ├── Chile
│   │       │       │   │       │   ├── Continental
│   │       │       │   │       │   └── EasterIsland
│   │       │       │   │       ├── Cuba
│   │       │       │   │       ├── EET
│   │       │       │   │       ├── EST
│   │       │       │   │       ├── EST5EDT
│   │       │       │   │       ├── Egypt
│   │       │       │   │       ├── Eire
│   │       │       │   │       ├── Etc
│   │       │       │   │       │   ├── GMT
│   │       │       │   │       │   ├── GMT+0
│   │       │       │   │       │   ├── GMT+1
│   │       │       │   │       │   ├── GMT+10
│   │       │       │   │       │   ├── GMT+11
│   │       │       │   │       │   ├── GMT+12
│   │       │       │   │       │   ├── GMT+2
│   │       │       │   │       │   ├── GMT+3
│   │       │       │   │       │   ├── GMT+4
│   │       │       │   │       │   ├── GMT+5
│   │       │       │   │       │   ├── GMT+6
│   │       │       │   │       │   ├── GMT+7
│   │       │       │   │       │   ├── GMT+8
│   │       │       │   │       │   ├── GMT+9
│   │       │       │   │       │   ├── GMT-0
│   │       │       │   │       │   ├── GMT-1
│   │       │       │   │       │   ├── GMT-10
│   │       │       │   │       │   ├── GMT-11
│   │       │       │   │       │   ├── GMT-12
│   │       │       │   │       │   ├── GMT-13
│   │       │       │   │       │   ├── GMT-14
│   │       │       │   │       │   ├── GMT-2
│   │       │       │   │       │   ├── GMT-3
│   │       │       │   │       │   ├── GMT-4
│   │       │       │   │       │   ├── GMT-5
│   │       │       │   │       │   ├── GMT-6
│   │       │       │   │       │   ├── GMT-7
│   │       │       │   │       │   ├── GMT-8
│   │       │       │   │       │   ├── GMT-9
│   │       │       │   │       │   ├── GMT0
│   │       │       │   │       │   ├── Greenwich
│   │       │       │   │       │   ├── UCT
│   │       │       │   │       │   ├── UTC
│   │       │       │   │       │   ├── Universal
│   │       │       │   │       │   └── Zulu
│   │       │       │   │       ├── Europe
│   │       │       │   │       │   ├── Amsterdam
│   │       │       │   │       │   ├── Andorra
│   │       │       │   │       │   ├── Astrakhan
│   │       │       │   │       │   ├── Athens
│   │       │       │   │       │   ├── Belfast
│   │       │       │   │       │   ├── Belgrade
│   │       │       │   │       │   ├── Berlin
│   │       │       │   │       │   ├── Bratislava
│   │       │       │   │       │   ├── Brussels
│   │       │       │   │       │   ├── Bucharest
│   │       │       │   │       │   ├── Budapest
│   │       │       │   │       │   ├── Busingen
│   │       │       │   │       │   ├── Chisinau
│   │       │       │   │       │   ├── Copenhagen
│   │       │       │   │       │   ├── Dublin
│   │       │       │   │       │   ├── Gibraltar
│   │       │       │   │       │   ├── Guernsey
│   │       │       │   │       │   ├── Helsinki
│   │       │       │   │       │   ├── Isle_of_Man
│   │       │       │   │       │   ├── Istanbul
│   │       │       │   │       │   ├── Jersey
│   │       │       │   │       │   ├── Kaliningrad
│   │       │       │   │       │   ├── Kiev
│   │       │       │   │       │   ├── Kirov
│   │       │       │   │       │   ├── Lisbon
│   │       │       │   │       │   ├── Ljubljana
│   │       │       │   │       │   ├── London
│   │       │       │   │       │   ├── Luxembourg
│   │       │       │   │       │   ├── Madrid
│   │       │       │   │       │   ├── Malta
│   │       │       │   │       │   ├── Mariehamn
│   │       │       │   │       │   ├── Minsk
│   │       │       │   │       │   ├── Monaco
│   │       │       │   │       │   ├── Moscow
│   │       │       │   │       │   ├── Nicosia
│   │       │       │   │       │   ├── Oslo
│   │       │       │   │       │   ├── Paris
│   │       │       │   │       │   ├── Podgorica
│   │       │       │   │       │   ├── Prague
│   │       │       │   │       │   ├── Riga
│   │       │       │   │       │   ├── Rome
│   │       │       │   │       │   ├── Samara
│   │       │       │   │       │   ├── San_Marino
│   │       │       │   │       │   ├── Sarajevo
│   │       │       │   │       │   ├── Saratov
│   │       │       │   │       │   ├── Simferopol
│   │       │       │   │       │   ├── Skopje
│   │       │       │   │       │   ├── Sofia
│   │       │       │   │       │   ├── Stockholm
│   │       │       │   │       │   ├── Tallinn
│   │       │       │   │       │   ├── Tirane
│   │       │       │   │       │   ├── Tiraspol
│   │       │       │   │       │   ├── Ulyanovsk
│   │       │       │   │       │   ├── Uzhgorod
│   │       │       │   │       │   ├── Vaduz
│   │       │       │   │       │   ├── Vatican
│   │       │       │   │       │   ├── Vienna
│   │       │       │   │       │   ├── Vilnius
│   │       │       │   │       │   ├── Volgograd
│   │       │       │   │       │   ├── Warsaw
│   │       │       │   │       │   ├── Zagreb
│   │       │       │   │       │   ├── Zaporozhye
│   │       │       │   │       │   └── Zurich
│   │       │       │   │       ├── Factory
│   │       │       │   │       ├── GB
│   │       │       │   │       ├── GB-Eire
│   │       │       │   │       ├── GMT
│   │       │       │   │       ├── GMT+0
│   │       │       │   │       ├── GMT-0
│   │       │       │   │       ├── GMT0
│   │       │       │   │       ├── Greenwich
│   │       │       │   │       ├── HST
│   │       │       │   │       ├── Hongkong
│   │       │       │   │       ├── Iceland
│   │       │       │   │       ├── Indian
│   │       │       │   │       │   ├── Antananarivo
│   │       │       │   │       │   ├── Chagos
│   │       │       │   │       │   ├── Christmas
│   │       │       │   │       │   ├── Cocos
│   │       │       │   │       │   ├── Comoro
│   │       │       │   │       │   ├── Kerguelen
│   │       │       │   │       │   ├── Mahe
│   │       │       │   │       │   ├── Maldives
│   │       │       │   │       │   ├── Mauritius
│   │       │       │   │       │   ├── Mayotte
│   │       │       │   │       │   └── Reunion
│   │       │       │   │       ├── Iran
│   │       │       │   │       ├── Israel
│   │       │       │   │       ├── Jamaica
│   │       │       │   │       ├── Japan
│   │       │       │   │       ├── Kwajalein
│   │       │       │   │       ├── Libya
│   │       │       │   │       ├── MET
│   │       │       │   │       ├── MST
│   │       │       │   │       ├── MST7MDT
│   │       │       │   │       ├── Mexico
│   │       │       │   │       │   ├── BajaNorte
│   │       │       │   │       │   ├── BajaSur
│   │       │       │   │       │   └── General
│   │       │       │   │       ├── NZ
│   │       │       │   │       ├── NZ-CHAT
│   │       │       │   │       ├── Navajo
│   │       │       │   │       ├── PRC
│   │       │       │   │       ├── PST8PDT
│   │       │       │   │       ├── Pacific
│   │       │       │   │       │   ├── Apia
│   │       │       │   │       │   ├── Auckland
│   │       │       │   │       │   ├── Bougainville
│   │       │       │   │       │   ├── Chatham
│   │       │       │   │       │   ├── Chuuk
│   │       │       │   │       │   ├── Easter
│   │       │       │   │       │   ├── Efate
│   │       │       │   │       │   ├── Enderbury
│   │       │       │   │       │   ├── Fakaofo
│   │       │       │   │       │   ├── Fiji
│   │       │       │   │       │   ├── Funafuti
│   │       │       │   │       │   ├── Galapagos
│   │       │       │   │       │   ├── Gambier
│   │       │       │   │       │   ├── Guadalcanal
│   │       │       │   │       │   ├── Guam
│   │       │       │   │       │   ├── Honolulu
│   │       │       │   │       │   ├── Johnston
│   │       │       │   │       │   ├── Kiritimati
│   │       │       │   │       │   ├── Kosrae
│   │       │       │   │       │   ├── Kwajalein
│   │       │       │   │       │   ├── Majuro
│   │       │       │   │       │   ├── Marquesas
│   │       │       │   │       │   ├── Midway
│   │       │       │   │       │   ├── Nauru
│   │       │       │   │       │   ├── Niue
│   │       │       │   │       │   ├── Norfolk
│   │       │       │   │       │   ├── Noumea
│   │       │       │   │       │   ├── Pago_Pago
│   │       │       │   │       │   ├── Palau
│   │       │       │   │       │   ├── Pitcairn
│   │       │       │   │       │   ├── Pohnpei
│   │       │       │   │       │   ├── Ponape
│   │       │       │   │       │   ├── Port_Moresby
│   │       │       │   │       │   ├── Rarotonga
│   │       │       │   │       │   ├── Saipan
│   │       │       │   │       │   ├── Samoa
│   │       │       │   │       │   ├── Tahiti
│   │       │       │   │       │   ├── Tarawa
│   │       │       │   │       │   ├── Tongatapu
│   │       │       │   │       │   ├── Truk
│   │       │       │   │       │   ├── Wake
│   │       │       │   │       │   ├── Wallis
│   │       │       │   │       │   └── Yap
│   │       │       │   │       ├── Poland
│   │       │       │   │       ├── Portugal
│   │       │       │   │       ├── ROC
│   │       │       │   │       ├── ROK
│   │       │       │   │       ├── Singapore
│   │       │       │   │       ├── Turkey
│   │       │       │   │       ├── UCT
│   │       │       │   │       ├── US
│   │       │       │   │       │   ├── Alaska
│   │       │       │   │       │   ├── Aleutian
│   │       │       │   │       │   ├── Arizona
│   │       │       │   │       │   ├── Central
│   │       │       │   │       │   ├── East-Indiana
│   │       │       │   │       │   ├── Eastern
│   │       │       │   │       │   ├── Hawaii
│   │       │       │   │       │   ├── Indiana-Starke
│   │       │       │   │       │   ├── Michigan
│   │       │       │   │       │   ├── Mountain
│   │       │       │   │       │   ├── Pacific
│   │       │       │   │       │   ├── Pacific-New
│   │       │       │   │       │   └── Samoa
│   │       │       │   │       ├── UTC
│   │       │       │   │       ├── Universal
│   │       │       │   │       ├── W-SU
│   │       │       │   │       ├── WET
│   │       │       │   │       ├── Zulu
│   │       │       │   │       ├── iso3166.tab
│   │       │       │   │       ├── localtime
│   │       │       │   │       ├── posixrules
│   │       │       │   │       ├── zone.tab
│   │       │       │   │       └── zone1970.tab
│   │       │       │   ├── requests
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── __version__.py
│   │       │       │   │   ├── _internal_utils.py
│   │       │       │   │   ├── adapters.py
│   │       │       │   │   ├── api.py
│   │       │       │   │   ├── auth.py
│   │       │       │   │   ├── certs.py
│   │       │       │   │   ├── compat.py
│   │       │       │   │   ├── cookies.py
│   │       │       │   │   ├── exceptions.py
│   │       │       │   │   ├── help.py
│   │       │       │   │   ├── hooks.py
│   │       │       │   │   ├── models.py
│   │       │       │   │   ├── packages.py
│   │       │       │   │   ├── sessions.py
│   │       │       │   │   ├── status_codes.py
│   │       │       │   │   ├── structures.py
│   │       │       │   │   └── utils.py
│   │       │       │   ├── requests_ntlm
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   └── requests_ntlm.py
│   │       │       │   ├── simplejson
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── _speedups.c
│   │       │       │   │   ├── compat.py
│   │       │       │   │   ├── decoder.py
│   │       │       │   │   ├── encoder.py
│   │       │       │   │   ├── ordered_dict.py
│   │       │       │   │   ├── scanner.py
│   │       │       │   │   └── tool.py
│   │       │       │   ├── six.py
│   │       │       │   ├── socks.py
│   │       │       │   ├── tzlocal
│   │       │       │   │   ├── __init__.py
│   │       │       │   │   ├── darwin.py
│   │       │       │   │   ├── test_data
│   │       │       │   │   │   ├── Harare
│   │       │       │   │   │   ├── localtime
│   │       │       │   │   │   │   └── etc
│   │       │       │   │   │   │       └── localtime
│   │       │       │   │   │   ├── symlink_localtime
│   │       │       │   │   │   │   ├── etc
│   │       │       │   │   │   │   │   └── localtime
│   │       │       │   │   │   │   └── usr
│   │       │       │   │   │   │       └── share
│   │       │       │   │   │   │           └── zoneinfo
│   │       │       │   │   │   │               └── Africa
│   │       │       │   │   │   │                   └── Harare
│   │       │       │   │   │   ├── timezone
│   │       │       │   │   │   │   └── etc
│   │       │       │   │   │   │       └── timezone
│   │       │       │   │   │   ├── timezone_setting
│   │       │       │   │   │   │   └── etc
│   │       │       │   │   │   │       └── conf.d
│   │       │       │   │   │   │           └── clock
│   │       │       │   │   │   └── zone_setting
│   │       │       │   │   │       └── etc
│   │       │       │   │   │           └── sysconfig
│   │       │       │   │   │               └── clock
│   │       │       │   │   ├── unix.py
│   │       │       │   │   ├── win32.py
│   │       │       │   │   └── windows_tz.py
│   │       │       │   └── urllib3
│   │       │       │       ├── __init__.py
│   │       │       │       ├── _collections.py
│   │       │       │       ├── connection.py
│   │       │       │       ├── connectionpool.py
│   │       │       │       ├── contrib
│   │       │       │       │   ├── __init__.py
│   │       │       │       │   ├── _securetransport
│   │       │       │       │   │   ├── __init__.py
│   │       │       │       │   │   ├── bindings.py
│   │       │       │       │   │   └── low_level.py
│   │       │       │       │   ├── appengine.py
│   │       │       │       │   ├── ntlmpool.py
│   │       │       │       │   ├── pyopenssl.py
│   │       │       │       │   ├── securetransport.py
│   │       │       │       │   └── socks.py
│   │       │       │       ├── exceptions.py
│   │       │       │       ├── fields.py
│   │       │       │       ├── filepost.py
│   │       │       │       ├── packages
│   │       │       │       │   ├── __init__.py
│   │       │       │       │   ├── backports
│   │       │       │       │   │   ├── __init__.py
│   │       │       │       │   │   └── makefile.py
│   │       │       │       │   ├── ordered_dict.py
│   │       │       │       │   ├── six.py
│   │       │       │       │   └── ssl_match_hostname
│   │       │       │       │       ├── __init__.py
│   │       │       │       │       └── _implementation.py
│   │       │       │       ├── poolmanager.py
│   │       │       │       ├── request.py
│   │       │       │       ├── response.py
│   │       │       │       └── util
│   │       │       │           ├── __init__.py
│   │       │       │           ├── connection.py
│   │       │       │           ├── request.py
│   │       │       │           ├── response.py
│   │       │       │           ├── retry.py
│   │       │       │           ├── selectors.py
│   │       │       │           ├── ssl_.py
│   │       │       │           ├── timeout.py
│   │       │       │           ├── url.py
│   │       │       │           └── wait.py
│   │       │       ├── project.py
│   │       │       ├── projects
│   │       │       │   ├── __init__.py
│   │       │       │   ├── base.py
│   │       │       │   ├── git.py
│   │       │       │   ├── mercurial.py
│   │       │       │   ├── projectfile.py
│   │       │       │   ├── projectmap.py
│   │       │       │   └── subversion.py
│   │       │       ├── session_cache.py
│   │       │       ├── stats.py
│   │       │       └── utils.py
│   │       └── plugin
│   │           └── wakatime.vim
│   ├── plugins
│   │   ├── coc.rc.vim
│   │   ├── defx.rc.vim
│   │   ├── denite.rc.vim
│   │   ├── lsconfig.rc.vim
│   │   └── plugins-vim-fugitive.vim
│   └── settings
│       └── utils.lua
├── setup.sh
└── tmux

</pre>
