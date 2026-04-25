local map = vim.keymap.set
local M = {}
--local winp = require 'config.win_picker'

-- [[ Basic Keymaps ]]
--

function M:basic()
	-- disable pageup/down
	map({ "n", "i", "v" }, "<PageUp>", "<Nop>", { silent = true })
	map({ "n", "i", "v" }, "<PageDown>", "<Nop>", { silent = true })

	local sample = require("telescope.themes").get_dropdown({ winblend = 10, previewer = true })
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
	vim.keymap.set("n", "gqf", require("conform").format, { desc = "Format file" })

	-- path
	vim.keymap.set("n", "<leader>pp", function()
		local path = vim.fn.expand("%:h")
		if path == "" then
			vim.notify("No file to copy path", vim.log.levels.WARN)
			return
		end
		vim.fn.setreg("+", path)
		vim.notify("Copied path to clipboard: " .. path, vim.log.levels.INFO)
	end, { desc = "copy current path" })

	vim.keymap.set("n", "<leader>pf", function()
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
		require("telescope.builtin").quickfix(sample)
	end, { desc = "[Q]uickfix [T]elescope" })

	M:gitworktree()
	M:ts_text_objects()
	require("config.ai.sidekick"):keys()
	require("config.copilot"):keys()
end

function M:telescope()
	--{{{
	local fav_theme = function(builtin, previewer, opts)
		if not previewer then
			previewer = true
		end
		return function()
			local theme = require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer,
			})
			for k, v in pairs(opts or {}) do
				theme[k] = v
			end
			require("telescope.builtin")[builtin](theme)
		end
	end
	--}}}
	-- See `:help telescope.builtin`
	vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
	vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

	map("n", "gl", fav_theme("lsp_document_symbols"), { desc = "[G]o to [L]sp of symbols" })
	map("n", "<leader><leader>", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
	map("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
	map("n", "<leader>fg", function()
		fav_theme("live_grep", true, {})()
	end, { desc = "[S]earch by [G]rep" })
	map("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
	map("n", "<leader>fs", function()
		local search = vim.fn.input("Search > ")
		if search == "" then
			return
		end
		fav_theme("grep_string", true, { search = search })()
	end, { desc = "grep for words" })
end

function M.lsp()
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<M-CR>", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	--nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>lwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")
	M:diagnostic()
end

function M.diagnostic()
	-- Diagnostic keymaps
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, { desc = "Go to previous diagnostic message" })
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, { desc = "Go to next diagnostic message" })
	vim.keymap.set("n", ",e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
end

-- SQL CLIENT
function M:dadbod()
	map("v", "<leader>sq", [[<Cmd>DBUI_ExecuteQuery<CR>]], { desc = "execute selected query" })
end

-- UFO (Fold Plugin)
function M:ufo()
	map("n", "zR", require("ufo").openAllFolds)
	map("n", "zM", require("ufo").closeAllFolds)
end

-- OIL (Plugin Manager)
function M:oil()
	return { { "-", "<CMD>Oil --float<CR>", mode = "n", desc = "Open parent directory" } }
end

function M:gitworktree()
	map("n", "gw", function()
		require("config.worktree").wtpicker({
			onSelect = function(selection)
				if selection == "List" then
					require("telescope").extensions.git_worktree.git_worktrees()
				elseif selection == "Create" then
					require("config.worktree").wtCreate()
				elseif selection == "Remove" then
					require("config.worktree").wtRemove()
				else
					error("wt unkown option: " .. selection)
				end
			end,
		})
	end)
end

function M:gitSigns()
	map("n", "<leader>sn", [[ <cmd>Gitsigns next_hunk<CR> ]])
	map("n", "<leader>sp", [[ <cmd>Gitsigns prev_hunk<CR> ]])
	map("n", "<leader>st", [[ <cmd>Gitsigns toggle_numhl<CR> ]])
	map("n", "<leader>ss", [[ <cmd>Gitsigns stage_hunk<CR> ]])
	map("n", "<leader>sr", [[ <cmd>Gitsigns reset_hunk<CR> ]])
	map("n", "<leader>si", [[ <cmd>Gitsigns preview_hunk_inline<CR> ]])
	map("n", "<leader>sd", [[ <cmd>Gitsigns diffthis<CR> ]])
	map("n", "<leader>sb", [[ <cmd>Gitsigns toggle_current_line_blame<CR> ]])
	-- map("n", "<leader>gf", [[ <cmd>Gitsigns stage_buffer<CR> ]])
end

function M:dap()
	local dap = require("dap")
	map("n", "<F1>", dap.continue)
	map("n", "<F2>", dap.step_into)
	map("n", "<F3>", dap.step_over)
	map("n", "<F4>", dap.step_out)
	map("n", "<F5>", dap.step_back)
	map("n", "<F12>", dap.restart)
end

function M:ts_text_objects()
	local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

	-- Repeat movement with ; and ,
	-- ensure ; goes forward and , goes backward regardless of the last direction
	vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
	vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

	-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
	vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
	vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
	vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
	vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
end

-- Keybinding to copy type under cursor
vim.keymap.set("n", "<leader>ct", function()
	local params = vim.lsp.util.make_position_params(0, "utf-8")

	vim.lsp.buf_request_all(0, "textDocument/hover", params, function(results)
		local result
		for _, res in pairs(results or {}) do
			if res.result and res.result.contents then
				result = res.result
				break
			end
		end
		if not result then
			print("No type information available")
			return
		end

		local contents = result.contents
		local markdown_text = ""

		if type(contents) == "table" and contents.kind == "markdown" then
			markdown_text = contents.value
		elseif type(contents) == "table" and contents[1] then
			markdown_text = contents[1].value or tostring(contents[1])
		else
			markdown_text = tostring(contents)
		end

		-- Extract just the type information (remove markdown formatting)
		local type_line = markdown_text:match("```%w*\n(.-)```") or markdown_text:match("^([^\n]*)")

		if type_line then
			vim.fn.setreg("+", type_line)
			print("Type copied: " .. type_line)
		end
	end)
end, { desc = "Copy type under cursor to clipboard" })

return M
