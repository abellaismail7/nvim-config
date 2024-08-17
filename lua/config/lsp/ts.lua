vim.api.nvim_create_user_command('JSSortImports', ':TSToolsSortImports', {
	nargs = 0,
})

vim.api.nvim_create_user_command('JSOrganizeImports', ':TSToolsOrganizeImports', {
	nargs = 0,
})

vim.api.nvim_create_user_command('JSGoToSourceDefinition', ':TSToolsGoToSourceDefinition', {
	nargs = 0,
})

vim.api.nvim_create_user_command('JSFileReferences', ':TSToolsFileReferences', {
	nargs = 0,
})

vim.api.nvim_create_user_command('JSAddMissingImports', ':TSToolsAddMissingImports', {
	nargs = 0,
})

vim.api.nvim_create_user_command('JSRenameFile', ':TSToolsRenameFile', {
	nargs = 0,
})

vim.api.nvim_create_user_command('JSFixAll', ':TSToolsFixAll', {
	nargs = 0,
})

vim.api.nvim_create_user_command('JSRemoveUnused', ':TSToolsRemoveUnused', {
	nargs = 0,
})

vim.api.nvim_create_user_command('JSRemoveUnusedImports', ':TSToolsRemoveUnusedImports', {
	nargs = 0,
})

return {
	on_attach = function()
		require('keymaps'):lsp()
	end,
}
