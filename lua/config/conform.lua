local M = {}

M.setup = function()
	require('conform').setup {
		log_level = vim.log.levels.TRACE,
		formatters_by_ft = {
			lua = { 'stylua' },
			-- Conform will run multiple formatters sequentially
			python = { 'isort', 'black' },
			-- Use a sub-list to run only the first available formatter
			javascript = { 'prettierd', 'prettier' },
			typescript = { 'prettierd', 'prettier' },
			typescriptreact = { 'prettierd', 'prettier' },
			astro = { 'prettier' }
		},
		formatters = {
			prettier = {
				args = function(_, ctx) -- first argument is self
					if vim.endswith(ctx.filename, '.astro') then
						return {
							'--stdin-filepath',
							'$FILENAME',
							'--plugin',
							'prettier-plugin-astro',
							'--plugin',
							'prettier-plugin-tailwindcss',
						}
					end
					return { '--stdin-filepath', '$FILENAME', '--plugin', 'prettier-plugin-tailwindcss' }
				end,
			},
		},
	}
end

return M
