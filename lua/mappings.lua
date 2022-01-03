local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--local empty = {}
--local opt = {silent = true}

------------
--- Windows
------------

-- create
map("n", "<leader>wv", 		[[<C-w>v]])
map("n", "<leader>ws", 		[[<C-w>s]])

-- resize
map("n", "<C-M-h>", 	[[<C-w><]])
map("n", "<C-M-j>", 	[[<C-w>+]])
map("n", "<C-M-k>", 	[[<C-w>-]])
map("n", "<C-M-l>", 	[[<C-w>>]])
map("n", "<leader>w=",  [[<C-w>=]])

-- maximizer
map("n", "<leader>wm", [[:MaximizerToggle! <CR>]])

-- navigation
map("n", "<leader>wh", 		[[:wincmd h<cr>]])
map("n", "<leader>wj", 		[[:wincmd j<cr>]])
map("n", "<leader>wk", 		[[:wincmd k<cr>]])
map("n", "<leader>wl", 		[[:wincmd l<cr>]])

-- close
map("n", "<leader>wc", 		[[<C-w>c]])

-- switch split
map("n", "<leader>wH", 		[[:wincmd H<cr>]])
map("n", "<leader>wJ", 		[[:wincmd J<cr>]])
map("n", "<leader>wK", 		[[:wincmd K<cr>]])
map("n", "<leader>wL", 		[[:wincmd L<cr>]])

--------------
--- LSP ./config/nvim-lspconfig.lua
--- hint : gf to navigate to file under cursor
--------------

--------------
--- Run
--------------

-- Android
map("n", "<leader>ra", [[ :lua require('run.android').run()<CR> ]])

-- Make c
map("n", "<leader>rmm", [[ :make ]])
map("n", "<leader>rmc", [[ :make clean ]])
map("n", "<leader>rma", [[ :make fclean ]])
map("n", "<leader>rmr", [[ :make fclean all ]])

-- Norm
map("n", "<leader>rn", [[ :! norminette % ]])

--------------
--- Debug
--------------

map("n", "<leader>dr", [[ :lua require'run.debug'.run()<cr> ]])
map("n", "<leader>d=", [[ :lua require'run.debug'.resize()<cr> ]])
map("n", "<leader>dg", [[ :Gdb<cr> ]])
map("n", "<leader>dp", [[ :Program<cr> ]])
map("n", "<leader>ds", [[ :Source<cr> ]])
map("n", "<leader>da", [[ :Asm<cr> ]])
map("n", "<leader>db", [[ :Break<cr> ]])
map("n", "<leader>dl", [[ :Clear<cr> ]])
map("n", ",c", [[ :Continue<cr> ]])
map("n", ",n", [[ :Over<cr> ]])
map("n", ",s", [[ :Step<cr> ]])

-----------
--- Open
-----------

-- Terminal
map("n", "<leader>ot", [[:lua require('ft_terminal').open()<cr>]])

-------------
--- buffers
-------------
map("n", "<leader>bc", [[<Cmd>bd | bp<CR>]]) -- close buffer
map("n", "<leader>bs", [[:w]]) -- save buffer

-- BufferLine
map("n", "<leader>.", [[<Cmd>BufferLineCycleNext<CR>]])
map("n", "<leader>,", [[<Cmd>BufferLineCyclePrev<CR>]])

-------------
-- telescope
-------------

-- basics
map("n", "<leader>ff",  	[[:lua require('telescope.builtin').find_files()<CR>]])
map("n", "<leader>fs",  	[[:lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]])
map("n", "<leader>fw",  	[[:lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]])
map("n", "<leader>fb",  	[[:lua require('telescope.builtin').buffers()<CR>]])
map("n", "<leader>fh",  	[[:lua require('telescope.builtin').help_tags()<CR>]])
map("n", "<leader>fm",  	[[:lua require('telescope.builtin').marks()<CR>]])
map("n", "<Leader>fn",      [[<Cmd>lua require('telescope.builtin').file_browser()<CR>]])

-- android
map("n", "<Leader>fa",      [[:lua require('telescope.builtin').find_files({cwd="app/src/main",path_display={'tail'}})<CR>]])

-- git
map("n", "<leader>fg",  	[[:lua require('telescope.builtin').git_files()<CR>]])

--- ------------------------
--- Other
--- ------------------------

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

