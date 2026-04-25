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
	-- { "github/copilot.vim" },
	{
		"folke/sidekick.nvim",
		config = function()
			require("config.ai.sidekick"):setup()
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
		},
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("config.copilot").setup({})
		end,
	},
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
