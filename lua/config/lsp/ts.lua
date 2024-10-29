local M = {}
local util = require("lspconfig.util")

local nvim_lsp = require("lspconfig")

vim.diagnostic.config({
	update_in_insert = false, -- Disable updates in insert mode
})

function M.setup()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	nvim_lsp.tailwindcss.setup({ on_attach = function() end })
	nvim_lsp.jsonls.setup({ on_attach = function() end })
	nvim_lsp.eslint.setup({ on_attach = function() end })

	nvim_lsp.ts_ls.setup({
		cmd = { "typescript-language-server", "--stdio" },
		capabilities = capabilities,

		on_attach = function()
			require("keymaps"):lsp()
			-- format
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,

		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},

		root_dir = function(fname)
			print(fname, util.root_pattern("deno.json")(fname));
			return (util.root_pattern("tsconfig.json", "jsconfig.json")(fname)
				or util.root_pattern("package.json")(fname))
		end,
		single_file_support = true,

		init_options = {
			maxTsServerMemory = 4096,
			disableAutomaticTypingAcquisition = true,
			preferences = {
				importModuleSpecifierPreference = "non-relative",
				includePackageJsonAutoImports = "auto",
			},
		},

		-- settings = {
		-- 	typescript = {
		-- 		updateImportsOnFileMove = "always",
		-- 		format = {
		-- 			enable = false,
		-- 		},
		-- 		-- Disable automatic type acquisition
		-- 		disableAutomaticTypeAcquisition = true,

		-- 		-- Reduce suggestion computation
		-- 		suggestionActions = {
		-- 			enabled = false,
		-- 		},

		-- 		-- Optimize inlay hints
		-- 		inlayHints = {
		-- 			includeInlayEnumMemberValueHints = false,
		-- 			includeInlayFunctionLikeReturnTypeHints = false,
		-- 			includeInlayFunctionParameterTypeHints = false,
		-- 			includeInlayParameterNameHints = "none",
		-- 			includeInlayPropertyDeclarationTypeHints = false,
		-- 			includeInlayVariableTypeHints = false,
		-- 		},

		-- 		-- Reduce background analysis
		-- 		maxTsServerMemory = 8192,
		-- 		noSemanticValidation = false,
		-- 		noSyntaxValidation = false,
		-- 	},
		-- 	javascript = {
		-- 		updateImportsOnFileMove = "always",
		-- 		tsserver = {
		-- 			maxTsServerMemory = 8192,
		-- 		},
		-- 		format = {
		-- 			enable = false,
		-- 		},
		-- 	},
		-- 	vtsls = {
		-- 		enableMoveToFileCodeAction = true,
		-- 		experimental = {
		-- 			completion = {
		-- 				enableServerSideFuzzyMatch = true,
		-- 				entriesLimit = 50,
		-- 			},
		-- 		},
		-- 	},
		-- 	init_options = {
		-- 		hostInfo = "neovim",
		-- 		preferences = {
		-- 			disableSuggestions = true,
		-- 		},
		-- 		maxTsServerMemory = 8192,
		-- 	},
		-- },
	})
end

return M
