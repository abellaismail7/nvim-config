-- setup
require("nordic").load({
	cursorline = {
		bold = false,
		bold_number = true,
		theme = "light",
		blend = 1,
	},

	on_highlight = function(highlights, palette)
		highlights.MiniTablineVisible = { bg = palette.bg_statusline, fg = palette.fg } -- tab pages line, not active tab page label
		highlights.MiniTablineFill = { bg = palette.black0, fg = palette.none } -- tab pages line, where there are no labels
		highlights.MiniTablineCurrent = { fg = palette.black0, bg = palette.orange.base, bold = true } -- tab pages line, active tab page label
		highlights.MiniTablineTabpagesection = { fg = palette.black0, bg = palette.orange.base, bold = true } -- tab pages line, active tab page label
	end,
})
