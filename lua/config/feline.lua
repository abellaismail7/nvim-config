local vi_colors = require('feline.providers.vi_mode')
local colors = require("theme").get_theme_tb "base_30"

local comps = {}

local mode_str = { --{{{
        n = 'NORMAL',
        no = 'NORMAL',
        i = 'INSERT',
        ic = 'INSERT',
        c = 'COMMAND',
        ce = 'COMMAND',
        cv = 'Ex',
        V = 'V-LINE',
        [''] = 'V-BLOCK',
        v = 'VISUAL',
        ['r?'] = ':CONFIRM',
        rm = 'MORE',
        R = 'REPLACE',
        Rv = 'V-REPLACE',
        s = 'SELECT',
        S = 'S-LINE',
        r = 'H-ENTER',
        [''] = 'S-BLOCK',
        t = 'TERMINAL',
        ['!'] = 'SHELL',
    } --}}}

comps.vmode = {
    provider = function ()
    	return " " .. mode_str[vim.api.nvim_get_mode().mode] .. " "
    end,
    hl = function ()
        return { bg = vi_colors.get_mode_color(), fg = colors.black2 }
    end
}

comps.line = {
	provider = "position",
    left_sep = {
        str = " ",
	}
}

comps.recording = {
    provider = function ()
    	local rec = vim.fn.reg_recording()

		if rec == "" then
			return ""
		end
		return " 壘" .. rec
    end,
	hl = { fg = colors.red }
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
        bg = colors.black2
    }
}

comps.git_branch = {
    provider = "git_branch",
	icon = " ",
    right_sep = {
        str = " ",
        hl = function () return { bg = colors.lightbg, fg = colors.white } end,
    },
    left_sep = {
        str = " ",
    	hl = function () return { bg = colors.lightbg, fg = colors.white } end,
    },
    hl = function () return { bg = colors.lightbg, fg = colors.white } end,
}

local left = {
	-- vi mode
	comps.vmode,

	-- current branch
	comps.git_branch,

	-- git diffs
	comps.gitadd,
	comps.gitchange,
	comps.gitremove,

	-- recording
	comps.recording,

	-- scroll indicator
	comps.line,

	-- reset background
	comps.reset,
}

local middle ={
	comps.fileinfo_middle,
}

comps.lsp_error = {
	provider = "diagnostic_errors",
	left_sep = " ",
	hl = "St_lspError"
}

comps.lsp_warn = {
	provider = "diagnostic_warnings",
	left_sep = " ",
	hl = "St_lspWarning"
}

comps.lsp_hints = {
	provider = "diagnostic_hints",
	left_sep = " ",
	hl = "St_lspHints"
}

comps.lsp_info = {
	provider = "diagnostic_info",
	left_sep = " ",
	hl = "St_lspInfo"
}

comps.lsp_is_active = {
    provider = function()
        local clients = vim.lsp.get_active_clients()
        if next(clients) ~= nil then
            return "  LSP "
        else
            return " ! LSP "
        end
    end,
	left_sep = " ",
    hl = "St_pos_icon",
}

local right = {
	-- lsp
	comps.lsp_info,
	comps.lsp_hints,
	comps.lsp_warn,
	comps.lsp_error,
	comps.lsp_is_active,
		
}

-- Initialize the components table
local components = {
   active = {left, middle ,right},
   inactive = {},
}


require'feline'.setup {
    components = components,
    theme = {
        bg = colors.black2,
        fg = colors.white,
    },
    vi_mode_colors = {
        NORMAL = colors.nord_blue,
        INSERT = colors.dark_purple,
        COMMAND = colors.green,
        SELECT = colors.nord_blue,
        SHELL = colors.lyellow,
        TERM = colors.green,
        VISUAL = colors.cyan,
        LINES = colors.orange,
        BLOCK = colors.red,
        REPLACE = colors.orange,
    }
}
