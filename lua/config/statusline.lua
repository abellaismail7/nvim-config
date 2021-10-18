local gl = require("galaxyline")
local provider = require "galaxyline.provider"
local gls = gl.section
local condition = require("galaxyline.condition")
local file_info = require'galaxyline.provider_fileinfo'


gl.short_line_list = {"NvimTree"}


local bold = "bold"
local bg = "#191d24"
local white = "#F8F8F2"
local green =  "#49D46E"
local grey = "#A3BE8C"
local red = "#FF79C6"
local grey_fg2 = "#6272A4"
local yellow = "#EBCB8B"
local blue = "#7AA2F7"

vim.api.nvim_command('hi GlViMode guifg=white guibg='..bg)
function Mode_highlight()
    local alias = {
        n = green,
        i = red,
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

    vim.api.nvim_command('hi GlViMode guifg='..current_Mode)
end

gls.left[1] = {
  FirstElement = {
    provider = function() return '▋' end,
    highlight = { blue,bg }
  },
}

gls.left[2] = {
    statusIcon = {
        provider = function()
            Mode_highlight()
            return "  ●  "
        end,
        highlight = "GlViMode",
    }
}

gls.left[3] = {
    FileIcon = {
        provider  = "FileIcon",
        condition = function()
            if vim.fn.bufname() == "NvimTree" then
                return false
            end
            return true
        end,
        highlight = { white,bg }
    }
}

gls.left[5] = {
    FileName = {
        provider = {"FileName"},
        condition = condition.buffer_not_empty,
        highlight = { white,bg }
    }
}

gls.left[4] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return " " .. dir_name .. "/"
        end,
        highlight = { white,bg }
    }
}

gls.left[7] = {
    line_percentage = {
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
        highlight = { white,bg }
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gls.left[8] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        highlight = { white,bg }
    }
}

gls.left[9] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "   ",
        highlight = {grey_fg2,bg}
    }
}

gls.left[10] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {grey_fg2,bg}
    }
}

gls.left[11] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {red,bg}
    }
}

gls.left[12] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {yellow,bg}
    }
}

gls.right[1] = {
    lsp_status = {
        provider = function()
            local clients = vim.lsp.get_active_clients()
            if next(clients) ~= nil then
                return " " .. "  " .. " LSP "
            else
                return ""
            end
        end,
        highlight = {blue,bg }
    }
}

gls.right[2] = {
    GitIcon = {
        provider = function()
            return "   "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {bg, blue},
    }
}

gls.right[3] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {bg, blue,bold},
    }
}

gls.right[4] = {
    lastspace = {
        provider = function ()
          return " "
        end,
        highlight = {bg, blue}
    }
}

gls.short_line_left[1] = {
    s_FirstElement= {
        provider = function()
            return "  ●  "
        end,
        highlight = { grey, bg }
    }
}
gls.short_line_left[2] = {
    s_FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = { white,bg }
    }
}

gls.short_line_left[3] = {
    s_FileName = {
        provider = {"FileName"},
        condition = condition.buffer_not_empty,
        highlight = { white,bg }
    }
}

gls.short_line_left[4] = {
    s_current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "  " .. dir_name .. " "
        end,
        condition = function ()
            local file = vim.bo.filetype
            if(file == "NvimTree") then
                return false
            end
            return true
            

        end,
        highlight = { white,bg }
    }
}

