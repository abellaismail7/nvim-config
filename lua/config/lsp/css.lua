local M = {}
local util = require("lspconfig.util")

local nvim_lsp = require("lspconfig")

function M.setup()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	nvim_lsp.cssls.setup({

		on_attach = function()
			require("keymaps"):lsp()
			-- format
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,

		capabilities = capabilities,
		settings = {
			css = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
			scss = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
			less = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
		},
	})
end

return M
