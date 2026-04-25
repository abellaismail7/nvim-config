local function run_tsc()
	local cwd = vim.fn.getcwd()

	vim.notify("Running tsc...", vim.log.levels.INFO)

	local output = {}

	vim.fn.jobstart({ "pnpm", "-C", cwd, "tsc", "--noEmit" }, {
		stdout_buffered = true,
		stderr_buffered = true,
		on_stdout = function(_, data)
			if data then
				vim.list_extend(output, data)
			end
		end,
		on_stderr = function(_, data)
			if data then
				vim.list_extend(output, data)
			end
		end,
		on_exit = function(_, exit_code)
			local qflist = {}

			for _, line in ipairs(output) do
				-- tsc format: path/to/file.ts(line,col): error TS1234: message
				local filename, lnum, col, text = line:match("^(.-)%((%d+),(%d+)%)%s*:%s*(.+)$")
				if filename and lnum then
					table.insert(qflist, {
						filename = filename,
						lnum = tonumber(lnum),
						col = tonumber(col),
						text = text,
					})
				end
			end

			vim.schedule(function()
				if #qflist == 0 then
					local level = exit_code == 0 and vim.log.levels.INFO or vim.log.levels.WARN
					vim.notify("tsc: " .. (exit_code == 0 and "no errors" or "finished with errors (nothing parsed)"), level)
					return
				end

				vim.fn.setqflist({}, "r", { title = "tsc", items = qflist })
				vim.cmd("copen")
				vim.notify(string.format("tsc: %d error(s)", #qflist), vim.log.levels.WARN)
			end)
		end,
	})
end

vim.api.nvim_create_user_command("Tsc", run_tsc, {
	desc = "Run tsc --noEmit and populate quickfix list with type errors",
})
