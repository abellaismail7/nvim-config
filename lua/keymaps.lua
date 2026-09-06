-- stylua: ignore start
-- ^ this file is hand-aligned into columns; keep the formatter off it

local map = vim.keymap.set

-- disable pageup/down
map({ "n", "i", "v" }, "<PageUp>"  , "<Nop>", { silent = true })
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
map("n", "<C-M-Left>" , [[<C-w><]], { desc = "resize window" })
map("n", "<C-M-Down>" , [[<C-w>+]], { desc = "resize window" })
map("n", "<C-M-Up>"   , [[<C-w>-]], { desc = "resize window" })
map("n", "<C-M-Right>", [[<C-w>>]], { desc = "resize window" })

-- Maximizer
map("n", "<leader>m", require("mini.misc").zoom, { desc = "zoom current window" })

-- Buffer navigation
map("n", "<leader><Down>" , [[gt]]                , { desc = "goto prev tab" })
map("n", "<leader><Up>"   , [[gT]]                , { desc = "goto next tab" })
map("n", "<leader><Left>" , [[<cmd>bnext<cr>]]    , { desc = "goto next buffer" })
map("n", "<leader><Right>", [[<cmd>bprevious<cr>]], { desc = "goto prev buffer" })
map("n", "<leader>tn"     , [[<cmd>tabnew<cr>]]   , { desc = "create new tab" })
map("n", "<leader>tr"     , [[:TablineTabRename ]], { desc = "rename current tab" })

-- switch split
map("n", "<C-S-Left>" , [[:wincmd H<cr>]], { desc = "switch current window with left one" })
map("n", "<C-S-Down>" , [[:wincmd J<cr>]], { desc = "switch current window with bottom one" })
map("n", "<C-S-Up>"   , [[:wincmd K<cr>]], { desc = "switch current window with top one" })
map("n", "<C-S-Right>", [[:wincmd L<cr>]], { desc = "switch current window with right one" })

-- utils
map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "copy whole file" })

-- buffers
-- close buffer, keeping the window layout
map("n", "<leader>bc", require("mini.bufremove").delete, { desc = "close current buffer" })
-- save buffer
map("n", "<leader>bs", [[:w]]                          , { desc = "save current buffer" })

-- registers
map("v", "p", [["_dP]])

-- format
map("n", "gqf", require("conform").format, { desc = "Format file" })

-- qf list
map("n", "<leader>qo", [[<Cmd>copen<CR>]] , { desc = "open [Q]uickfix list" })
map("n", "<leader>qc", [[<Cmd>cclose<CR>]], { desc = "close [Q]uickfix list" })
map("n", "<leader>qn", [[<Cmd>cnext<CR>]] , { desc = "next [Q]uickfix item" })
map("n", "<leader>qp", [[<Cmd>cprev<CR>]] , { desc = "prev [Q]uickfix item" })
map("n", "<leader>qf", [[<Cmd>cfirst<CR>]], { desc = "first [Q]uickfix item" })
map("n", "<leader>ql", [[<Cmd>clast<CR>]] , { desc = "last [Q]uickfix item" })

-- ---------------------------------------------------------------------------
-- functions
-- ---------------------------------------------------------------------------

-- copy the directory holding the current file to the clipboard
local function copy_dir_path()
	local path = vim.fn.expand("%:h")
	if path == "" then
		vim.notify("No file to copy path", vim.log.levels.WARN)
		return
	end
	vim.fn.setreg("+", path)
	vim.notify("Copied path to clipboard: " .. path, vim.log.levels.INFO)
end

-- copy the path of the current file to the clipboard
local function copy_file_path()
	local path = vim.fn.expand("%")
	if path == "" then
		vim.notify("No file to copy filepath", vim.log.levels.WARN)
		return
	end
	vim.fn.setreg("+", path)
	vim.notify("Copied file path to clipboard: " .. path, vim.log.levels.INFO)
end

-- pick a quickfix entry through fzf-lua
local function qf_picker()
	require("fzf-lua").quickfix()
end

-- path
map("n", "<leader>pp", copy_dir_path , { desc = "copy current path" })
map("n", "<leader>pf", copy_file_path, { desc = "copy current file path" })

-- qf picker
map("n", "<leader>qt", qf_picker, { desc = "[Q]uickfix picker" })
