
local nvim_lsp = require("lspconfig")

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
	"biome",
	"emmet_language_server",
}

local M = {};

function M:setup()
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	for _, lsp in ipairs(servers) do
			nvim_lsp[lsp].setup { capabilities = capabilities, on_attach = function() end}
	end
end

return M;
