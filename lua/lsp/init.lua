vim.lsp.enable({
  "bashls",
	"biome",
	"clangd",
	"copilot",
	"dartls",
	"denols",
	"emmet_language_server",
	"eslint",
	"gleam",
	"gopls",
	"html",
	"jdtls",
	"jsonls",
	"kotlin_language_server",
	"ltex",
	"lua_ls",
	"prismals",
	"pyright",
	"svelte",
	"tailwindcss",
	"tsc",
	"vuels",
})
vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("__lsp", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "tsc" then
			require("lsp.tsc").setup(args.buf)
		end
	end,
})
