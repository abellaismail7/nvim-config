-- [[ Setting options ]]
-- See `:help vim.o`
-- disable non-used providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 2
vim.wo.signcolumn = 'number'

-- Enable mouse mode
vim.o.mouse = ''

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- status line type
vim.opt.laststatus = 3

-- split
vim.opt.splitkeep = 'screen'
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.VM_theme = 'nord'
vim.g.VM_leader = '\\'

-- spell
vim.opt.spelllang = 'en_us,fr'
vim.opt.spell = true

-- disable folding
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob:~,fold: ,foldopen:,foldsep: ,foldclose:]]
--vim.opt.foldenable = false

local signs = {
	Error = ' ',
	Warn = ' ',
	Hint = ' ',
	Info = ' ',
}

for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
