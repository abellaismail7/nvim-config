local M = {}

function M.get_last_import_position()
	-- Try treesitter first
	local has_ts, ts_utils = pcall(require, "nvim-treesitter.utils")
	if has_ts then
		local parser = vim.treesitter.get_parser(0)
		if parser then
			local tree = parser:parse()[1]
			local root = tree:root()

			local query_string = [[
        (import_statement) @import
        (import_declaration) @import
        (use_declaration) @import
      ]]

			local ok, query = pcall(vim.treesitter.query.parse, vim.bo.filetype, query_string)
			if ok then
				local last_import_line = 0

				for _, node in query:iter_captures(root, 0) do
					local start_row = node:start()
					if start_row > last_import_line then
						last_import_line = start_row
					end
				end

				return last_import_line + 1
			end
		end
	end

	-- Fallback to pattern matching
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local last_import_line = 0

	local import_patterns = {
		"^%s*import%s", -- JS/TS/Python
		"^%s*from%s+.+import", -- Python from imports
		"^%s*use%s+", -- Rust
		"^%s*#include%s*<", -- C/C++
		"^%s*#import%s*<", -- Objective-C
	}

	for i, line in ipairs(lines) do
		for _, pattern in ipairs(import_patterns) do
			if line:match(pattern) then
				last_import_line = i
			end
		end
	end

	return last_import_line
end

function M.add_import_after_last()
	local pos = M.get_last_import_position()
	vim.api.nvim_win_set_cursor(0, { pos + 1, 0 })
	vim.cmd("normal! o")
	vim.cmd("startinsert")
end

return M
