local colors = require"colors"
local vi_colors = require('feline.providers.vi_mode')

local comps = {}

comps.bar = {
    provider = "▋",
    hl = function ()
        return { fg = vi_colors.get_mode_color() }
    end
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

comps.fileinfo_middle = {
	provider = {
		name = "file_info",
		opts = {
			type = "relative",
		},
	},
	hl = {
		style = "bold",
	},
	left_sep = " ",
	right_sep = " ",
}

comps.scroll = {
    provider = function()
		local current_line = vim.fn.line(".")
        local total_line = vim.fn.line("$")

        if current_line == 1 then
            return " [Top]"
        elseif current_line == total_line then
            return " [Bot]"
        end
        return " [" .. current_line .. "]"
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
    hl = function ()
        return { fg = vi_colors.get_mode_color() }
    end,
}

comps.git_branch = {
    provider = "git_branch",
    right_sep = {
        str = " ",
        hl = function () return { bg = vi_colors.get_mode_color() } end,
    },
    left_sep = {
        str = " ",
        hl = function () return { bg = vi_colors.get_mode_color() } end,
    },
    hl = function ()
        return { bg = vi_colors.get_mode_color(), fg = colors.black }
    end,
}

local left = {
	-- useless bar
	comps.bar,
	
	-- vi mode
	comps.vmode,
		
	-- fileicon + name
	-- comps.fileinfo,
	
	-- scroll indicator
	comps.scroll,
		
	-- git diffs
	comps.gitadd,
	comps.gitchange,
	comps.gitremove,
	
	-- reset background
	comps.reset,
	
}

local middle ={
	comps.fileinfo_middle,
}

local right = {
	-- lsp
	comps.lsp_is_active,
		
	-- current branch
	comps.git_branch,
}

-- Initialize the components table
local components = {
   active = {left, middle ,right},
   inactive = {},
}


require'feline'.setup {
    components = components,
    theme = {
        bg = colors.black,
        fg = colors.white,
    },
    vi_mode_colors = {
        NORMAL = colors.accent,
        INSERT = colors.green,
        COMMAND = colors.grey,
        SELECT = colors.orange,
        SHELL = colors.lyellow,
        TERM = colors.lyellow,
        VISUAL = colors.orange,
        LINES = colors.orange,
        BLOCK = colors.orange,
        REPLACE = colors.purple,
    }
}
