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
---windows
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
map("n", "<leader>wh", 		[[<C-w>h]])
map("n", "<leader>wj", 		[[<C-w>j]])
map("n", "<leader>wk", 		[[<C-w>k]])
map("n", "<leader>wl", 		[[<C-w>l]])

-- close
map("n", "<leader>wc", 		[[<C-w>c]])

--------------
--- Run
--------------

-- Android
map("n", "<leader>ra", [[ :lua require('run.android').run()<CR> ]])

-----------
--- Open
-----------

-- Terminal
map("n", "<leader>ot", [[:belowright 10split | terminal <CR>]])


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

----------------------------
--- what the hell is that
---------------------------

-- registers
map("v", "p", 	[["_dP]])

map("n", "<leader>y", 	[["+y]])
map("v", "<leader>y", 	[["+y]])
map("n", "<leader>Y", 	[["+Y]])

map("n", "<leader>i", 	[[p<C-a>Y]] )

map("i", "<expr> <Tab>  ",  [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
map("i", "<expr> <S-Tab>",  [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- terminal
map("t","<Esc>", [[ <C-\><C-n>]])

