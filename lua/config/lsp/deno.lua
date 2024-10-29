
local M = {}
local util = require("lspconfig.util")

local nvim_lsp = require("lspconfig")

vim.diagnostic.config({
	update_in_insert = false, -- Disable updates in insert mode
})

function M.setup()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	nvim_lsp.denols.setup({
		capabilities = capabilities,
		on_attach = function()
			require("keymaps"):lsp()
			-- format
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,

		root_dir = function(fname)
				return util.root_pattern("deno.json")(fname)
		end,

	})
end

return M
