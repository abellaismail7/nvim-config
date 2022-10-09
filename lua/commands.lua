local api = vim.api;

local function is_file(filename)
	local res = vim.fn.glob(filename)
	if res == "" then
		return false
	end
	if vim.fn.isdirectory(filename) ~= 0 then
		return false
	end
	return true
end

local function cpp_template(name)
	local var = name:lower();

	return {
		'#include "' .. name .. '.hpp"',
		'',
		name ..'::'.. name ..'()',
		'{',
		'	std::cout << "'.. name ..' constructor called" << std::endl;',
		'}',
		'',
		name ..'::'.. name ..'(const '.. name ..' &'..var..')',
		'{',
		'	std::cout << "'.. name ..' copy constructor called" << std::endl;',
		'}',
		'',
		name ..' &'.. name ..'::operator=(const '.. name ..' &'..var..')',
		'{',
		'	std::cout << "'.. name ..' assigned called" << std::endl;',
		'	return *this;',
		'}',
		'',
		name ..'::~'.. name ..'()',
		'{',
		'	std::cout << "'.. name ..' destructor called" << std::endl;',
		'}',

	}
end

local function header_template(name)
	local filename = name:upper():gsub("%.", "_") .. "_HPP"

	return {
		"#ifndef "  .. filename,
        "# define " .. filename,
		"#include <iostream>" ,
		"class " .. name,
		"{",
		"public:",
		"	" ..  name .. "();",
		"	" ..  name .. "(" .. name .. "&);",
		"	" ..  name .. "(const ".. name .." &);",
		"	" ..  name .. "&operator=(const ".. name .."&);",
		"	~" .. name .. "();",
		" ",
		"protected:",
		"private:",
		"",
		"};",
		"#endif",
}
end

function CreateCppClass()
    local dir = vim.fn.input('create in: ', vim.fn.getcwd() .. '/', 'file')

	if not dir or is_file(dir) then
		print(dir .. " is not a dircetory")
		return;
	end

    local file = vim.fn.input('class name: ' .. dir .. '/', '' , 'file')

	local full = dir ..'/' .. file;

	if is_file(full .. '.hpp') or is_file(full .. '.cpp') then
		print("file ".. file .. " already exist")
		return;
	end

	vim.cmd("e " .. dir .. '/' .. file .. ".cpp")
	api.nvim_buf_set_lines(0, 0,1,0, cpp_template(file));

	vim.cmd("e " .. dir .. '/' .. file .. ".hpp")
	api.nvim_buf_set_lines(0, 0,1,0, header_template(file));
end

api.nvim_create_user_command("CppClass", function (_, _, _)
	CreateCppClass()
end, {bang = true, desc = 'Create an ortodox canonical class'})

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- push hl_dir file names to table
local th_files = vim.fn.stdpath "config" .. "/lua/themes"
local theme_tb = {}

for _, file in ipairs(vim.fn.readdir(th_files)) do
	if vim.fn.isdirectory(file) == 0
	then
		local s = string.gsub(file, ".lua", "")
		table.insert(theme_tb, s)
	end
end


local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = theme_tb
    },
    sorter = conf.generic_sorter(opts),
	attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
		
		require"theme".change_theme(selection[1])
		
      end)
      return true
    end,
  }):find()
end

api.nvim_create_user_command("Thm", function (_, _, _)
	colors()
end, {bang = true, desc = 'Create an ortodox canonical class'})



