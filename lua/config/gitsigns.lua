local gitsigns = require"gitsigns"

gitsigns.setup({
  signcolumn = false,
  numhl      = true,

  on_attach = function (_)
    vim.keymap.set("n", "<leader>gn", [[ <cmd>Gitsigns next_hunk<CR> ]])
    vim.keymap.set("n", "<leader>gp", [[ <cmd>Gitsigns prev_hunk<CR> ]])
    vim.keymap.set("n", "<leader>gt", [[ <cmd>Gitsigns toggle_numhl<CR> ]])
    vim.keymap.set("n", "<leader>gs", [[ <cmd>Gitsigns toggle_signs<CR> ]])
    vim.keymap.set("n", "<leader>gr", [[ <cmd>Gitsigns reset_hunk<CR> ]])
  end

})
