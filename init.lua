vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
require "unplug"
require "plug"

vim.wo.numberwidth = 2
vim.wo.relativenumber = true
vim.o.number = true
vim.wo.signcolumn = 'number'

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.breakindent = true

vim.g.ft_theme = "onedark"
vim.o.termguicolors = true
vim.o.wildmenu = true
vim.opt.undofile = true

vim.opt.shortmess = "" -- vim.o.shortmess .. "c"
vim.opt.laststatus = 3
vim.opt.cmdheight = 0

vim.opt.backspace = "indent,eol,start"
vim.opt.arabicshape = true
vim.opt.encoding = "UTF-8"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.wildmode = "longest:full,full"
vim.opt.mouse = ""

vim.opt.timeoutlen = 1000
vim.opt.updatetime = 250

vim.opt.fillchars = { eob = " " }
vim.opt.encoding = "utf-8"


vim.o.showbreak = "";

 local signs = {
   Error = " ",
   Warn = " ",
   Hint = " ",
   Info = " ",
}

for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- indent
vim.api.nvim_set_option("autoindent",true)
vim.api.nvim_set_option("smartindent",true)
vim.api.nvim_set_option("expandtab", false)

vim.cmd('let mapleader = " "')

local th = require("theme")
th.change_theme(vim.g.ft_theme);

require"keymaps"
require"auto_cmd"
require"commands"
