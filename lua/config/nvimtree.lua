-- Mappings for nvimtree
-- :au! BufEnter if &buftype == 'NvimTree' | setloca endif

require'nvim-tree'.setup {
    view = {
        width = 25,
        side = 'left',
		hide_root_folder = true,
    },
    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache", "__pycache__" }
    },
	renderer = {
		highlight_git = false,
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
		},
		icons = {
			show = {
    	    	file = true,
    	    	folder = true,
    	    	folder_arrow = true,
    	    	git = false,
    	  	},
			glyphs = {
    			default = "",
    			symlink = "",
    			folder = {
    			    default = "",
    			    open = "",
    			    symlink = "",
    			    empty = "",
    			    empty_open = "",
    			    symlink_open = ""
    			}

			}
		},
	},
}

require("keymaps").nvim_tree()
