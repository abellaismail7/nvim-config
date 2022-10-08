local colors = require("theme").get_theme_tb "base_30"
local base16 = require("theme").get_theme_tb "base_16"
local theme = base16

return {
	AlphaHeader = { fg = colors.grey_fg },
	AlphaButtons = { fg = colors.light_grey },

	IndentBlanklineChar = { fg = colors.line },
	IndentBlanklineSpaceChar = { fg = colors.line },
	IndentBlanklineContextChar = { fg = colors.grey },
	IndentBlanklineContextStart = { bg = colors.one_bg2 },

	
	-- nvim cmp
	CmpItemAbbr = { fg = colors.white },
	CmpItemAbbrMatch = { fg = colors.blue, bold = true },
	CmpBorder = { fg = colors.grey },
	CmpDocBorder = { fg = colors.darker_black, bg = colors.darker_black },
	CmPmenu = { bg = colors.darker_black },
	
	-- cmp item kinds
	CmpItemKindConstant = { fg = base16.base09 },
	CmpItemKindFunction = { fg = base16.base0D },
	CmpItemKindIdentifier = { fg = base16.base08 },
	CmpItemKindField = { fg = base16.base08 },
	CmpItemKindVariable = { fg = base16.base0E },
	CmpItemKindSnippet = { fg = colors.red },
	CmpItemKindText = { fg = base16.base0B },
	CmpItemKindStructure = { fg = base16.base0E },
	CmpItemKindType = { fg = base16.base0A },
	CmpItemKindKeyword = { fg = base16.base07 },
	CmpItemKindMethod = { fg = base16.base0D },
	CmpItemKindConstructor = { fg = colors.blue },
	CmpItemKindFolder = { fg = base16.base07 },
	CmpItemKindModule = { fg = base16.base0A },
	CmpItemKindProperty = { fg = base16.base08 },
	-- CmpItemKindEnum = { fg = "" },
	CmpItemKindUnit = { fg = base16.base0E },
	-- CmpItemKindClass = { fg = "" },
	CmpItemKindFile = { fg = base16.base07 },
	-- CmpItemKindInterface = { fg = "" },
	CmpItemKindColor = { fg = colors.red },
	CmpItemKindReference = { fg = base16.base05 },
	-- CmpItemKindEnumMember = { fg = "" },
	CmpItemKindStruct = { fg = base16.base0E },
	-- CmpItemKindValue = { fg = "" },
	-- CmpItemKindEvent = { fg = "" },
	CmpItemKindOperator = { fg = base16.base05 },
	CmpItemKindTypeParameter = { fg = base16.base08 },
	CmpItemKindCopilot = { fg = colors.green },

	MatchWord = {
	  bg = colors.grey,
	  fg = colors.white,
	},
	
	Pmenu = { bg = colors.one_bg },
	PmenuSbar = { bg = colors.one_bg },
	PmenuSel = { bg = colors.pmenu_bg, fg = colors.black },
	PmenuThumb = { bg = colors.grey },
	
	MatchParen = { link = "MatchWord" },
	
	Comment = { fg = colors.grey_fg },
	
	CursorLineNr = { fg = colors.white },
	LineNr = { fg = colors.grey },
	
	-- floating windows
	FloatBorder = { fg = colors.blue },
	NormalFloat = { bg = colors.darker_black },
	
	NvimInternalError = { fg = colors.red },
	WinSeparator = { fg = colors.line },
	
	-- packer
	PackerPackageName = { fg = colors.red },
	PackerSuccess = { fg = colors.green },
	PackerStatusSuccess = { fg = base16.base08 },
	PackerStatusCommit = { fg = colors.blue },
	PackeProgress = { fg = colors.blue },
	PackerOutput = { fg = colors.red },
	PackerStatus = { fg = colors.blue },
	PackerHash = { fg = colors.blue },
	
	Normal = {
	  fg = base16.base05,
	  bg = base16.base00,
	},
	
	Bold = {
	  bold = true,
	},
	
	Debug = {
	  fg = base16.base08,
	},
	
	Directory = {
	  fg = base16.base0D,
	},
	
	Error = {
	  fg = base16.base00,
	  bg = base16.base08,
	},
	
	ErrorMsg = {
	  fg = base16.base08,
	  bg = base16.base00,
	},
	
	Exception = {
	  fg = base16.base08,
	},
	
	FoldColumn = {
	  fg = base16.base0C,
	  bg = base16.base01,
	},
	
	Folded = {
	  fg = base16.base03,
	  bg = base16.base01,
	},
	
	IncSearch = {
	  fg = base16.base01,
	  bg = base16.base09,
	},
	
	Italic = {
	  italic = true,
	},
	
	Macro = {
	  fg = base16.base08,
	},
	
	ModeMsg = {
	  fg = base16.base0B,
	},
	
	MoreMsg = {
	  fg = base16.base0B,
	},
	
	Question = {
	  fg = base16.base0D,
	},
	
	Search = {
	  fg = base16.base01,
	  bg = base16.base0A,
	},
	
	Substitute = {
	  fg = base16.base01,
	  bg = base16.base0A,
	  sp = "none",
	},
	
	SpecialKey = {
	  fg = base16.base03,
	},
	
	TooLong = {
	  fg = base16.base08,
	},
	
	UnderLined = {
	  fg = base16.base0B,
	},
	
	Visual = {
	  bg = base16.base02,
	},
	
	VisualNOS = {
	  fg = base16.base08,
	},
	
	WarningMsg = {
	  fg = base16.base08,
	},
	
	WildMenu = {
	  fg = base16.base08,
	  bg = base16.base0A,
	},
	
	Title = {
	  fg = base16.base0D,
	  sp = "none",
	},
	
	Conceal = {
	  bg = "NONE",
	},
	
	Cursor = {
	  fg = base16.base00,
	  bg = base16.base05,
	},
	
	NonText = {
	  fg = base16.base03,
	},
	
	SignColumn = {
	  fg = base16.base03,
	  sp = "NONE",
	},
	
	ColorColumn = {
	  bg = base16.base01,
	  sp = "none",
	},
	
	CursorColumn = {
	  bg = base16.base01,
	  sp = "none",
	},
	
	CursorLine = {
	  bg = "none",
	  sp = "none",
	},
	
	QuickFixLine = {
	  bg = base16.base01,
	  sp = "none",
	},
	
	-- spell
	SpellBad = {
	  undercurl = true,
	  sp = base16.base08,
	},
	
	SpellLocal = {
	  undercurl = true,
	  sp = base16.base0C,
	},
	
	SpellCap = {
	  undercurl = true,
	  sp = base16.base0D,
	},
	
	SpellRare = {
	  undercurl = true,
	  sp = base16.base0E,
	},
	
	healthSuccess = {
	  bg = colors.green,
	  fg = colors.black,
	},

	DiffAdded = {fg = colors.green},
	DiffChange = {fg = colors.yellow},
	DiffDelete = {fg = colors.red},

	FidgetTitle = { fg =  colors.accent},
	FidgetTask = { fg = colors.white },

	TabLineFill = { bg = colors.black },
	TablineActive = { fg = colors.black, bg = colors.orange },
	tabline_a_normal = { fg = colors.black, bg = colors.orange },

	DevIconDefault = { fg = colors.red },
	DevIconc = { fg = colors.blue },
	DevIconcss = { fg = colors.blue },
	DevIcondeb = { fg = colors.cyan },
	DevIconDockerfile = { fg = colors.cyan },
	DevIconhtml = { fg = colors.baby_pink },
	DevIconjpeg = { fg = colors.dark_purple },
	DevIconjpg = { fg = colors.dark_purple },
	DevIconjs = { fg = colors.sun },
	DevIconkt = { fg = colors.orange },
	DevIconlock = { fg = colors.red },
	DevIconlua = { fg = colors.blue },
	DevIconmp3 = { fg = colors.white },
	DevIconmp4 = { fg = colors.white },
	DevIconout = { fg = colors.white },
	DevIconpng = { fg = colors.dark_purple },
	DevIconpy = { fg = colors.cyan },
	DevIcontoml = { fg = colors.blue },
	DevIconts = { fg = colors.teal },
	DevIconttf = { fg = colors.white },
	DevIconrb = { fg = colors.pink },
	DevIconrpm = { fg = colors.orange },
	DevIconvue = { fg = colors.vibrant_green },
	DevIconwoff = { fg = colors.white },
	DevIconwoff2 = { fg = colors.white },
	DevIconxz = { fg = colors.sun },
	DevIconzip = { fg = colors.sun },
	DevIconZig = { fg = colors.orange },
	
	TelescopeBorder = {
	  fg = colors.darker_black,
	  bg = colors.darker_black,
	},
	
	TelescopePromptBorder = {
	  fg = colors.black2,
	  bg = colors.black2,
	},
	
	TelescopePromptNormal = {
	  fg = colors.white,
	  bg = colors.black2,
	},
	
	TelescopePromptPrefix = {
	  fg = colors.red,
	  bg = colors.black2,
	},
	
	TelescopeNormal = { bg = colors.darker_black },
	
	TelescopePreviewTitle = {
	  fg = colors.black,
	  bg = colors.green,
	},
	
	TelescopePromptTitle = {
	  fg = colors.black,
	  bg = colors.red,
	},
	
	TelescopeResultsTitle = {
	  fg = colors.darker_black,
	  bg = colors.darker_black,
	},
	
	TelescopeSelection = { bg = colors.black2, fg = colors.white },
	
	TelescopeResultsDiffAdd = {
	  fg = colors.green,
	},
	
	TelescopeResultsDiffChange = {
	  fg = colors.yellow,
	},
	
	TelescopeResultsDiffDelete = {
	  fg = colors.red,
	},

	WhichKey = { fg = colors.blue },
	WhichKeySeparator = { fg = colors.light_grey },
	WhichKeyDesc = { fg = colors.red },
	WhichKeyGroup = { fg = colors.green },
	WhichKeyValue = { fg = colors.green },

	Boolean = {
	  fg = theme.base09,
	},
	
	Character = {
	  fg = theme.base08,
	},
	
	Conditional = {
	  fg = theme.base0E,
	},
	
	Constant = {
	  fg = theme.base08,
	},
	
	Define = {
	  fg = theme.base0E,
	  sp = "none",
	},
	
	Delimiter = {
	  fg = theme.base0F,
	},
	
	Float = {
	  fg = theme.base09,
	},
	
	Variable = {
	  fg = theme.base05,
	},
	
	Function = {
	  fg = theme.base0D,
	},
	
	Identifier = {
	  fg = theme.base08,
	  sp = "none",
	},
	
	Include = {
	  fg = theme.base0D,
	},
	
	Keyword = {
	  fg = theme.base0E,
	},
	
	Label = {
	  fg = theme.base0A,
	},
	
	Number = {
	  fg = theme.base09,
	},
	
	Operator = {
	  fg = theme.base05,
	  sp = "none",
	},
	
	PreProc = {
	  fg = theme.base0A,
	},
	
	Repeat = {
	  fg = theme.base0A,
	},
	
	Special = {
	  fg = theme.base0C,
	},
	
	SpecialChar = {
	  fg = theme.base0F,
	},
	
	Statement = {
	  fg = theme.base08,
	},
	
	StorageClass = {
	  fg = theme.base0A,
	},
	
	String = {
	  fg = theme.base0B,
	},
	
	Structure = {
	  fg = theme.base0E,
	},
	
	Tag = {
	  fg = theme.base0A,
	},
	
	Todo = {
	  fg = theme.base0A,
	  bg = theme.base01,
	},
	
	Type = {
	  fg = theme.base0A,
	  sp = "none",
	},
	
	Typedef = {
	  fg = theme.base0A,
	},

	TSAnnotation = {
	  fg = theme.base0F,
	},
	
	TSAttribute = {
	  fg = theme.base0A,
	},
	
	TSTagAttribute = {
	  link = "TSProperty",
	},
	
	TSCharacter = {
	  fg = theme.base08,
	},
	
	TSConstructor = {
	  fg = theme.base0C,
	},
	
	TSConstBuiltin = {
	  fg = theme.base09,
	},
	
	TSConstMacro = {
	  fg = theme.base08,
	},
	
	TSError = {
	  fg = theme.base08,
	},
	
	TSException = {
	  fg = theme.base08,
	},
	
	TSFloat = {
	  fg = theme.base09,
	},
	
	TSKeyword = {
	  fg = theme.base0E,
	},
	
	TSKeywordFunction = {
	  fg = theme.base0E,
	},
	
	TSKeywordReturn = {
	  fg = theme.base0E,
	},
	
	TSFunction = {
	  fg = theme.base0D,
	},
	
	TSFuncBuiltin = {
	  fg = theme.base0D,
	},
	
	TSFuncMacro = {
	  fg = theme.base08,
	},
	
	TSKeywordOperator = {
	  fg = theme.base0E,
	},
	
	TSMethod = {
	  fg = theme.base0D,
	},
	
	TSNamespace = {
	  fg = theme.base08,
	},
	
	TSNone = {
	  fg = theme.base05,
	},
	
	TSParameter = {
	  fg = theme.base08,
	},
	
	TSParameterReference = {
	  fg = theme.base05,
	},
	
	TSPunctBracket = {
	  fg = theme.base0F,
	},
	
	TSPunctDelimiter = {
	  fg = theme.base0F,
	},
	
	TSPunctSpecial = {
	  fg = theme.base08,
	},
	
	TSStringRegex = {
	  fg = theme.base0C,
	},
	
	TSStringEscape = {
	  fg = theme.base0C,
	},
	
	TSSymbol = {
	  fg = theme.base0B,
	},
	
	TSTagDelimiter = {
	  fg = theme.base0F,
	},
	
	TSText = {
	  fg = theme.base05,
	},
	
	TSStrong = {
	  bold = true,
	},
	
	TSEmphasis = {
	  fg = theme.base09,
	},
	
	TSStrike = {
	  fg = theme.base00,
	  strikethrough = true,
	},
	
	TSLiteral = {
	  fg = theme.base09,
	},
	
	TSURI = {
	  fg = theme.base09,
	
	  underline = true,
	},
	
	TSTypeBuiltin = {
	  fg = theme.base0A,
	},
	
	TSVariableBuiltin = {
	  fg = theme.base09,
	},
	
	TSVariable = {
	  fg = theme.base05,
	},
	
	TSDefinition = {
	  sp = theme.base04,
	  underline = true,
	},
	
	TSDefinitionUsage = {
	  sp = theme.base04,
	  underline = true,
	},
	
	TSCurrentScope = {
	  bold = true,
	},
	
	luaTSField = {
	  fg = theme.base0D,
	},
	
	TSFieldKey = {
	  fg = theme.base08,
	},
	
	TSProperty = {
	  fg = theme.base08,
	},
	
	TSInclude = {
	  link = "Include",
	},
	
	TSConditional = {
	  link = "Conditional",
	},

	NvimTreeEmptyFolderName = { fg = colors.folder_bg },
	NvimTreeEndOfBuffer = { fg = colors.darker_black },
	NvimTreeFolderIcon = { fg = colors.folder_bg },
	NvimTreeFolderName = { fg = colors.folder_bg },
	NvimTreeGitDirty = { fg = colors.red },
	NvimTreeIndentMarker = { fg = colors.grey_fg },
	NvimTreeNormal = { bg = colors.darker_black },
	NvimTreeNormalNC = { bg = colors.darker_black },
	NvimTreeOpenedFolderName = { fg = colors.folder_bg },
	NvimTreeGitIgnored = { fg = colors.light_grey },
	
	NvimTreeWinSeparator = {
	  fg = colors.darker_black,
	  bg = colors.darker_black,
	},
	
	NvimTreeWindowPicker = {
	  fg = colors.red,
	  bg = colors.black2,
	},
	
	NvimTreeCursorLine = {
	  bg = colors.black2,
	},
	
	NvimTreeGitNew = {
	  fg = colors.yellow,
	},
	
	NvimTreeGitDeleted = {
	  fg = colors.red,
	},
	
	NvimTreeSpecialFile = {
	  fg = colors.yellow,
	  bold = true,
	},
	
	NvimTreeRootFolder = {
	  fg = colors.red,
	  bold = true,
	},
	
	-- LSP References
	LspReferenceText = { fg = colors.darker_black, bg = colors.white },
	LspReferenceRead = { fg = colors.darker_black, bg = colors.white },
	LspReferenceWrite = { fg = colors.darker_black, bg = colors.white },
	
	-- Lsp Diagnostics
	DiagnosticHint = { fg = colors.purple },
	DiagnosticError = { fg = colors.red },
	DiagnosticWarn = { fg = colors.yellow },
	DiagnosticInformation = { fg = colors.green },
	LspSignatureActiveParameter = { fg = colors.black, bg = colors.green },
	
	RenamerTitle = { fg = colors.black, bg = colors.red },
	RenamerBorder = { fg = colors.red },
}
