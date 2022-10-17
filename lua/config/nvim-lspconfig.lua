local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	require("keymaps").lsp()
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local lua_config = require"config.lua-lang-server"
local servers = {
	"pyright",
	"clangd",
	"dartls",
	"kotlin_language_server",
	"vuels",
	"cssls",
	"html",
	"svelte",
	"rls",
	"gopls",
	"jdtls",
	{name = "emmet_ls", config = { filetypes = {"html", "css", "typescriptreact"}}},
	{name = "tsserver", config = require"config.ts-lang-server"},
	{name = "sumneko_lua" , config = lua_config}
}
for _, lsp in ipairs(servers) do
	if type(lsp) == "table" then
		local existing_on_attach = lsp.config.on_attach;
		lsp.config.on_attach = function (client, bufnr)
			if existing_on_attach ~= nil then
				existing_on_attach(client, bufnr)
			end
			on_attach(client, bufnr)
		end
  		nvim_lsp[lsp.name].setup(lsp.config)
	else
  		nvim_lsp[lsp].setup { on_attach = on_attach }
	end
end

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)
