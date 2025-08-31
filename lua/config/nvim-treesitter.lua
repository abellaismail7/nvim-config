-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
return {
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = {
		"c",
		"cpp",
		"go",
		"lua",
		"python",
		"rust",
		"tsx",
		"typescript",
		"vimdoc",
		"vim",
		"prisma",
		"astro",
		"svelte",
	},

	-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
	auto_install = true,

	highlight = { enable = true },
	indent = { enable = true, disable = { "python" } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<M-space>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = { query = "@parameter.outer", desc = "" },
				["ia"] = { query = "@parameter.inner", desc = "" },

				["a="] = { query = "@assignment.outer", desc = "" },
				["i="] = { query = "@assignment.inner", desc = "" },
				["l="] = { query = "@assignment.lhs", desc = "" },
				["r="] = { query = "@assignment.rhs", desc = "" },

				["am"] = { query = "@function.outer", desc = "" },
				["im"] = { query = "@function.inner", desc = "" },

				["af"] = { query = "@call.outer", desc = "" },
				["if"] = { query = "@call.inner", desc = "" },

				["al"] = { query = "@loop.outer", desc = "" },
				["il"] = { query = "@loop.inner", desc = "" },

				["ai"] = { query = "@conditional.outer", desc = "" },
				["ii"] = { query = "@conditional.inner", desc = "" },

				["ac"] = { query = "@class.outer", desc = "" },
				["ic"] = { query = "@class.inner", desc = "" },
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@call.outer",
				["]m"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@call.outer",
				["]M"] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@call.outer",
				["[m"] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@call.outer",
				["[M"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
}
