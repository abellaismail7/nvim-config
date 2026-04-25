local cmd = { "vtsls", "--stdio" }
local function file_exists(path)
	return vim.fn.filereadable(path) == 1
end

return {
	cmd = cmd,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	root_dir = function(bufnr, on_dir)
		if not file_exists("deno.jsonc") then
			on_dir(vim.fn.getcwd())
		end
	end,
	single_file_support = true,
	settings = {
		javascript = {
			updateImportsOnFileMove = { enabled = "always" },
		},
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				maxInlayHintLength = 30,
				completion = {
					enableServerSideFuzzyMatch = true,
					entriesLimit = 20,
				},
			},
			tsserver = {
				globalPlugins = {},
				maxTsServerMemory = 8192,
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			tsserver = {
				maxTsServerMemory = 8192,
				experimental = {
					enableProjectDiagnostics = false,
				},
				watchOptions = {
					watchFile = "useFsEventsOnParentDirectory",
					watchDirectory = "useFsEvents",
					fallbackPolling = "dynamicPriority",
				},
			},
			preferences = {
				includePackageJsonAutoImports = "auto",
			},
			suggest = {
				completeFunctionCalls = false,
			},
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = false },
				variableTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = false },
				enumMemberValues = { enabled = true },
			},
		},
	},
}
