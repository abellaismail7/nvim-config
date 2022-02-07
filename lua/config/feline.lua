local colors = require"colors"
local vi_colors = require('feline.providers.vi_mode')

-- Initialize the components table
local components = {
   active = {},
   inactive = {},
}

-- Initialize left, and right
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})

local comps = {}

comps.bar = {
    provider = "▋",
    hl = {fg = colors.accent}
}

comps.vmode = {
    provider = '  ●  ',
    hl = function ()
        return { fg = vi_colors.get_mode_color() }
    end
}

comps.fileinfo = {
    provider = {
        name = 'file_info',
        opts = {
            type = 'unique',
            file_modified_icon = ''
        }
    }
}

comps.scroll = {
    provider = function()
        local current_line = vim.fn.line(".")
        local total_line = vim.fn.line("$")

        if current_line == 1 then
            return "   Top  "
        elseif current_line == vim.fn.line("$") then
            return "   Bot  "
        end
        local result, _ = math.modf((current_line / total_line) * 100)
        return "   " .. result .. "%  "
    end,
}

comps.gitadd = {
    provider = "git_diff_added",
    hl = "DiffAdded"
}

comps.gitchange = {
    provider = "git_diff_changed",
    hl = "DiffChange"
}

comps.gitremove = {
    provider = "git_diff_removed",
    hl = "DiffDelete"
}

comps.reset ={
    provider = " ",
    hl = {
        bg = colors.black
    }
}

comps.lsp_is_active = {
    provider = function()
        local clients = vim.lsp.get_active_clients()
        if next(clients) ~= nil then
            return " " .. "  " .. " LSP "
        else
            return ""
        end
    end,
    hl = {
        fg = colors.accent
    }
}

comps.git_branch = {
    provider = "git_branch",
    right_sep = {
        str = " ",
        hl = { bg = colors.accent }
    },
    left_sep = {
        str = " ",
        hl = { bg = colors.accent }
    },
    hl = {
        bg = colors.accent,
        fg = colors.black,
    }
}

-- useless bar
table.insert(components.active[1], comps.bar)
table.insert(components.inactive[1], comps.bar)

-- vi mode
table.insert(components.active[1], comps.vmode)
table.insert(components.inactive[1], comps.vmode)

-- fileicon + name
table.insert(components.active[1], comps.fileinfo)
table.insert(components.inactive[1], comps.fileinfo)

-- scroll indicator
table.insert(components.active[1], comps.scroll)

-- git diffs
table.insert(components.active[1], comps.gitadd)
table.insert(components.active[1], comps.gitchange)
table.insert(components.active[1], comps.gitremove)

-- reset background
table.insert(components.active[1], comps.reset)
table.insert(components.inactive[1], comps.reset)

-- lsp
table.insert(components.active[2], comps.lsp_is_active)

-- current branch
table.insert(components.active[2], comps.git_branch)

require'feline'.setup {
    components = components,
    theme = {
        bg = colors.black,
        fg = colors.white,
    },
    vi_mode_colors = {
        NORMAL = colors.accent,
        INSERT = colors.red,
        COMMAND = colors.grey,
        SELECT = colors.orange,
        SHELL = colors.lyellow,
        TERM = colors.lyellow,
        VISUAL = colors.blue,
        LINES = colors.blue,
        BLOCK = colors.blue,
        REPLACE = colors.purple,
    }
}
