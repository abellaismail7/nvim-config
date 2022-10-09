local colors = require "colors"
local M = {}


M.ui = {
	-- hl = highlights
  	hl_add = {},
  	hl_override = {
		Keyword = 		   { fg = colors.yellow },
		Conditional =      { fg = colors.yellow },
		Repeat =           { fg = colors.yellow },
		Operator =         { fg = colors.yellow },
		Include	=		   { fg = colors.accent },
		String =           { fg = colors.str_green },
		Delimiter =        { fg = colors.lred },
		TSPunctBracket =   { fg = colors.lred },
		Type =             { fg = colors.green },
		TSFunction =         { fg = colors.dark_green },
		Function =         { fg = colors.dark_green },
		Identifier =       { fg = colors.dark_green },
		TSPunctIdentifier =       { fg = colors.dark_green },
		Comment =          { fg = colors. grey },
		Search =           { fg = colors. lred },
		Normal =		   { bg = colors.bg },
	},
  	changed_themes = {},
  	theme_toggle = { "ayu-dark", "one_light" },
  	transparency = false,
}


function M.get_theme_tb(type)
	
  local path = "themes." .. vim.g.ft_theme

  local present, theme = pcall(require, path)

  if present then
    return theme[type]
  else
    error "No such theme bruh >_< "
  end
end

local clear_hl = function(hl_group)
  local highlights_raw = vim.split(vim.api.nvim_exec("filter " .. hl_group .. " hi", true), "\n")
  local highlight_groups = {}

  for _, raw_hi in ipairs(highlights_raw) do
    table.insert(highlight_groups, string.match(raw_hi, hl_group .. "%a+"))
  end

  for _, highlight in ipairs(highlight_groups) do
    vim.cmd([[hi clear ]] .. highlight)
  end
end


local function load_all_highlights()
  vim.opt.bg = M.get_theme_tb "type" -- dark/light

  -- reload highlights for theme switcher
  local reload = require("plenary.reload").reload_module

  clear_hl "BufferLine"
  clear_hl "TS"

  reload "theme"
  reload "theme.integrations.alpha"
  reload "theme.integrations"
  reload "lights"
  reload "feline"
  reload "config.feline"
  require('config.feline')

  M.ui.theme = vim.g.ft_theme

  local hl_groups = require "lights"

  for hl, col in pairs(hl_groups) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.override_theme = function(default_theme, theme_name)
  local changed_themes = M.ui.changed_themes

  if changed_themes[theme_name] then
    return M.merge_tb(default_theme, changed_themes[theme_name])
  else
    return default_theme
  end
end


function M.change_theme(theme)
	local exist = pcall(require, "themes." .. theme)

	if theme == "integrations" or not exist then
	  error("Error: No such theme [" .. theme .. "]")
	end

	print("set new theme: " .. theme)
	vim.g.ft_theme = theme
	local colors = M.get_theme_tb "base_16"

	load_all_highlights();

	vim.g.terminal_color_0 = colors.base01
	vim.g.terminal_color_1 = colors.base08
	vim.g.terminal_color_2 = colors.base0B
	vim.g.terminal_color_3 = colors.base0A
	vim.g.terminal_color_4 = colors.base0D
	vim.g.terminal_color_5 = colors.base0E
	vim.g.terminal_color_6 = colors.base0C
	vim.g.terminal_color_7 = colors.base05
	vim.g.terminal_color_8 = colors.base03
	vim.g.terminal_color_9 = colors.base08
	vim.g.terminal_color_10 = colors.base0B
	vim.g.terminal_color_11 = colors.base0A
	vim.g.terminal_color_12 = colors.base0D
	vim.g.terminal_color_13 = colors.base0E
	vim.g.terminal_color_14 = colors.base0C
	vim.g.terminal_color_15 = colors.base07

end

return M
