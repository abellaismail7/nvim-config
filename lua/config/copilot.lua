local M = {}

function M:setup()
	require("copilot").setup({
		suggestion = {
			enabled = true,
			auto_trigger = true,
		},
		logger = {
			print_log_level = vim.log.levels.WARN,
		},
		nes = {
			enabled = true,
			auto_trigger = false,
			keymap = {
				accept_and_goto = false,
				accept = false,
				dismiss = false,
			},
		},
	})
end

function M:keys()
	vim.keymap.set({ "i", "n" }, "<C-]>", require("copilot.suggestion").accept_line, {
		desc = "accept copilot line",
	})

	vim.keymap.set({ "i", "n" }, "<M-]>", require("copilot.nes.api").nes_apply_pending_nes, {
		desc = "accept copilot line",
	})
	-- vim.keymap.set({ "i", "n" }, "<leader-[>", require("copilot.suggestion").accept_word, {
	-- 	desc = "accept copilot word",
	-- })
end

return M
