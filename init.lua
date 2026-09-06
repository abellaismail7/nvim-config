-- options
require("opts")

-- on:startup
require("startup")
require("autocmd")

-- global deps
vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/AlexvZyl/nordic.nvim",
	"https://github.com/copilotlsp-nvim/copilot-lsp",
	"https://github.com/zbirenbaum/copilot.lua",

	-- Snip
	"https://github.com/L3MON4D3/LuaSnip",

	-- Vim Lord Belessings
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-dadbod",

	"https://github.com/kristijanhusak/vim-dadbod-completion",
	"https://github.com/kristijanhusak/vim-dadbod-ui",

	-- Sandwich keymaps
	"https://github.com/machakann/vim-sandwich",
	-- Multi cursor support
	"https://github.com/mg979/vim-visual-multi",

	-- tree-sitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	-- Git
	"https://github.com/lewis6991/gitsigns.nvim",

	-- cmp
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },

	-- lsp plugins
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("^9") }, -- should be updated regulary
	{ src = "https://github.com/folke/lazydev.nvim" },

	-- status line
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",

	-- formatters
	{ src = "https://github.com/stevearc/conform.nvim" },
	-- misc
	{ src = "https://github.com/tiagovla/scope.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/j-hui/fidget.nvim" },

	-- 'https://github.com/'
})

require("config")
require("lsp")
require("keymaps")
