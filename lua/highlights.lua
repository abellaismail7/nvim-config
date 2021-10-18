local cmd = vim.cmd

local white = "#FFFFFF"
local darker_black = "#1E2029"
local black = darker_black
local black2 = darker_black
local one_bg2 = "#282A36"
local light_grey = "#F8F8F2"
local grey_fg = light_grey
local indent_fg = "#242933"

-- for guifg , bg

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end



-- mCustom Color 
local str_color = "#98C379"
local light_bg  = "#292F36"
local dark_bg   = "#1F262E"
local dark_bg2  = "#2e3133"
local green     = "#7BE49F"
local blue      = "#81A1C1"
local yellow    = "#EBCB8B"
local purple    = "#8E79CD"
local lred      = "#FFD7D7"
local dark_green = "#8FBCBB"

local red = lred
local line = white
local nord_blue = blue
local blue = blue
local purple = "#BD93F9"

local normal_darker = "#101217"
local normal= "none"
local grey = "#6272A4"
local mline = "#1E2029"
-- blankline
fg("IndentBlanklineChar", indent_fg)

-- misc --
fg("Keyword", yellow)
fg("Conditional", yellow)
fg("Repeat", yellow)
fg("Operator", yellow)
fg("String", str_color)
fg("Delimiter", lred)
fg("Type", green)
fg("Function", dark_green)
fg("Identifier", dark_green)
fg("LineNr", grey)
fg("Comment", grey)
fg("NvimInternalError", red)
fg_bg("VertSplit", mline, mline)
fg("LineNr", grey)
fg_bg("CursorLineNr", white,mline )
bg("CursorLine", mline )

cmd("hi clear StatusLineNc")
fg("StatusLineNC", blue)
fg("StatusLine", normal_darker)

-- IndentLine

fg("IndentBlanklineChar",grey)

-- Tree Sitter

-- Pmenu
bg("Pmenu", dark_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", green)
bg("PmenuThumb", nord_blue)

-- git signs ---
fg_bg("DiffAdd", nord_blue, "none")
fg_bg("DiffChange", one_bg2, "none")
fg_bg("DiffModified", nord_blue, "none")

-- NvimTree
fg("NvimTreeFolderIcon", blue)
fg("NvimTreeFolderName", blue)
fg("NvimTreeIndentMarker", one_bg2)
fg_bg("NvimTreeVertSplit", normal_darker, normal_darker)

fg("NvimTreeRootFolder", white)
bg("NvimTreeNormal", normal_darker)
fg_bg("NvimTreeStatusline", dark_bg, dark_bg)
fg_bg("NvimTreeStatuslineNc", dark_bg, dark_bg)

-- telescope
fg("TelescopeBorder", line)
fg("TelescopePromptBorder", line)
fg("TelescopeResultsBorder", line)
fg("TelescopePreviewBorder", line)

-- LspDiagnostics ---

-- error / warnings
fg("LspDiagnosticsSignError", red)
fg("LspDiagnosticsVirtualTextError", red)
fg("LspDiagnosticsSignWarning", yellow)
fg("LspDiagnosticsVirtualTextWarning", yellow)

-- info
fg("LspDiagnosticsSignInformation", green)
fg("LspDiagnosticsVirtualTextInformation", green)

-- hint
fg("LspDiagnosticsSignHint", purple)
fg("LspDiagnosticsVirtualTextHint", purple)

-- dashboard
fg("DashboardHeader", red)
fg("DashboardCenter", grey_fg)
fg("DashboardShortcut", grey_fg)

-- WhichKey

fg("WhichKeyDesc",green)
bg("WhichKeyFloat",normal_darker)


-- basic
bg("Normal",normal)
