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
	"jsonls",
	"ltex",
	"eslint",
	"tailwindcss",
	{name = "emmet_ls", config = { filetypes = {"html", "css", "typescriptreact"}}},
	{name = "lua_ls" , config = require"config.lsp.lua"}
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
  		nvim_lsp[lsp].setup { capabilities = capabilities,  on_attach = on_attach }
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

-- Show diagnostic popup on cursor hover
local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
   vim.diagnostic.open_float(nil, { focusable = false })
  end,
  group = diag_float_grp,
})
