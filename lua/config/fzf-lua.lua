local M = {}

function M:setup()
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
end

return M
