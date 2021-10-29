vim.g.vimspector_enable_mappings = 'HUMAN'

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>dvd",[[ :call vimspector#Launch()<CR> ]],{noremap = true})
map("n", "<leader>dvr",[[ :VimspectorReset<CR> ]],{noremap = true})
map("n", "<leader>dvo",[[ :VimspectorShowOutput<CR> ]],{noremap = true})
map("n", "<leader>dvw",[[ :VimspectorWatch<CR> ]],{noremap = true})
map("n", "<leader>dvv",[[ :VimspectorEval<CR> ]],{noremap = true})

