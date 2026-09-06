-- icons: must run before oil/fzf-lua/lualine so the devicons mock is in place
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

-- notify: replaces fidget, also gives `:lua MiniNotify.show_history()`
require("mini.notify").setup()
vim.notify = require("mini.notify").make_notify()

-- surround: replaces vim-sandwich, same sa/sd/sr mappings
require("mini.surround").setup()

require("mini.move").setup({
	mappings = {
		-- visual only: <C-h/j/k/l> in normal mode belong to tmux-navigator
		down = "<C-j>",
		up = "<C-k>",
		left = "",
		right = "",

		line_down = "",
		line_up = "",
		line_left = "",
		line_right = "",
	},
})

require("mini.bufremove").setup()

-- extra: pickers and the `ai` specs used just below
require("mini.extra").setup()

-- ai: richer a/i textobjects, replaces nvim-treesitter-textobjects
-- (no textobjects.scm queries in the runtime, so the specs here are non-treesitter)
require("mini.ai").setup({
	n_lines = 500,
	custom_textobjects = {
		B = MiniExtra.gen_ai_spec.buffer(),
		D = MiniExtra.gen_ai_spec.diagnostic(),
		I = MiniExtra.gen_ai_spec.indent(),
		L = MiniExtra.gen_ai_spec.line(),
		N = MiniExtra.gen_ai_spec.number(),
	},
})

-- sessions: global named sessions only, no Session.vim dropped into project dirs
local session_dir = vim.fn.stdpath("data") .. "/session"
vim.fn.mkdir(session_dir, "p")
require("mini.sessions").setup({
	directory = session_dir,
	file = "",
	autowrite = true,
})

-- pick: also takes over `vim.ui.select`
require("mini.pick").setup()

-- misc: setup_auto_root replaces the chdir in startup.lua, zoom replaces <C-w>|
require("mini.misc").setup()
MiniMisc.setup_auto_root()

require("mini.tabline").setup({
	tabpage_section = "right",
})

require("mini.pairs").setup({})

-- clue: which-key for the leader-heavy maps; descriptions are read from the
-- `desc` on each keymap, so this stays in sync without a second list
local clue = require("mini.clue")
clue.setup({
	triggers = {
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },
		{ mode = "n", keys = "<C-w>" },
		-- marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },
		-- registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },
	},
	clues = {
		clue.gen_clues.builtin_completion(),
		clue.gen_clues.g(),
		clue.gen_clues.marks(),
		clue.gen_clues.registers(),
		clue.gen_clues.windows(),
		clue.gen_clues.z(),
		-- names for the leader prefixes used across the config
		{ mode = "n", keys = "<Leader>b", desc = "+buffer" },
		{ mode = "n", keys = "<Leader>f", desc = "+find" },
		{ mode = "n", keys = "<Leader>i", desc = "+imports (ts)" },
		{ mode = "n", keys = "<Leader>q", desc = "+quickfix" },
		{ mode = "n", keys = "<Leader>s", desc = "+git signs" },
		{ mode = "n", keys = "<Leader>t", desc = "+tab" },
		{ mode = "n", keys = "<Leader>S", desc = "+session" },
	},
	window = { delay = 300 },
})
