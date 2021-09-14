-- Initialize the components table
local components = {
   active = {},
   inactive = {},
}

-- Initialize left, mid and right
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})



function Mode_highlight()
    local alias = {
        n = green,
        i = "#FF79C6",
        c = "#6272A4",
        V = "#F1FA8C",
        [""] = "#FF6E6E",
        v = "#599EFF",
        R = "#FFB86C"
    }
    local mode = vim.fn.mode()
    local current_Mode = alias[mode]

    if current_Mode == nil then
        current_Mode = grey
    end

    return { current_Mode, bg}
end

components.active[1][1] = {
   provider = "●",

   hl = {
      fg = colors.statusline_bg,
      bg = colors.nord_blue,
   },

   right_sep = { str = statusline_style.right, hl = {
      fg = colors.nord_blue,
      bg = colors.one_bg2,
   } },
}

require('feline').setup {
    colors = {
        fg = '#D0D0D0',
        bg = '#1F1F23'
    }
}
