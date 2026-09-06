-- the forms of the current file's path offered by the picker
-- (`:.` is project relative, MiniMisc.setup_auto_root keeps cwd at the root)
local path_forms = {
	{ label = "name", modifier = ":t" },
	{ label = "project", modifier = ":." },
	{ label = "absolute", modifier = ":p" },
	{ label = "home", modifier = ":~" },
}

-- pick one form of the current file's path and copy it to the clipboard
return function()
	local file = vim.fn.expand("%:p")
	if file == "" then
		vim.notify("No file to copy a path from", vim.log.levels.WARN)
		return
	end

	local items = {}
	for _, form in ipairs(path_forms) do
		table.insert(items, { label = form.label, path = vim.fn.fnamemodify(file, form.modifier) })
	end

	vim.ui.select(items, {
		prompt = "Copy path",
		format_item = function(item)
			return ("%-9s %s"):format(item.label, item.path)
		end,
	}, function(item)
		if item == nil then
			return
		end
		vim.fn.setreg("+", item.path)
		vim.notify("Copied to clipboard: " .. item.path, vim.log.levels.INFO)
	end)
end
