local colors = require("colors")


local hi = vim.api.nvim_set_hl
hi(0, "Normal",			{})
hi(0, "DiffChange",		{})
hi(0, "DiffDelete",		{})
hi(0, "StatusLineNc",	{})

local M = {}

function M.setup()
	
	hi(0, "NvimInternalError",	{fg = colors.lred})
	
	hi(0, "VertSplit",    {fg = colors.white, bg = colors.darker_bg})
	hi(0, "LineNr",		  {fg = colors.grey})
	hi(0, "CursorLineNr", {fg = colors.white, bg = colors.darker_bg })
	hi(0, "CursorLine",   {bg = colors.darker_bg})
	
	hi(0, "StatusLineNC",      {fg = colors.blue})
	hi(0, "StatusLine",        {bg = colors.black})
	hi(0, "MsgArea",           {bg = colors.black})
	hi(0, "Whitespace",        {fg = colors.grey})
	
	-- fidget
	hi(0, "FidgetTitle", {fg = colors.accent, bg = colors.none})
	hi(0, "FidgetTask",	 {fg = colors.white, bg = colors.none})
	
	-- Pmenu
	hi(0, "Pmenu",         {bg = colors.secondary})
	hi(0, "PmenuSbar",     {bg = colors.one_bg2})
	hi(0, "PmenuSel",      {bg = colors.accent})
	hi(0, "PmenuThumb",    {bg = colors.blue})
	
	-- debug
	hi(0, "debugPC", 			{bg = colors.black})
	hi(0, "debugBreakpoint",	{fg = colors.white, bg = colors.black})
	-- Cmp
	hi(0, "CmpItemKind",  {fg = colors.grey_fg})
	hi(0, "CmpItemAbbr",  {fg = colors.grey_fg})
	hi(0, "CmpItemMenu",  {fg = colors.grey_fg})
	
	-- git signs ---
	hi(0, "DiffAdded",	{fg = colors.str_green, bg = "none"})
	hi(0, "DiffChange", {fg = colors.yellow, bg = "none"})
	hi(0, "DiffDelete", {fg = colors.red, bg =   "none"})
	
	-- NvimTree
	hi(0, "NvimTreeFolderIcon",  	{fg = colors.blue})
	hi(0, "NvimTreeFolderName",  	{fg = colors.blue})
	hi(0, "NvimTreeIndentMarker",	{fg = colors.one_bg2})
	hi(0, "NvimTreeVertSplit",  	{fg = colors.normal_darker, bg = colors.normal_darker})
	
	-- tsx
	hi(0, "TSTag", 					{fg = "#E06C75"})
	hi(0, "TSConstructor", 			{fg = "#E06C75"})
	hi(0, "tsxCloseComponentName", 	{fg = "#E06C75"})
	hi(0, "TSTagDelimiter", 		{fg = "#F99575"})
	hi(0, "tsxCloseTag", 			{fg = "#F99575"})
	hi(0, "tsxCloseTagName", 		{fg = "#F99575"})
	hi(0, "tsxAttributeBraces", 	{fg = "#F99575"})
	hi(0, "tsxEqual", 				{fg = "#F99575"})
	hi(0, "TSTagAttribute", 		{fg = "#F8BD7F"})
	
	-- tabline
	hi(0, "TabLineFill", 	{bg = colors.normal_darker})
	hi(0, "TablineActive",	{fg = colors.black, bg = colors.accent})
	vim.cmd([[
		hi! link tabline_a_normal TablineActive
	]])
	
	hi(0, "NvimTreeRootFolder",		{fg = colors.white})
	hi(0, "NvimTreeNormal",			{bg = colors.normal_darker})
	hi(0, "NvimTreeStatusline",     {fg = colors.dark_bg, bg = colors.dark_bg})
	hi(0, "NvimTreeStatuslineNc",   {fg = colors.dark_bg, bg = colors.dark_bg})
	
	-- telescope
	hi(0, "TelescopeBorder",           {fg = colors.white, bg = colors.bg})
	hi(0, "TelescopePromptBorder",     {fg = colors.white, bg = colors.bg})
	hi(0, "TelescopeResultsBorder",    {fg = colors.white, bg = colors.bg})
	hi(0, "TelescopePreviewBorder",    {fg = colors.white, bg = colors.bg})
	
	-- LspDiagnostics
	-- error / warnings
	hi(0, "LspDiagnosticsSignError",           {fg = colors.lred})
	hi(0, "LspDiagnosticsVirtualTextError",    {fg = colors.lred})
	hi(0, "LspDiagnosticsSignWarning",         {fg = colors.yellow})
	hi(0, "LspDiagnosticsVirtualTextWarning",  {fg = colors.yellow})
	
	-- info
	hi(0, "LspDiagnosticsSignInformation",         {fg = colors.green})
	hi(0, "LspDiagnosticsVirtualTextInformation",  {fg = colors.green})
	
	-- hint
	hi(0, "LspDiagnosticsSignHint",        {fg = colors.purple})
	hi(0, "LspDiagnosticsVirtualTextHint", {fg = colors.purple})
	
	-- WhichKey
	hi(0, "WhichKeyDesc",  {fg = colors.green})
	hi(0, "WhichKeyFloat", {bg = colors.normal_darker})
	
	-- basic
	hi(0, "Normal", {bg = colors.bg})
end
return M;
