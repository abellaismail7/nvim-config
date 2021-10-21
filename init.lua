vim.cmd('cd %:p:h')
require "unplug"
require "plug"


vim.wo.numberwidth = 2
vim.wo.number = true
vim.wo.cul = true

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.wildmode = "longest,list,full"
vim.o.termguicolors = true
vim.o.timeoutlen = 1000
vim.o.wildmenu = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.api.nvim_set_option("backspace","indent,eol,start")
vim.api.nvim_set_option("arabicshape",true)
vim.api.nvim_set_option("encoding","UTF-8")
vim.api.nvim_set_option("splitright",true)
vim.api.nvim_set_option("hidden",true)

-- indent
vim.api.nvim_set_option("autoindent",true)
vim.api.nvim_set_option("smartindent",true)
vim.api.nvim_set_option("expandtab", false)

vim.cmd("au VimEnter * if isdirectory(expand('%')) | Dashboard  | endif ")
vim.cmd("set fillchars=eob:\\ ")
vim.cmd('let mapleader = " "')
vim.cmd("colo dracula")
vim.cmd("syntax on")
vim.cmd("set listchars +=eol:↴")


require"highlights"
require"mappings"
