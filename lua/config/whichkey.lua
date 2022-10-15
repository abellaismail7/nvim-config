require("which-key").setup {
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "  ", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},

    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {0, 0, -1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 1, 0, 0} -- extra window padding [top, right, bottom, left]
    },

    triggers = "auto",
}
