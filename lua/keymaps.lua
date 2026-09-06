local map = vim.keymap.set
-- disable pageup/down
map({ "n", "i", "v" }, "<PageUp>", "<Nop>", { silent = true })
map({ "n", "i", "v" }, "<PageDown>", "<Nop>", { silent = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- map('n', '<leader>w', require('config.win_picker').pick_win, { desc = 'Pick a window' })
-- map('n', '<leader>r', require('config.win_picker').replace_win, { desc = 'Replace a window' })
map("n", "<leader>=", [[<C-w>=]], { desc = "resize window to be equal" })

-- Resize
map("n", "<C-M-Left>", [[<C-w><]], { desc = "resize window" })
map("n", "<C-M-Down>", [[<C-w>+]], { desc = "resize window" })
map("n", "<C-M-Up>", [[<C-w>-]], { desc = "resize window" })
map("n", "<C-M-Right>", [[<C-w>>]], { desc = "resize window" })

-- Maximizer
map("n", "<leader>m", [[<C-w>|]], { desc = "maximize current window" })

map("v", "<C-j>", "dp1V", { desc = "switch current with next" })
map("v", "<C-k>", "dkP1v", { desc = "switch current with prev" })

-- Buffer navigation
map("n", "<leader><Down>", [[gt]], { desc = "goto prev tab" })
map("n", "<leader><Up>", [[gT]], { desc = "goto next tab" })
map("n", "<leader><Left>", [[<cmd>bnext<cr>]], { desc = "goto next buffer" })
map("n", "<leader><Right>", [[<cmd>bprevious<cr>]], { desc = "goto prev buffer" })
map("n", "<leader>tn", [[<cmd>tabnew<cr>]], { desc = "create new tab" })
map("n", "<leader>tr", [[:TablineTabRename ]], { desc = "rename current tab" })

-- switch split
map("n", "<C-S-Left>", [[:wincmd H<cr>]], { desc = "switch current window with left one" })
map("n", "<C-S-Down>", [[:wincmd J<cr>]], { desc = "switch current window with bottom one" })
map("n", "<C-S-Up>", [[:wincmd K<cr>]], { desc = "switch current window with top one" })
map("n", "<C-S-Right>", [[:wincmd L<cr>]], { desc = "switch current window with right one" })

-- utils
map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "copy whole file" })

-- buffers
map("n", "<leader>bc", [[<Cmd>bp|bd #<CR>]], { desc = "close current buffer" }) -- close buffer
map("n", "<leader>bs", [[:w]], { desc = "save current buffer" }) -- save buffer
-- registers
map("v", "p", [["_dP]])

-- format
map("n", "gqf", require("conform").format, { desc = "Format file" })

-- path
map("n", "<leader>pp", function()
	local path = vim.fn.expand("%:h")
	if path == "" then
		vim.notify("No file to copy path", vim.log.levels.WARN)
		return
	end
	vim.fn.setreg("+", path)
	vim.notify("Copied path to clipboard: " .. path, vim.log.levels.INFO)
end, { desc = "copy current path" })

map("n", "<leader>pf", function()
	local path = vim.fn.expand("%")
	if path == "" then
		vim.notify("No file to copy filepath", vim.log.levels.WARN)
		return
	end
	vim.fn.setreg("+", path)
	vim.notify("Copied file path to clipboard: " .. path, vim.log.levels.INFO)
end, { desc = "copy current file path" })

-- qf list
map("n", "<leader>qo", [[<Cmd>copen<CR>]], { desc = "open [Q]uickfix list" })
map("n", "<leader>qc", [[<Cmd>cclose<CR>]], { desc = "close [Q]uickfix list" })
map("n", "<leader>qn", [[<Cmd>cnext<CR>]], { desc = "next [Q]uickfix item" })
map("n", "<leader>qp", [[<Cmd>cprev<CR>]], { desc = "prev [Q]uickfix item" })
map("n", "<leader>qf", [[<Cmd>cfirst<CR>]], { desc = "first [Q]uickfix item" })
map("n", "<leader>ql", [[<Cmd>clast<CR>]], { desc = "last [Q]uickfix item" })
map("n", "<leader>qt", [[<Cmd><CR>]], { desc = "next [Q]uickfix item" })
map("n", "<leader>qt", function()
	require("fzf-lua").quickfix()
end, { desc = "[Q]uickfix picker" })
