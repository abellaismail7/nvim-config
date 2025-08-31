local M = {}

M.setup = function()
	require("conform").setup({
		log_level = vim.log.levels.TRACE,
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { "biome", "biome-organize-imports" },
			typescript = { "biome", "biome-organize-imports" },
			typescriptreact = { "biome" },
			astro = { "prettier" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "never",
		},
		formatters = {
			prettier = {
				args = function(_, ctx) -- first argument is self
					if vim.endswith(ctx.filename, ".astro") then
						return {
							"--stdin-filepath",
							"$FILENAME",
							"--plugin",
							"prettier-plugin-astro",
							"--plugin",
							"prettier-plugin-tailwindcss",
						}
					end
					return { "--stdin-filepath", "$FILENAME", "--plugin", "prettier-plugin-tailwindcss" }
				end,
			},
		},
	})
end

return M
