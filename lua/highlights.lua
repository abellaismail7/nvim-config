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

cmd("hi clear Normal")
cmd("hi clear DiffChange")
cmd("hi clear DiffDelete")

-- mCustom Color
--local dark_bg2  = "#2e3133"
--local light_bg  = "#292F36"

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

local M = {}

function M.setup()
	-- misc --
	--fg("Keyword",           yellow)
	--fg("Conditional",       yellow)
	--fg("Repeat",            yellow)
	--fg("Operator",          yellow)
	--fg("Include",			colors.accent)
	--
	--fg("String",            str_green)
	--fg("Delimiter",         lred)
	--fg("Type",              green)
	--fg("Function",          dark_green)
	--fg("Identifier",        dark_green)
	--
	--fg("Comment",           grey)
	--bg("Search",            lred)
	--fg("DraculaPink", "#88C0D0")
	
	fg("NvimInternalError", lred)
	
	fg_bg("VertSplit",      colors.white, colors.darker_bg)
	fg("LineNr",            grey)
	fg_bg("CursorLineNr",   white,darker_bg )
	bg("CursorLine",        darker_bg)
	
	cmd("hi clear StatusLineNc")
	fg("StatusLineNC",      blue)
	bg("StatusLine",        colors.black)
	bg("MsgArea",           colors.black)
	
	fg("Whitespace",        grey)
	
	-- fidget
	fg_bg("FidgetTitle", colors.accent, colors.none)
	fg_bg("FidgetTask", colors.white, colors.none)
	-- Tree Sitter
	
	-- Pmenu
	bg("Pmenu",         colors.secondary)
	bg("PmenuSbar",     one_bg2)
	bg("PmenuSel",      colors.accent)
	bg("PmenuThumb",    blue)
	
	-- debug
	bg("debugPC", black)
	fg_bg("debugBreakpoint", white, black)
	-- Cmp
	fg("CmpItemKind",  grey_fg)
	fg("CmpItemAbbr",  grey_fg)
	fg("CmpItemMenu",  grey_fg)
	
	-- git signs ---
	fg_bg("DiffAdded", colors.str_green, "none")
	fg_bg("DiffChange", colors.yellow, "none")
	fg_bg("DiffDelete", colors.red,   "none")
	
	-- NvimTree
	fg("NvimTreeFolderIcon",    blue)
	fg("NvimTreeFolderName",    blue)
	fg("NvimTreeIndentMarker",  one_bg2)
	fg_bg("NvimTreeVertSplit",  normal_darker, normal_darker)
	
	-- tsx
	fg("TSTag", "#E06C75")
	fg("TSConstructor", "#E06C75")
	fg("tsxCloseComponentName", "#E06C75")
	fg("TSTagDelimiter", "#F99575")
	fg("tsxCloseTag", "#F99575")
	fg("tsxCloseTagName", "#F99575")
	fg("tsxAttributeBraces", "#F99575")
	fg("tsxEqual", "#F99575")
	fg("TSTagAttribute", "#F8BD7F")
	
	-- tabline
	fg_bg("TablineActive",	colors.black, colors.accent)
	vim.cmd([[
		hi! link tabline_a_normal TablineActive
	]])
	
	fg("NvimTreeRootFolder",        white)
	bg("NvimTreeNormal",            normal_darker)
	fg_bg("NvimTreeStatusline",     dark_bg, dark_bg)
	fg_bg("NvimTreeStatuslineNc",   dark_bg, dark_bg)
	
	-- telescope
	fg_bg("TelescopeBorder",           white, colors.bg)
	fg_bg("TelescopePromptBorder",     white, colors.bg)
	fg_bg("TelescopeResultsBorder",    white, colors.bg)
	fg_bg("TelescopePreviewBorder",    white, colors.bg)
	
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
	
	-- WhichKey
	fg("WhichKeyDesc",  green)
	bg("WhichKeyFloat", normal_darker)
	
	-- basic
	bg("Normal", colors.bg)
end
return M;
