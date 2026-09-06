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

-- misc: setup_auto_root replaces the chdir in startup.lua, zoom replaces <C-w>|
require("mini.misc").setup()
MiniMisc.setup_auto_root()

require("mini.tabline").setup({
	tabpage_section = "right",
})

require("mini.pairs").setup({})
