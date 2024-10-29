return {
	-- Libraries

	{ 'stevearc/dressing.nvim', lazy = true }, -- optional for vim.ui.select
	-- LSP Configuration & Plugins
	{
		'neovim/nvim-lspconfig',
		config = function()
			require 'config.lsp'
		end
	},
	-- Languages
	-- Rust
	{
		'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		lazy = false,
	},
	-- Flutter
	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		-- config = function()
		--   require 'config.lsp.flutter'
		-- end,
	},
	-- Typescript
	--{
	--	'pmizio/typescript-tools.nvim',
	--	opts = require 'config.lsp.ts',
	--},

	-- {
	-- 	'yioneko/nvim-vtsls',
	-- },

	-- Format / Linting
	{
		'stevearc/conform.nvim',
		config = function()
			require('config.conform').setup()
		end,
	},
	-- Neovim development
	{
		"folke/lazydev.nvim",
		ft = 'lua',
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta",   lazy = true },

	{
		'ray-x/lsp_signature.nvim',
		opts = {
			bind = false,
			floating_window = false,
			transparency = 10,
			handler_opts = {
				border = 'single',
			},
			toggle_key = '<leader-x>',
		},
	},
}
