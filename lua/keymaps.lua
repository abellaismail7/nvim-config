local map = vim.keymap.set
--local empty = {}
--local opt = {silent = true}

------------
--- Windows
------------

-- create
map("n", "<leader>wv", 		[[<C-w>v]])
map("n", "<leader>ws", 		[[<C-w>s]])

-- resize
map("n", "<C-M-Left>", 	[[<C-w><]])
map("n", "<C-M-Down>", 	[[<C-w>+]])
map("n", "<C-M-Up>", 	[[<C-w>-]])
map("n", "<C-M-Right>", [[<C-w>>]])
map("n", "<leader>w=",  [[<C-w>=]])

-- maximizer
map("n", "<leader>wm", [[<C-w>|]])

-- navigation
map("n", "<C-Left>", 		[[:wincmd h<cr>]])
map("n", "<C-Down>", 		[[:wincmd j<cr>]])
map("n", "<C-Up>",			[[:wincmd k<cr>]])
map("n", "<C-Right>", 		[[:wincmd l<cr>]])

-- buf navigation
map("n", "<M-Left>",	[[<cmd>TablineBufferPrev<cr>]])
map("n", "<M-Down>",	[[gt]])
map("n", "<M-Up>",		[[gT]])
map("n", "<M-Right>",	[[<cmd>TablineBufferNext<cr>]])
map("n", "<M-t>",		[[<cmd>TablineTabNew<cr>]])
map("n", "<M-r>",		[[:TablineTabRename ]])


-- close
map("n", "<leader>wc", 		[[<C-w>c]])

-- switch split
map("n", "<C-S-Left>"	, 		[[:wincmd H<cr>]])
map("n", "<C-S-Down>"	, 		[[:wincmd J<cr>]])
map("n", "<C-S-Up>"	, 			[[:wincmd K<cr>]])
map("n", "<C-S-Right>", 		[[:wincmd L<cr>]])

--------------
--- LSP ./config/nvim-lspconfig.lua
--- hint : gf to navigate to file under cursor
--------------

--------------
--- Run
--------------

-- Android
map("n", "<leader>ra", require('run.android').run)

-- Make c
map("n", "<leader>m", 	[[ :make ]])
map("n", "<leader>rmc", [[ :make clean ]])
map("n", "<leader>rma", [[ :make fclean ]])
map("n", "<leader>rmr", [[ :make fclean all ]])

-- Norm
map("n", "<leader>rn", [[ :! norminette % ]])

-----------
--- Open
-----------

-- Terminal
map("n", "<C-k>", require('ft_terminal').open)

-------------
--- buffers
-------------
map("n", "<leader>bc", [[<Cmd>bp|bd #<CR>]]) -- close buffer
map("n", "<leader>bs", [[:w]]) -- save buffer

-------------
-- telescope
-------------

-- basics
map({"n", "i"}, "<M-f>",	require('telescope.builtin').find_files)
map("n", "<leader>fb", 		require('telescope.builtin').buffers)
map("n", "<leader>fh", 		require('telescope.builtin').help_tags)
map("n", "<leader>fm", 		require('telescope.builtin').marks)
map("n", "<leader>fg",		require('telescope.builtin').git_files)
map("n", "<leader>fs", 		function ()
	require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
map("n", "<leader>fw", 		function ()
	require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)

-- android
map("n", "<Leader>fa", 		function ()
	require('telescope.builtin').find_files({cwd="app/src/main",path_display={'tail'}})
end)

-- git

--- ------------------------
--- Other
--- ------------------------

map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- registers
map("v", "p", 	[["_dP]])

map("n", "<leader>y", 	[["+y]])
map("v", "<leader>y", 	[["+y]])
map("n", "<leader>Y", 	[["+Y]])

map("n", "<leader>i", 	[[p<C-a>Y]] )

-- terminal
map("t","<Esc>", [[ <C-\><C-n>]])

---- COMMANDS
vim.cmd("command -complete=lua -nargs=+ Inspect :lua print(vim.inspect(<args>))")
vim.cmd("command -nargs=* Gcc :lua require'run.gcc'.run('') ")
vim.cmd("command -nargs=* GccWall :lua require'run.gcc'.run('-Wall -Werror -Wextra') ")
