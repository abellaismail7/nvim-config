local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}
-- our picker function: wtpicker
function M.wtpicker(opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "Worktree",
		finder = finders.new_table {
			results = { "List", "Create", "Remove" }
		},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				opts.onSelect(selection[1])
				-- print(vim.inspect(selection))
			end)
			return true
		end,
	}):find()
end

function M.wtCreate()
	local branch = vim.fn.input('[wt] Path > ', 'work/')
	if branch == '' then
		return
	end
	local from = vim.fn.input '[wt] From > '
	if from == '' then
		return
	end
	local upstream = vim.fn.input '[wt] upstream(default: origin) > ';
	if upstream == '' then
		upstream = 'origin'
	end
	require("git-worktree").create_worktree(branch, from, upstream)
end

function M.wtSwitch()
	local branch = vim.fn.input('[wt] Path > ', 'work/', 'path')
	if branch == '' then
		return
	end
	require("git-worktree").switch_worktree(branch)
end

function M.wtRemove()
	local branch = vim.fn.input('[wt] Path > ', 'work/', 'path')
	if branch == '' then
		return
	end
	require("git-worktree").delete_worktree(branch)
end

-- to execute the function
return M
