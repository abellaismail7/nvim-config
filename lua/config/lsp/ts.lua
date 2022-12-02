local api = vim.api
local autocmd = api.nvim_create_autocmd


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
			require("keymaps").lsp()
		end

    },
});
