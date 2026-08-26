local servers = {
	"pyright",
	"clangd",
	"dartls",
	"kotlin_language_server",
	"vuels",
	"html",
	"svelte",
	"gopls",
	"jdtls",
	"prismals",
	"ltex",
	"lua_ls",
	"emmet_language_server",
	"biome",
	"tailwindcss",
	"jsonls",
	"eslint",
	"tsgo",
	"denols",
	"gleam",
	"copilot",
}

local M = {}

function M:setup()
	vim.lsp.enable(servers)

	vim.diagnostic.config({
		virtual_text = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = true,
		},
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "󰅚 ",
				[vim.diagnostic.severity.WARN] = "󰀪 ",
				[vim.diagnostic.severity.INFO] = "󰋽 ",
				[vim.diagnostic.severity.HINT] = "󰌶 ",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "ErrorMsg",
				[vim.diagnostic.severity.WARN] = "WarningMsg",
			},
		},
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			require("keymaps").lsp(args.buf)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client:supports_method("textDocument/foldingRange") then
				local win = vim.api.nvim_get_current_win()
				vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
			end
			if client.name == "tsgo" then
				require("config.lsp.tsgo").setup(client, args.buf)
			end
		end,
	})
end

return M
