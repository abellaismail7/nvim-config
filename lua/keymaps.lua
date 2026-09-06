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

-- Buffer navigation (Down/Right go forward, Up/Left go back)
map("n", "<leader><Down>" , [[gt]]                , { desc = "goto next tab" })
map("n", "<leader><Up>"   , [[gT]]                , { desc = "goto prev tab" })
map("n", "<leader><Right>", [[<cmd>bnext<cr>]]    , { desc = "goto next buffer" })
map("n", "<leader><Left>" , [[<cmd>bprevious<cr>]], { desc = "goto prev buffer" })
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

-- pick a quickfix entry through fzf-lua
local function qf_picker()
	require("fzf-lua").quickfix()
end

-- path
map("n", "<leader>p", require("utils.copy-file-path"), { desc = "copy [P]ath of current file" })

-- qf picker
map("n", "<leader>qt", qf_picker, { desc = "[Q]uickfix picker" })
