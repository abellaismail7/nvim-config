local current = vim.fn.expand("%:p:h")

if vim.fn.isdirectory(current) then
	vim.fn.chdir(current)
end

