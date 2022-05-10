local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	vim.keymap.set("n", "K",	vim.lsp.buf.hover			, opts)
	vim.keymap.set("n", "gd",	vim.lsp.buf.definition		, opts) -- CTRL-t jump back
	vim.keymap.set("n", "gD",	vim.lsp.buf.declaration		, opts) -- CTRL-t jump back
	vim.keymap.set("n", "gt",	vim.lsp.buf.type_definition	, opts)
	vim.keymap.set("n", "gi",	vim.lsp.buf.implementation	, opts)
	vim.keymap.set("n", "gr", 	vim.lsp.buf.references		, opts)

	vim.keymap.set("n", "<leader>le",	vim.diagnostic.open_float	, opts)
	vim.keymap.set("n", "<leader>ln",	vim.diagnostic.goto_next	, opts)
	vim.keymap.set("n", "<leader>lp",	vim.diagnostic.goto_prev	, opts)
	vim.keymap.set("n", "<leader>lr", 	vim.lsp.buf.rename			, opts)
	vim.keymap.set("n", "<leader>lf",	vim.lsp.buf.formatting		, opts)
	vim.keymap.set("n", ",a",			vim.lsp.buf.code_action		, opts)
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
	"tsserver",
	"cssls",
	"html",
	"svelte",
	"rls",
	"gopls",
	{name = "sumneko_lua" , config = lua_config}
}
for _, lsp in ipairs(servers) do
	if type(lsp) == "table" then
		lsp.config.on_attach = on_attach
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

