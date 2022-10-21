require("toggleterm").setup({
	open_mapping = [[<C-k>]],
	insert_mappings = false,
	shade_terminals = false,
	direction = "float",
	float_opts = {
		border = 'single',
		winblend = 3,
	},
	winbar = {
    	enabled = false,
    	name_formatter = function(term) --  term: Terminal
    		return '  Terminal[' .. term.name .. ']'
    	end
  	},
})
