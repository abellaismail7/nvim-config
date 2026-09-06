-- setup
require("fzf-lua").setup({
	"default-title",
	fzf_colors = {
		["bg+"] = { "bg", "Visual" },
		["fg+"] = { "fg", "Normal" },
		["hl+"] = { "fg", "Statement" },
		["hl"] = { "fg", "Statement" },
		["gutter"] = "-1",
	},
	keymap = {
		fzf = {
			["ctrl-q"] = "select-all+accept",
		},
	},
	winopts = {
		row = 0.35,
		col = 0.5,
		height = 0.7,
		width = 0.75,
	},
	buffers = {
		winopts = { preset = "dropdown", preview = { hidden = "hidden" } },
	},
	files = {
		winopts = { preset = "dropdown" },
	},
	lsp = {
		symbols = {
			winopts = { preset = "dropdown" },
		},
	},
})

-- keymap

local fzf = require("fzf-lua")
vim.keymap.set("n", "<leader>?", fzf.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "gl", fzf.lsp_document_symbols, { desc = "[G]o to [L]sp of symbols" })
vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>fs", fzf.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>fd", fzf.diagnostics_workspace, { desc = "[S]earch [D]iagnostics" })

