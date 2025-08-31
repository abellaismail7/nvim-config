local source = {}

local path = "apps/v4/content/docs/components"
local repoUrl = "https://github.com/shadcn-ui/ui.git"
local cache_dir = vim.fn.stdpath("cache")
local shad_dir = vim.fn.stdpath("cache") .. "/shadcn-ui"
local component_cache_file = cache_dir .. "/shad-components.json"
local components = nil

local function extract_code(content)
	-- Find Usage section and extract first code block
	local st, nd = content:match([[## Usage%s*```[%w ]+(.*)```%s*```[%w ]+(.*)```]])
	return st, nd -- Find the second code block after the first one
end

local function check_cache()
	if components then
		return true
	end
	if vim.loop.fs_stat(component_cache_file) then
		components = vim.fn.json_decode(vim.fn.readfile(component_cache_file))
		return true
	end

	vim.api.nvim_echo({
		{ "Shadcn-ui components cache not found. Run :ShadInit to cache components.", "WarningMsg" },
	}, true, {})
	return false
end

local function clone_shadn()
	if not vim.loop.fs_stat(shad_dir) then
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=main", repoUrl, shad_dir })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone shadcn-ui:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end
end

local function cache_components()
	clone_shadn()
	local data = {}
	local files = vim.fn.globpath(shad_dir .. "/" .. path, "*.mdx", false, true)
	if #files == 0 then
		vim.api.nvim_echo({
			{ "No shadcn-ui components found in " .. shad_dir .. "/" .. path, "WarningMsg" },
		}, true, {})
		return data
	end

	for _, file in ipairs(files) do
		local name = vim.fn.fnamemodify(file, ":t:r")
		local content = table.concat(vim.fn.readfile(file), "\n")
		local imports, code = extract_code(content)
		if imports and code then
			data[name] = {
				imports = imports,
				code = code,
			}
		else
			vim.api.nvim_echo({
				{ "No usage code blocks found for " .. name, "WarningMsg" },
			}, true, {})
		end
	end

	local json = vim.fn.json_encode(data)
	local file = io.open(component_cache_file, "w")
	if file then
		file:write(json)
		file:close()
	else
		vim.api.nvim_echo({
			{ "Failed to write shadcn-ui components cache to " .. component_cache_file, "ErrorMsg" },
		}, true, {})
	end
	return data
end

-- register as a command
--cache_components()
vim.api.nvim_create_user_command("ShadInit", function()
	components = cache_components()
end, { desc = "Cache shadcn-ui components" })

-- function source:init()
--
-- end

---Return whether this source is available in the current context or not (optional).
---@return boolean
function source:is_available()
	local filetype = vim.bo.filetype
	return filetype == "typescriptreact" or filetype == "javascriptreact"
end

---Return the debug name of this source (optional).
---@return string
function source:get_debug_name()
	return "shadcn.nvim"
end

---Return LSP's PositionEncodingKind.
---@NOTE: If this method is omitted, the default value will be `utf-16`.
---@return lsp.PositionEncodingKind
function source:get_position_encoding_kind()
	return "utf-16"
end

---Return the keyword pattern for triggering completion (optional).
---If this is omitted, nvim-cmp will use a default keyword pattern. See |cmp-config.completion.keyword_pattern|.
---@return string
function source:get_keyword_pattern()
	return [[\k\+]]
end

---Invoke completion (required).
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
	local items = {}
	if not check_cache() then
		return callback(nil)
	end

	-- get last import position using lsp:
	local last_import_line = require("config.cmp.utils.add-import").get_last_import_position()

	---@diagnostic disable-next-line: param-type-mismatch
	for name, component in pairs(components) do
		local item = {
			label = name,
			insertText = component.code,
			kind = vim.lsp.protocol.CompletionItemKind.Module,
			detail = "Shadcn-ui Component",
			additionalTextEdits = {
				{
					range = {
						start = {
							line = last_import_line,
							character = 0,
						},
						["end"] = {
							line = last_import_line,
							character = 0,
						},
					},
					newText = component.imports,
				},
			},
			documentation = {
				kind = "markdown",
				value = "```tsx\n" .. component.imports .. "\n```\n\n" .. component.code,
			},
			data = {
				name = name,
				imports = component.imports,
				code = component.code,
			},
		}
		table.insert(items, item)
	end

	callback(items)
end

---Resolve completion item (optional). This is called right before the completion is about to be displayed.
---Useful for setting the text shown in the documentation window (`completion_item.documentation`).
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:resolve(completion_item, callback)
	callback(completion_item)
end

---Executed after the item was selected.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
	if check_cache() then
		return callback(nil)
	end
	local chosen_component = components[completion_item.label]
	if not chosen_component then
		vim.api.nvim_echo({
			{ "Component " .. completion_item.label .. " not found in cache.", "ErrorMsg" },
		}, true, {})
		return callback(nil)
	end
	local imports = chosen_component.imports
	local code = chosen_component.code
	callback(completion_item)
end

---Register your source to nvim-cmp.
require("cmp").register_source("nvim_shad", source)

return source
