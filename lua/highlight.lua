local hi = vim.api.nvim_set_hl

local colors = {
	white = "#ffffff",
	bg = "#1c1c1c",
}

hi(0, "VertSplit", { fg = colors.white, bg = colors.bg })
