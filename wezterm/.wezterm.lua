local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.automatically_reload_config = true

-- UI
config.color_scheme = "Tokyo Night"

-- 通常テキストを暖色系に変更（目に優しい）
config.colors = {
	foreground = "#FFAD66",
	-- foreground = '#FFDFB3',
	-- foreground = '#CCA088',
}
config.font_size = 16
config.font = wezterm.font("Monaspace Neon", { weight = "Bold", stretch = "Normal", style = "Normal" })
config.use_ime = true
config.line_height = 0.9

-- 背景を半透明 + ぼかし（macOS）
local opacity_normal = 0.75
local opacity_seethrough = 0.15 -- 透過モード（ブラウザが見えるレベル）
config.window_background_opacity = opacity_normal
config.macos_window_background_blur = 20

-- 透明度トグル用のイベント
local is_transparent = false
wezterm.on("toggle-opacity", function(window, pane)
	is_transparent = not is_transparent
	local overrides = window:get_config_overrides() or {}
	if is_transparent then
		overrides.window_background_opacity = opacity_seethrough
		overrides.macos_window_background_blur = 0 -- ぼかしなしでクリアに
	else
		overrides.window_background_opacity = opacity_normal
		overrides.macos_window_background_blur = 20
	end
	window:set_config_overrides(overrides)
end)

-- window padding
-- https://medium.com/@yusuke_h/%E3%82%BF%E3%83%BC%E3%83%9F%E3%83%8A%E3%83%AB%E3%81%8C%E3%83%80%E3%82%B5%E3%81%84%E3%81%A8%E3%83%A2%E3%83%86%E3%81%AA%E3%81%84-wezterm%E7%B4%B9%E4%BB%8B%E7%B7%A8-11306091722a
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- title bar, tab 周りのUI設定
-- タイトルバーを非表示にする
config.window_decorations = "RESIZE"

-- tabが一つの時は非表示にする
config.hide_tab_bar_if_only_one_tab = true

-- タイトルバーの背景を透明にする
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- tabの新規作成ボタンを非表示にする
config.show_new_tab_button_in_tab_bar = false

-- keybindings
local act = wezterm.action

-- Claude Code対応: Ctrl+\ → Ctrl+n → Ctrl+h/j/k/l を送信
-- https://zenn.dev/moneyforward/articles/cf771d9a51857d
local function send_key_with_esc(key)
	return act.Multiple({
		act.SendKey({ key = "\\", mods = "CTRL" }),
		act.SendKey({ key = "n", mods = "CTRL" }),
		act.SendKey({ key = key, mods = "CTRL" }),
	})
end

local keys = {
	-- 透明度トグル（ブラウザを見ながら作業）
	{ key = "o", mods = "CTRL|SHIFT", action = act.EmitEvent("toggle-opacity") },
	-- Ctrl+h/j/k/l: Neovimウィンドウ移動（Claude Code対応）
	{ key = "h", mods = "CTRL", action = send_key_with_esc("h") },
	{ key = "j", mods = "CTRL", action = send_key_with_esc("j") },
	{ key = "k", mods = "CTRL", action = send_key_with_esc("k") },
	{ key = "l", mods = "CTRL", action = send_key_with_esc("l") },

	-- copy
	{ key = "c", mods = "LEADER", action = act.CopyTo("ClipboardAndPrimarySelection") },
	-- past
	{ key = "v", mods = "LEADER", action = act.PasteFrom("Clipboard") },

	-- Tab関連
	--
	-- 新しいタブを開く
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "q",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},

	-- Pane関連
	{
		key = "|",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	-- Leader + h/j/k/l: WezTermペイン移動
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	-- Paneのサイズ変更
	{
		key = "H",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "L",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},

	-- Command+Wを無効化 (ウィンドウを閉じないようにする)
	{
		key = "w",
		mods = "CMD",
		action = act.Nop,
	},
}

local mouse_bindings = {
	-- paste from mouse
	-- https://dev.classmethod.jp/articles/wezterm-get-started/
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act.PasteFrom("Clipboard"),
	},
}
-- keybindの設定
-- Leaderキーの設定. Tmuxと同じにしてる
config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = keys
config.mouse_bindings = mouse_bindings

return config
