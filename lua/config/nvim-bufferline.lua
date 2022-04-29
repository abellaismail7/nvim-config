local colors = require('colors')

local selected_hi = {
    guibg = colors.accent,
    guifg = colors.black,
    gui = "bold",
}

local separator_hi = {
    guibg = colors.darker_bg,
    guifg = colors.darker_bg,
}

require("bufferline").setup{
    options={
		numbers = function (ops)
		    return "" .. ops.ordinal
		end,
		offsets = {{filetype = "NvimTree", text = "", padding = 1}},
		indicator_icon = '',
        show_close_icon=false,
        show_buffer_icons = false,
        show_buffer_close_icons=false,
		separator_style = "thick",
		view = "multiwindow",
		always_show_bufferline = true,
    },
    highlights = {
        fill = {
            guibg = "none"
        },
        background = {
            guibg = "none"
        },
        buffer_visible = {
            guifg = colors.accent,
        },
        modified_visible= {
            guifg = colors.accent,
        },
        modified = {
            guifg = colors.grey,
        },
        tab_selected = selected_hi,
        buffer_selected = selected_hi,
        duplicate_selected = selected_hi,
        numbers_selected = selected_hi,
        modified_selected = selected_hi,
        separator_selected = separator_hi,
        separator_visible = separator_hi,
        separator = separator_hi,

    }
}


local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {noremap=true, silent = true}

map("n", "<leader>1", [[<Cmd>BufferLineGoToBuffer 1<CR>]],opt)
map("n", "<leader>2", [[<Cmd>BufferLineGoToBuffer 2<CR>]],opt)
map("n", "<leader>3", [[<Cmd>BufferLineGoToBuffer 3<CR>]],opt)
map("n", "<leader>4", [[<Cmd>BufferLineGoToBuffer 4<CR>]],opt)
map("n", "<leader>5", [[<Cmd>BufferLineGoToBuffer 5<CR>]],opt)
map("n", "<leader>6", [[<Cmd>BufferLineGoToBuffer 6<CR>]],opt)
map("n", "<leader>7", [[<Cmd>BufferLineGoToBuffer 7<CR>]],opt)
map("n", "<leader>8", [[<Cmd>BufferLineGoToBuffer 8<CR>]],opt)
map("n", "<leader>9", [[<Cmd>BufferLineGoToBuffer 9<CR>]],opt)


