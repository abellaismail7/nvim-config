local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
	--Enable completion triggered by <c-x><c-o>
	vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', {
		buf = bufnr })
	-- Mappings.
	require("keymaps").lsp()
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
	"pyright",
	"clangd",
	"dartls",
	"kotlin_language_server",
	"vuels",
	"cssls",
	"html",
	"svelte",
	"gopls",
	"jdtls",
	"prismals",
	"ltex",
	"eslint",
	"lua_ls",
	"tailwindcss",
	"biome",
	{ name = "emmet_ls", config = { filetypes = { "html", "css", "typescriptreact" } } },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
	if type(lsp) == "table" then
		local existing_on_attach = lsp.config.on_attach;
		lsp.config.on_attach = function(client, bufnr)
			if existing_on_attach ~= nil then
				existing_on_attach(client, bufnr)
			end
			on_attach(client, bufnr)
		end
		nvim_lsp[lsp.name].setup(lsp.config)
	else
		nvim_lsp[lsp].setup { capabilities = capabilities, on_attach = on_attach }
	end
end

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Show diagnostic popup on cursor hover
local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
	group = diag_float_grp,
})
