local popup = require "plenary.popup"
local api   = vim.api
local M = {}

local bufnr = -1
local winnr = -1
local border_win = -1

local pop_opts = {
    pos = "botleft",
    focusable = true,
    border = true,
    highlight = "CursorLine",
	borderhighlight = "CursorLine",
	titlehighlight = "TablineActive",
	borderchars = { '', '─', ' ', ' ', ' ', ' ', ' ', ' '},
	col = 0,
	padding = { 0, 0, 0, 0},
	title = "  Terminal",
}

local function on_exit()
	print("term: bye")
	M.close()
	if api.nvim_buf_is_loaded(bufnr) then
		api.nvim_buf_delete(bufnr, { force = true })
	end
end

local function calc_size(opts)
    local line_count = vim.o.lines - vim.o.cmdheight
    if vim.o.laststatus ~= 0 then
        line_count = line_count - 1
    end
    opts.width = vim.o.columns
    opts.height = math.floor(line_count * .3)
	opts.minheight = 15
    opts.maxheight = line_count - 3;
	opts.line = line_count + 1
end

function M.open()
    if bufnr == -1 or not api.nvim_buf_is_valid(bufnr)
        then
        bufnr = api.nvim_create_buf(false, false)
        api.nvim_buf_call(bufnr, function ()
			vim.fn.termopen("zsh", {
				on_exit = on_exit
			})
		end)
		api.nvim_create_autocmd({"TermClose", "WinLeave", "BufLeave"}, {
			buffer = bufnr,
			callback = function ()
				M.close()
			end
		})
        api.nvim_buf_set_option(bufnr, "modified", false)
		api.nvim_buf_set_option(bufnr, "buflisted", false)
		vim.keymap.set({"i","n","t"}, "<C-k>", M.close, {buffer=bufnr})
    end
    calc_size(pop_opts)
    local win, opts = popup.create(bufnr , pop_opts)
    api.nvim_win_set_option(win, "winblend", 0)
    border_win = opts and opts.border and opts.border.win_id;
    if border_win then
        api.nvim_win_set_option(border_win, "winblend", 0)
    end
    winnr = win
    api.nvim_win_set_buf(winnr, bufnr);
	vim.cmd('exe "norm! 1\\<C-w>+"')
end

function M.close()
    if api.nvim_win_is_valid(winnr) then
    	vim.api.nvim_win_close(winnr, true)
    end
    if api.nvim_win_is_valid(border_win) then
    	vim.api.nvim_win_close(border_win, true)
    end
end

return M
