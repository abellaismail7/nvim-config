return {
	-- Libraries (Lua plugins/libraries are automatically loaded when they are require())
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "echasnovski/mini.icons", lazy = true },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-sleuth" },
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-completion" },
	{ "kristijanhusak/vim-dadbod-ui" },
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local palette = require("nordic.colors")
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
					highlights.MiniTablineTabpagesection =
						{ fg = palette.black0, bg = palette.orange.base, bold = true } -- tab pages line, active tab page label
				end,
			})
		end,
	},
	{ "ThePrimeagen/git-worktree.nvim" },
	-- sandwich keymaps
	{ "machakann/vim-sandwich" },
	-- Multi cursor support
	{ "mg979/vim-visual-multi" },
	-- Powerful File System Manipulation
	{
		"stevearc/oil.nvim",
		keys = require("keymaps"):oil(),
		cmd = { "Oil" },
		opts = require("config.oil"),
	},
	-- Fuzzy Finder (files, Lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		opts = require("config.telescope"),
	},
	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
		--lazy = false,
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<c-space>", desc = "Increment Selection" },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		opts_extend = { "ensure_installed" },
		opts = require("config.nvim-treesitter"),
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- Auto completion
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("config.nvim-cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"rafamadriz/friendly-snippets",
		},
	},
	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "make install_jsregexp",
		lazy = true,
	},
	-- Git signs (preview hunks, blame ...)
	{
		"lewis6991/gitsigns.nvim",
		opts = require("config.gitsigns"),
		cmd = { "Gitsigns" },
		lazy = false,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
}
