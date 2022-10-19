local M = {}
local api = vim.api

local picker = require('window-picker')
function M:pick_win()
    local id = picker.pick_window() or api.nvim_get_current_win()
    api.nvim_set_current_win(id)
end

function M:replace_win()

	local  cur = api.nvim_get_current_win();
	local cur_buf = api.nvim_win_get_buf(cur);

    local id = picker.pick_window() or vim.api.nvim_get_current_win()
	local buf = api.nvim_win_get_buf(id);

	api.nvim_win_set_buf(cur, buf)
	api.nvim_win_set_buf(id, cur_buf)

    api.nvim_set_current_win(id)
end


local colors = require("theme").get_theme_tb "base_30"
require'window-picker'.setup({
	other_win_hl_color = colors.yellow,
	fg_color = colors.darker_black,
})

return M
