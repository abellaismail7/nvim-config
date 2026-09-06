-- setup
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
		-- the js/ts lists below are fallback chains, not pipelines
		stop_after_first = true,
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
