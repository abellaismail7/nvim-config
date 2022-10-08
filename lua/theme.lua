local M = {}


M.ui = {
		-- hl = highlights
		theme = "onedark",
  		hl_add = {},
  		hl_override = {},
  		changed_themes = {},
  		theme_toggle = { "ayu-dark", "one_light" },
  		transparency = false,
}


function M.get_theme_tb(type)
	
  local path = "themes." .. M.ui.theme

  local present, theme = pcall(require, path)

  if present then
    return theme[type]
  else
    error "No such theme bruh >_< "
  end
end


local function load_all_highlights()
  vim.opt.bg = M.get_theme_tb "type" -- dark/light

  -- reload highlights for theme switcher
  local reload = require("plenary.reload").reload_module

  -- clear_hl "BufferLine"
  -- clear_hl "TS"

  reload "theme.integrations"

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
	  print("Error: No such theme [" .. theme .. "]")
	end

	M.ui.theme = theme
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
