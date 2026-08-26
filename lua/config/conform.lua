local M = {}

M.setup = function()
	require("conform").setup({
		log_level = vim.log.levels.WARN,
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { "oxfmt", "biome", "prettier" },
			typescript = { "oxfmt", "biome", "prettier" },
			typescriptreact = { "oxfmt", "biome", "prettier" },
			astro = { "prettier" },
			json = { "fixjson" },
			jsonc = { "fixjson" },
			rust = { "rustfmt" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 2000,
			lsp_format = "never",
		},
		formatters = {
			rustfmt = {
				-- conform reads the edition from Cargo.toml; this is the fallback
				-- for standalone files outside a crate.
				options = { default_edition = "2024" },
			},
			biome = {
				require_cwd = true,
			},
			prettier = {
				require_cwd = true,
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
