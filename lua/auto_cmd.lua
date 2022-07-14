
local api = vim.api

api.nvim_create_autocmd("BufEnter", {
	pattern = "*.h",
	callback = function ()
		if (api.nvim_buf_line_count(0) == 1
			and api.nvim_buf_get_lines(0, 0, 1, 0)[1] == "")
			then
			print("yasaa");
			local filename = vim.fn.expand("%:t"):upper():gsub("%.", "_")
			api.nvim_buf_set_lines(0, 0,1,0, {
				"#ifndef " .. filename,
         		"# define " .. filename,
         		"",
         		"#endif"
			})
		end
	end
})

