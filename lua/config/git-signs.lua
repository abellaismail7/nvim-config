-- setup
require("gitsigns").setup({
	signcolumn = false,
	numhl = true,
	on_attach = function(_)
		vim.keymap.set("n", "<leader>sn", [[ <cmd>Gitsigns next_hunk<CR> ]])
		vim.keymap.set("n", "<leader>sp", [[ <cmd>Gitsigns prev_hunk<CR> ]])
		vim.keymap.set("n", "<leader>st", [[ <cmd>Gitsigns toggle_numhl<CR> ]])
		vim.keymap.set("n", "<leader>ss", [[ <cmd>Gitsigns stage_hunk<CR> ]])
		vim.keymap.set("n", "<leader>sr", [[ <cmd>Gitsigns reset_hunk<CR> ]])
		vim.keymap.set("n", "<leader>si", [[ <cmd>Gitsigns preview_hunk_inline<CR> ]])
		vim.keymap.set("n", "<leader>sd", [[ <cmd>Gitsigns diffthis<CR> ]])
		vim.keymap.set("n", "<leader>sb", [[ <cmd>Gitsigns toggle_current_line_blame<CR> ]])
	end,
})
