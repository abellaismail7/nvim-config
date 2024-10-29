return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("config.lualine"),
	},
	{ 'echasnovski/mini.tabline', version = '*' },
}
