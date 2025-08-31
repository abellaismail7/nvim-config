-- Function to convert tab-separated string to JSON array of objects
-- First line contains the keys, subsequent lines contain the data
local function tsv_to_json(tsv_string)
	-- Split the string into lines
	local lines = vim.split(tsv_string, "\n", { plain = true })

	-- Remove empty lines
	local filtered_lines = {}
	for _, line in ipairs(lines) do
		if line and line:match("%S") then -- Check if line has non-whitespace content
			table.insert(filtered_lines, line)
		end
	end

	if #filtered_lines < 1 then
		return {}
	end

	-- First line contains the keys
	local keys = vim.split(filtered_lines[1], "\t", { plain = true })

	-- Process data lines
	local result = {}
	for i = 2, #filtered_lines do
		local values = vim.split(filtered_lines[i], "\t", { plain = true })
		local obj = {}

		-- Create object with keys and values
		for j = 1, #keys do
			local key = keys[j]:gsub("^%s*(.-)%s*$", "%1") -- Trim whitespace from key
			local value = values[j] and values[j]:gsub("^%s*(.-)%s*$", "%1") or "" -- Trim whitespace from value, default to empty string

			-- Try to convert numeric values
			local num = tonumber(value)
			if num then
				obj[key] = num
			elseif value:lower() == "true" then
				obj[key] = true
			elseif value:lower() == "false" then
				obj[key] = false
			elseif value == "" then
				obj[key] = nil
			else
				obj[key] = value
			end
		end

		table.insert(result, obj)
	end

	-- Convert to JSON string
	return vim.fn.json_encode(result)
end

-- Example usage function that works with current buffer or selection
local function convert_tsv_in_buffer()
	local start_line, end_line
	print("Converting TSV to JSON...")

	-- Check if there's a visual selection
	local mode = vim.fn.mode()
	if mode == "v" or mode == "V" or mode == "\22" then -- \22 is Ctrl-V (visual block)
		start_line = vim.fn.line("'<")
		end_line = vim.fn.line("'>")
	else
		-- Use entire buffer
		start_line = 1
		end_line = vim.fn.line("$")
	end

	-- Get the lines
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
	local tsv_string = table.concat(lines, "\n")

	-- Convert to JSON
	local json_result = tsv_to_json(tsv_string)

	-- Pretty print the JSON (optional)
	local formatted_json = vim.fn.json_decode(json_result)
	local pretty_json = vim.fn.json_encode(formatted_json)

	-- Create a new buffer with the result
	vim.cmd("vnew")
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(pretty_json, "\n"))
	vim.bo.filetype = "json"

	print("TSV converted to JSON in new buffer")
end

-- Create user command
vim.api.nvim_create_user_command("TsvToJson", convert_tsv_in_buffer, {
	desc = "Convert tab-separated values to JSON array of objects",
})

-- Return the main function for use in other scripts
return tsv_to_json
