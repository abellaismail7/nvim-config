local popup = require "plenary.popup"
local api   = vim.api
local bufnr = -1
local winnr = -1
local M = {}
local pop_opts = {
    pos = "center",
    focusable = true,
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    highlight = "Normal",
    --borderhighlight = "",
}

local function calc_size(opts)
    local line_count = vim.o.lines - vim.o.cmdheight
    if vim.o.laststatus ~= 0 then
        line_count = line_count - 1
    end
    opts.width = math.floor(vim.o.columns * .7)
    opts.minheight = math.floor(line_count * .5)
end

function M.open()
    if bufnr == -1 or not api.nvim_buf_is_valid(bufnr)
        then
        bufnr = api.nvim_create_buf(false, false)
        api.nvim_buf_call(bufnr, function ()
            vim.cmd [[
                edit term://zsh
                set nobuflisted
                set nomodified
                nmap <buffer> <Esc> :lua require('ft_terminal').close()<cr>
            ]]
        end)
    end
    calc_size(pop_opts)
    local win, _ = popup.create(bufnr , pop_opts)
    winnr = win
    api.nvim_win_set_buf(winnr, bufnr);
end

function M.close()
    if winnr == nil or not api.nvim_win_is_valid(winnr) then
        return
    end
    vim.api.nvim_win_close(winnr, true)
end

return M
