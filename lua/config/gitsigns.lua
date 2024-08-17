return {
	signcolumn = false,
	numhl = true,
	on_attach = function(_)
		vim.keymap.set('n', '<leader>gn', [[ <cmd>Gitsigns next_hunk<CR> ]])
		vim.keymap.set('n', '<leader>gp', [[ <cmd>Gitsigns prev_hunk<CR> ]])
		vim.keymap.set('n', '<leader>gt', [[ <cmd>Gitsigns toggle_numhl<CR> ]])
		vim.keymap.set('n', '<leader>gs', [[ <cmd>Gitsigns stage_hunk<CR> ]])
		vim.keymap.set('n', '<leader>gr', [[ <cmd>Gitsigns reset_hunk<CR> ]])
		vim.keymap.set('n', '<leader>gi', [[ <cmd>Gitsigns preview_hunk_inline<CR> ]])
		vim.keymap.set('n', '<leader>gd', [[ <cmd>Gitsigns diffthis<CR> ]])
		vim.keymap.set('n', '<leader>gb', [[ <cmd>Gitsigns toggle_current_line_blame<CR> ]])
		vim.keymap.set('n', '<leader>gf', [[ <cmd>Gitsigns stage_buffer<CR> ]])
	end,
}
