local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local empty = {}
local opt = {silent = true}

------------
---windows
------------

-- create
map("n", "<leader>wv", 		[[<C-w>v]],		empty)
map("n", "<leader>ws", 		[[<C-w>s]],		empty)

-- resize
map("n", "<C-M-h>", 	[[<C-w><]], 	empty)
map("n", "<C-M-j>", 	[[<C-w>+]], 	empty)
map("n", "<C-M-k>", 	[[<C-w>-]], 	empty)
map("n", "<C-M-l>", 	[[<C-w>>]], 	empty)
map("n", "<leader>w=",  [[<C-w>=]],     empty)

-- maximizer
map("n", "<leader>wm", [[:MaximizerToggle! <CR>]],{noremap = true})

-- navigation
map("n", "<leader>wh", 		[[<C-w>h]],		empty)
map("n", "<leader>wj", 		[[<C-w>j]],		empty)
map("n", "<leader>wk", 		[[<C-w>k]],		empty)
map("n", "<leader>wl", 		[[<C-w>l]],		empty)

-- close
map("n", "<leader>wc", 		[[<C-w>c]],		empty)

--------------
--- Run
--------------

-- Android
map("n", "<leader>ra", [[ :lua require('run.android').run()<CR> ]],empty)

-----------
--- Open
-----------

-- Terminal
map("n", "<leader>ot", [[:belowright 10split | terminal <CR>]],{noremap = true})


-------------
--- buffers
-------------
map("n", "<leader>bc", [[<Cmd>bd | bp<CR>]], opt) -- close buffer
map("n", "<leader>bs", [[:w]], opt) -- save buffer

-- BufferLine
map("n", "<leader>.", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<leader>,", [[<Cmd>BufferLineCyclePrev<CR>]], opt)



-------------
-- telescope
-------------

-- basics
map("n", "<leader>ff",  	[[:lua require('telescope.builtin').find_files()<CR>]], {noremap = true})
map("n", "<leader>fs",  	[[:lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], {noremap = true})
map("n", "<leader>fw",  	[[:lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]], {noremap = true})
map("n", "<leader>fb",  	[[:lua require('telescope.builtin').buffers()<CR>]], {noremap = true})
map("n", "<leader>fh",  	[[:lua require('telescope.builtin').help_tags()<CR>]], {noremap = true})

-- android
map("n", "<Leader>fa",      [[:lua require('telescope.builtin').find_files({cwd="app/src/main",path_display={'tail'}})<CR>]], opt)

-- git
map("n", "<leader>fg",  	[[:lua require('telescope.builtin').git_files()<CR>]], {noremap = true})

----------------------------
--- what the hell is that
---------------------------

-- registers
map("v", "p", 	[["_dP]],		{noremap = true})

map("n", "<leader>y", 	[["+y]], 		{noremap = true})
map("v", "<leader>y", 	[["+y]], 		{noremap = true})
map("n", "<leader>Y", 	[["+Y]], 		{noremap = true})

map("n", "<leader>i", 	[[p<C-a>Y]], 	{noremap = true})

map("i", "<expr> <Tab>  ",  [[pumvisible() ? "\<C-n>" : "\<Tab>"]],		{noremap = true})
map("i", "<expr> <S-Tab>",  [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],	{noremap = true})

