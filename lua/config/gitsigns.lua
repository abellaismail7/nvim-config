local gitsigns = require"gitsigns"

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

gitsigns.setup({
  signcolumn = false,
  numhl      = true,

  on_attach = function (_)
    map("n", "<leader>gn", [[ <cmd>Gitsigns next_hunk<CR> ]])
    map("n", "<leader>gp", [[ <cmd>Gitsigns prev_hunk<CR> ]])
    map("n", "<leader>gt", [[ <cmd>Gitsigns toggle_numhl<CR> ]])
    map("n", "<leader>gs", [[ <cmd>Gitsigns toggle_signs<CR> ]])
    map("n", "<leader>gr", [[ <cmd>Gitsigns reset_hunk<CR> ]])
  end

})
