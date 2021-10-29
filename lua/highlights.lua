local cmd = vim.cmd
local colors = require("colors")

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
--local dark_bg2  = "#2e3133"
--local light_bg  = "#292F36"

local none          = colors.none
local white         = colors.white
local black         = colors.black
local one_bg2       = colors.one_bg2
local grey_fg       = colors.grey_fg
local normal_darker = colors.normal_darker
local darker_bg     = colors.darker_bg
local dark_bg       = colors.dark_bg
local purple        = colors.purple
local green         = colors.green
local str_green     = colors.str_green
local dark_green    = colors.dark_green
local blue          = colors.blue
local yellow        = colors.yellow
local lred          = colors.lred
local grey          = colors.grey

-- misc --
fg("Keyword",           yellow)
fg("Conditional",       yellow)
fg("Repeat",            yellow)
fg("Operator",          yellow)

fg("String",            str_green)
fg("Delimiter",         lred)
fg("Type",              green)
fg("Function",          dark_green)
fg("Identifier",        dark_green)

fg("LineNr",            grey)
fg("Comment",           grey)

fg("NvimInternalError", lred)

fg_bg("VertSplit",      darker_bg, darker_bg)
fg("LineNr",            grey)
fg_bg("CursorLineNr",   white,darker_bg )
bg("CursorLine",        darker_bg)

cmd("hi clear StatusLineNc")
fg("StatusLineNC",      blue)
fg("StatusLine",        normal_darker)

fg("Whitespace",        grey)

-- Tree Sitter

-- Pmenu
bg("Pmenu",         dark_bg)
bg("PmenuSbar",     one_bg2)
bg("PmenuSel",      str_green)
bg("PmenuThumb",    blue)

-- debug
bg("debugPC", black)
fg_bg("debugBreakpoint", white, black)
-- Cmp
fg("CmpItemKind",  grey_fg)
fg("CmpItemAbbr",  grey_fg)
fg("CmpItemMenu",  grey_fg)

-- git signs ---
fg_bg("DiffAdd",        blue,       "none")
fg_bg("DiffChange",     one_bg2,    "none")
fg_bg("DiffModified",   blue,       "none")

-- NvimTree
fg("NvimTreeFolderIcon",    blue)
fg("NvimTreeFolderName",    blue)
fg("NvimTreeIndentMarker",  one_bg2)
fg_bg("NvimTreeVertSplit",  normal_darker, normal_darker)

fg("NvimTreeRootFolder",        white)
bg("NvimTreeNormal",            normal_darker)
fg_bg("NvimTreeStatusline",     dark_bg, dark_bg)
fg_bg("NvimTreeStatuslineNc",   dark_bg, dark_bg)

-- telescope
fg("TelescopeBorder",           white)
fg("TelescopePromptBorder",     white)
fg("TelescopeResultsBorder",    white)
fg("TelescopePreviewBorder",    white)

-- LspDiagnostics
-- error / warnings
fg("LspDiagnosticsSignError",           lred)
fg("LspDiagnosticsVirtualTextError",    lred)
fg("LspDiagnosticsSignWarning",         yellow)
fg("LspDiagnosticsVirtualTextWarning",  yellow)

-- info
fg("LspDiagnosticsSignInformation",         green)
fg("LspDiagnosticsVirtualTextInformation",  green)

-- hint
fg("LspDiagnosticsSignHint",        purple)
fg("LspDiagnosticsVirtualTextHint", purple)

-- dashboard
fg("DashboardHeader",   str_green)
fg("DashboardCenter",   grey_fg)
fg("DashboardShortcut", grey_fg)
fg("DashboardFooter",   str_green)

-- WhichKey
fg("WhichKeyDesc",  green)
bg("WhichKeyFloat", normal_darker)

-- basic
bg("Normal",none)
