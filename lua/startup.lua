-- disable diagnostics in env
local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = ".env",
	group = group,
	callback = function(ev)
		vim.diagnostic.enable(false, {
			bufnr = ev.buf,
		})
	end,
})
