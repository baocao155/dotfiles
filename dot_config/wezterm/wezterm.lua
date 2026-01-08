local wezterm = require("wezterm")
local config = {}

-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14
config.line_height = 1.2

config.enable_tab_bar = true

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_background_opacity = 0.8
config.macos_window_background_blur = 30

-- and finally, return the configuration to wezterm
-- config.color_scheme = "Batman"

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

-- if you *ARE* lazy-loading smart-splits.nvim (not recommended)
-- you have to use this instead, but note that this will not work
-- in all cases (e.g. over an SSH connection). Also note that
-- `pane:get_foreground_process_name()` can have high and highly variable
-- latency, so the other implementation of `is_vim()` will be more
-- performant as well.
-- local function is_vim(pane)
-- 	-- This gsub is equivalent to POSIX basename(3)
-- 	-- Given "/foo/bar" returns "bar"
-- 	-- Given "c:\\foo\\bar" returns "bar"
-- 	local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
-- 	return process_name == "nvim" or process_name == "vim"
-- end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.SendString("clear\n"),
	},
	{
		key = "m",
		mods = "CTRL",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),

	{ key = "0", mods = "CTRL", action = wezterm.action.PaneSelect },
	{ key = "r", mods = "CMD", action = wezterm.action.RotatePanes("Clockwise") },
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.RotatePanes("CounterClockwise"),
	},
	-- { key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
	-- { key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
	-- { key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
	-- { key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
	-- {
	-- 	key = "h",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	-- },
	-- {
	-- 	key = "j",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	-- },
	-- { key = "k", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	-- {
	-- 	key = "l",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	-- },
}

return config
