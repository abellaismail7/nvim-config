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

	return {
		'#include "' .. name .. '.hpp"',
		'',
		name ..'::'.. name ..'()',
		'{',
		'	std::cout << "'.. name ..' constructor called" << std::endl;',
		'}',
		'',
		name ..'::'.. name ..'(const '.. name ..' &animal)',
		'{',
		'	std::cout << "'.. name ..' copy constructor called" << std::endl;',
		'}',
		'',
		name ..' &'.. name ..'::operator=(const '.. name ..' &animal)',
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
