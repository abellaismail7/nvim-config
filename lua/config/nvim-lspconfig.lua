local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	buf_set_keymap("n", "K", [[<cmd>lua vim.lsp.buf.hover()<cr>]], opts);
	buf_set_keymap("n", "gd", [[<cmd>lua vim.lsp.buf.definition()<cr>]], opts) -- CTRL-t jump back
	buf_set_keymap("n", "gt", [[<cmd>lua vim.lsp.buf.type_definition()<cr>]], opts)
	buf_set_keymap("n", "gi", [[<cmd>lua vim.lsp.buf.implementation()<cr>]], opts)

	buf_set_keymap("n", "<leader>le",	[[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>]], opts)
	buf_set_keymap("n", "<leader>ln",	[[<cmd>lua vim.lsp.diagnostic.goto_next()<cr>]], opts)
	buf_set_keymap("n", "<leader>lp",	[[<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>]], opts)

	buf_set_keymap("n", "<leader>ld", 	[[<cmd>lua vim.lsp.buf.declaration()<cr>]], opts)
	buf_set_keymap("n", "<leader>lrn", 	[[<cmd>lua vim.lsp.buf.rename()<cr>]], opts)
	buf_set_keymap("n", "<leader>lre", 	[[<cmd>lua vim.lsp.buf.references()<cr>]], opts)
	buf_set_keymap("n", "<leader>lf",	[[<cmd>lua vim.lsp.buf.formatting()<cr>]], opts)
	buf_set_keymap("n", ",a",	[[<cmd>lua vim.lsp.buf.code_action()<cr>]], opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "clangd", "dartls", "kotlin_language_server", "vuels", "tsserver", "cssls", "html", "svelte", "rust_analyzer" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

