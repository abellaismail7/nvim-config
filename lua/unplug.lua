vim.cmd('let g:loaded_python_provider = 0')
vim.cmd('let g:loaded_ruby_provider = 0')
vim.cmd('let g:loaded_perl_provider = 0')
vim.cmd('let g:loaded_node_provider = 0')
vim.cmd('let g:python3_host_prog = expand("/bin/python")')

local g = vim.g
-- disable some builtin vim plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
