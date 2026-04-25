return {
	-- Libraries
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{ "stevearc/dressing.nvim", lazy = true }, -- optional for vim.ui.select
	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp"):setup()
		end,
	},
	-- Languages
	-- Rust
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		ft = { "rust" },
		config = function()
			require("config.lsp.rust")
		end,
	},
	-- Flutter
	{
		"akinsho/flutter-tools.nvim",
		ft = { "dart" },
		dependencies = {
			"stevearc/dressing.nvim",
		},
		config = function()
			require("config.lsp.flutter")
		end,
	},
	-- Typescript
	--{
	--	'pmizio/typescript-tools.nvim',
	--	opts = require 'config.lsp.ts',
	--},

	{
		"yioneko/nvim-vtsls",
		config = function()
			--require('config.lsp.ts').setup()
		end,
	},

	-- Format / Linting
	{
		"stevearc/conform.nvim",
		config = function()
			require("config.conform").setup()
		end,
	},
	-- Neovim development
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },

	{
		"ray-x/lsp_signature.nvim",
		opts = {
			bind = false,
			floating_window = false,
			transparency = 10,
			handler_opts = {
				border = "single",
			},
			toggle_key = "<leader-x>",
		},
	},
	{
		"elixir-tools/elixir-tools.nvim",
		version = "*",
		ft = { "elixir", "eelixir", "heex" },
		config = function()
			local elixir = require("elixir")
			local elixirls = require("elixir.elixirls")

			elixir.setup({
				nextls = { enable = true },
				elixirls = {
					enable = true,
					settings = elixirls.settings({
						dialyzerEnabled = false,
						enableTestLenses = false,
					}),
					on_attach = function(client, bufnr)
						vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
						vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
						vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
					end,
				},
				projectionist = {
					enable = true,
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
