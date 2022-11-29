local formatting = require "null-ls.builtins._meta.formatting"
local api = vim.api
local autocmd = api.nvim_create_autocmd

local group = vim.api.nvim_create_augroup("MyLSPAutogroup", {})

require("typescript").setup({
    server = {
		on_attach = function()
			autocmd("BufWritePre", {
				pattern = "<buffer>",
				callback = function ()
					vim.lsp.buf.format({
						async  = true,
						filter = function (cl)
							return cl.name ~= "tsserver";
						end,
					})
				end
			})
		end

    },
});
