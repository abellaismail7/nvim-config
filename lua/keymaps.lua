local map = vim.keymap.set
local M = {};
local winp = require("config.win_picker")

map("n", "<leader>w", winp.pick_win , 		{ desc = "Pick a window" });
map("n", "<leader>r", winp.replace_win, 	{ desc = "Replace a window" });
map("n", "<leader>=",  	[[<C-w>=]], {desc = "resize window to be equal"})

-- resize
map("n", "<C-M-Left>", 		[[<C-w><]], {desc = "resize window"})
map("n", "<C-M-Down>", 		[[<C-w>+]], {desc = "resize window"})
map("n", "<C-M-Up>", 		[[<C-w>-]], {desc = "resize window"})
map("n", "<C-M-Right>", 	[[<C-w>>]], {desc = "resize window"})

-- maximizer
map("n", "<leader>m", 		[[<C-w>|]], {desc = "maximize current window"})

-- navigation
map("n", "<C-Left>", 		[[:wincmd h<cr>]], {desc = "goto the left window"})
map("n", "<C-Down>", 		[[:wincmd j<cr>]], {desc = "goto the bottom window"})
map("n", "<C-Up>",			[[:wincmd k<cr>]], {desc = "goto the right window"})
map("n", "<C-Right>", 		[[:wincmd l<cr>]], {desc = "goto the right window"})

-- i navigation
map("i", "<C-h>", 		[[<Left>]], 	{desc = "goto the left window"})
map("i", "<C-j>", 		[[<Down>]], 	{desc = "goto the bottom window"})
map("i", "<C-k>",		[[<Up>]], 		{desc = "goto the right window"})
map("i", "<C-l>", 		[[<Right>]],	{desc = "goto the right window"})

map("v", "<M-j>", 		"dp1V", 		{desc = "switch current with next"})
map("v", "<M-k>",		"dkP1v", 		{desc = "switch current with prev"})

-- buf navigation
map("n", "<M-Down>",	[[gt]],							{desc = "goto prev tab"})
map("n", "<M-Up>",		[[gT]], 						{desc = "goto next tab"})
map("n", "<M-Left>",	[[<cmd>TablineBufferPrev<cr>]],	{desc = "goto next buffer"})
map("n", "<M-Right>",	[[<cmd>TablineBufferNext<cr>]],	{desc = "goto prev buffer"})
map("n", "<M-t>",		[[<cmd>TablineTabNew<cr>]],		{desc = "create new tab"})
map("n", "<M-r>",		[[:TablineTabRename ]],			{desc = "rename current tab"})

-- switch split
map("n", "<C-S-Left>"	, 		[[:wincmd H<cr>]], {desc = "switch current window with left one"})
map("n", "<C-S-Down>"	, 		[[:wincmd J<cr>]], {desc = "switch current window with bottom one"})
map("n", "<C-S-Up>"	, 			[[:wincmd K<cr>]], {desc = "switch current window with top one"})
map("n", "<C-S-Right>", 		[[:wincmd L<cr>]], {desc = "switch current window with right one"})

-- utils
map("n", "<C-c>", "<cmd> %y+ <CR>", {desc = "copy whole file"})

-- prime twitter tips
map("n", "n", 		"nzz", 		{desc = "next in the middle"})
map("n", "<C-d>", 	"<C-d>zz", 	{desc = "next in the middle"})
map("n", "<C-u>", 	"<C-u>zz", 	{desc = "next in the middle"})

-- nvim-tree
function M:nvim_tree()
	map("n", "<leader>n", ":NvimTreeToggle<CR>",	{desc = "open nvim tree"})
	map("n", "<leader>e", ":NvimTreeFocus<CR>",		{desc = "focus nvim tree"})
end

-- LSP
function M:lsp()
	map("n", "K",	vim.lsp.buf.hover			, { desc = "lsp hover"})
	map("n", "gd",	vim.lsp.buf.definition		, { desc = "lsp definition"}) -- CTRL-t jump back
	map("n", "gD",	vim.lsp.buf.declaration		, { desc = "lsp declaration"}) -- CTRL-t jump back
	map("n", "gt",	vim.lsp.buf.type_definition	, { desc = "lsp type definition"})
	map("n", "gi",	vim.lsp.buf.implementation	, { desc = "lsp implementation"})
	map("n", "gr", 	vim.lsp.buf.references		, { desc = "lsp references"})
	
	map("n", "<leader>le",	vim.diagnostic.open_float			, { desc = "lsp floating diagnostic"})
	map("n", "<leader>ln",	vim.diagnostic.goto_next			, { desc = "lsp next diagnostic"})
	map("n", "<leader>lp",	vim.diagnostic.goto_prev			, { desc = "lsp prev diagnostic"})
	map("n", "<leader>lr", 	vim.lsp.buf.rename					, { desc = "lsp rename"})
	map("n", "<leader>lf",	vim.lsp.buf.formatting_sync			, { desc = "lsp format"})
	map("n", "<leader>lwa",	vim.lsp.buf.add_workspace_folder 	, { desc = "lsp format"})
	map("n", "<leader>lwr",	vim.lsp.buf.remove_workspace_folder	, { desc = "lsp format"})
	map("n", "<leader>lwl",	vim.lsp.buf.list_workspace_folders	, { desc = "lsp format"})
	map("n", ",a",			vim.lsp.buf.code_action				, { desc = "lsp code actions"})
end

-- Android
map("n", "<leader>a", require('run.android').run)

-- Make c
map("n", "<leader>mm", 	[[ :make ]])
map("n", "<leader>mc", [[ :make clean ]])
map("n", "<leader>ma", [[ :make fclean ]])
map("n", "<leader>mr", [[ :make fclean all ]])

-- Norm
map("n", "<leader>mn", [[ :! norminette % ]])

-- Terminal
--map("n", "<C-k>", require('ft_terminal').open, {desc = "toggle terminal"})

-- buffers
map("n", "<leader>bc", [[<Cmd>bp|bd #<CR>]], {desc = "close current buffer"}) -- close buffer
map("n", "<leader>bs", [[:w]], {desc = "save current buffer"}) -- save buffer

-- telescope
function M:telescope()
	map({"n", "i"}, "<M-f>",	require('telescope.builtin').find_files, {desc = "list files with telescope"})
	map("n", "<leader>fb", 		require('telescope.builtin').buffers,	{desc = "list buffers"})
	map("n", "<leader>fh", 		require('telescope.builtin').help_tags,	{desc = "list help tags"})
	map("n", "<leader>fm", 		require('telescope.builtin').marks,		{desc = "list marks"})
	map("n", "<leader>fg",		require('telescope.builtin').git_files,	{desc = "list git files"})
	map({"n", "i"}, "<M-h>",	":Thm<CR>", {desc = "list themes with telescope"})
	map("n", "<leader>fs", function ()
		require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
	end, {desc = "grep for words"})
	map("n", "<leader>fw", function ()
		require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
	end, {desc = "grep for function"})
	map("n", "<Leader>fa", function ()
		require('telescope.builtin').find_files({cwd="app/src/main",path_display={'tail'}})
	end)
end

-- Other
map('x', "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"')
map('x', "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"')

map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- registers
map("v", "p", 	[["_dP]])

map("n", "<leader>y", 	[["+y]])
map("v", "<leader>y", 	[["+y]])
map("n", "<leader>Y", 	[["+Y]])

-- map("", "<Up>", "<Nop>")
-- map("", "<Down>", "<Nop>")
-- map("", "<Right>", "<Nop>")
-- map("", "<Left>", "<Nop>")

map("n", "<leader>i", 	[[p<C-a>Y]])

-- terminal
map("t","<esc>", [[ <C-\><C-n>]])

---- COMMANDS
vim.cmd("command -complete=lua -nargs=+ Inspect :lua print(vim.inspect(<args>))")
vim.cmd("command -nargs=* Gcc :lua require'run.gcc'.run('') ")
vim.cmd("command -nargs=* GccWall :lua require'run.gcc'.run('-Wall -Werror -Wextra') ")

return M
