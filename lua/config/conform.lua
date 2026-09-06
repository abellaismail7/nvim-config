-- setup
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "fixjson" },
		jsonc = { "fixjson" },
		rust = { "rustfmt" },
		python = { "isort", "black" },
		javascript = { "oxfmt", "biome", "prettier" },
		typescript = { "oxfmt", "biome", "prettier" },
		typescriptreact = { "oxfmt", "biome", "prettier" },
	},
	formatters = {
		biome = {
			require_cwd = true,
		},
	}
});
