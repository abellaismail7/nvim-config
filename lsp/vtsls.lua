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
			updateImportsOnFileMove = "always",
		},
		vtsls = {
			enableMoveToFileCodeAction = true,
		},
		typescript = {
			updateImportsOnFileMove = "always",
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
	},
}
