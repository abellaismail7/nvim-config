local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python",
        "rust",
        "go"
    },
    highlight = {
		disable = function (_, bufnr)
			local filename = vim.api.nvim_buf_get_name(bufnr)
			if filename == nil or filename == '' then
				return vim.api.nvim_buf_line_count(bufnr) > 10000;
			else
				return (vim.fn.getfsize(filename) > 1000000)
			end
		end,
        enable = true,
    },
	autotag = {
    	enable = true,
  	},
}
