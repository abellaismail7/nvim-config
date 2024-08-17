return {
	defaults = {
		selection_caret = ' ',
		prompt_prefix = '  ',
		layout_strategy = 'horizontal',
		layout_config = {
			prompt_position = 'top',
		},
	},
	pickers = {
		-- Your special builtin config goes in here
		buffers = {
			sort_lastused = true,
			theme = 'dropdown',
			previewer = false,
		},
		find_files = {
			theme = 'dropdown',
		},
	},
}
