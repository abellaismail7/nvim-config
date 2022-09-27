vim.cmd('cd %:p:h')
require "unplug"
require "plug"

vim.wo.numberwidth = 2
vim.wo.relativenumber = true

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.termguicolors = true
vim.o.timeoutlen = 1000
vim.o.wildmenu = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.breakindent = true
vim.opt.undofile = true
vim.wo.signcolumn = 'number'

vim.api.nvim_set_option("backspace", "indent,eol,start")
vim.api.nvim_set_option("arabicshape", true)
vim.api.nvim_set_option("encoding", "UTF-8")
vim.api.nvim_set_option("splitright", true)
vim.api.nvim_set_option("splitbelow", true)
vim.api.nvim_set_option("hidden", true)
vim.api.nvim_set_option("wildoptions", "pum")
vim.api.nvim_set_option("pumblend", 5)
vim.api.nvim_set_option("laststatus", 3)
vim.api.nvim_set_option("wildmode", "longest:full,full")

-- indent
vim.api.nvim_set_option("autoindent",true)
vim.api.nvim_set_option("smartindent",true)
vim.api.nvim_set_option("expandtab", false)

vim.cmd("set fillchars=eob:\\ ")
vim.cmd('let mapleader = " "')
vim.cmd("colo nord")
vim.cmd("syntax on")
vim.cmd("set listchars +=eol:↴")
vim.g.termdebug_disasm_window = 10
vim.g.termdebug_wide = 1

require"keymaps"
require"auto_cmd"
