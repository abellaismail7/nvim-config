-- setup
require("copilot").setup({})

-- keymaps
vim.keymap.set({ "i", "n" }, "<C-]>", require("copilot.suggestion").accept_line, {
	desc = "accept copilot line",
})

vim.keymap.set({ "i", "n" }, "<M-]>", require("copilot.nes.api").nes_apply_pending_nes, {
	desc = "accept copilot line",
})
