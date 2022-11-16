local api = vim.api
local autocmd = api.nvim_create_autocmd

autocmd("BufEnter", {
	pattern = {"*.h", "*.hpp"},
	callback = function ()
		if (api.nvim_buf_line_count(0) == 1
			and api.nvim_buf_get_lines(0, 0, 1, 0)[1] == "")
			then
    		local yn = vim.fn.input('y/[N]: ', '')
			if yn ~= 'y' then
				return;
			end
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

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
