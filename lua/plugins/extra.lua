return {
	{
		"pteroctopus/faster.nvim",
		config = function()
			require("config.bigfile")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("config.lualine"),
	},
	{ "github/copilot.vim" },
	{ "echasnovski/mini.tabline", version = "*", opts = require("config.mini.tabline") },
	{ "tiagovla/scope.nvim", config = true },
	{ "echasnovski/mini.pairs", version = "*", opts = require("config.mini.autopair") },
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-w>h", "<cmd>:TmuxNavigateLeft<cr>" },
			{ "<c-w>j", "<cmd>:TmuxNavigateDown<cr>" },
			{ "<c-w>k", "<cmd>:TmuxNavigateUp<cr>" },
			{ "<c-w>l", "<cmd>:TmuxNavigateRight<cr>" },
		},
	},
}
