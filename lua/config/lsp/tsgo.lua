local M = {}

local function run(kind, bufnr)
	return function()
		vim.lsp.buf.code_action({
			context = { only = { kind }, diagnostics = {} },
			apply = true,
			bufnr = bufnr,
		})
	end
end

local actions = {
	{ cmd = "TsAddMissingImports", key = "ia", kind = "source.addMissingImports.ts", desc = "Ts: add missing imports" },
	{ cmd = "TsOrganizeImports",   key = "io", kind = "source.organizeImports.ts",   desc = "Ts: organize imports" },
	{ cmd = "TsRemoveUnused",      key = "iu", kind = "source.removeUnused.ts",      desc = "Ts: remove unused" },
	{ cmd = "TsFixAll",            key = "if", kind = "source.fixAll.ts",            desc = "Ts: fix all" },
}

function M.setup(_client, bufnr)
	for _, a in ipairs(actions) do
		local fn = run(a.kind, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, a.cmd, fn, { desc = a.desc })
		vim.keymap.set("n", "<leader>" .. a.key, fn, { buffer = bufnr, desc = a.desc })
	end
end

return M
