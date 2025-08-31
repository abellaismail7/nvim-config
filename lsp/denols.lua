local function file_exists(path)
	return vim.fn.filereadable(path) == 1
end

return {
	root_dir = function (bufnr, on_dir)
		if file_exists("deno.jsonc") then
			on_dir(vim.fn.getcwd())
		end
	end
}
