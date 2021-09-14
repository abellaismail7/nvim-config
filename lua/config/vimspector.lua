vim.g.vimspector_enable_mappings = 'HUMAN'

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>dd",[[ :call vimspector#Launch()<CR> ]],{noremap = true})
map("n", "<leader>dr",[[ :VimspectorReset<CR> ]],{noremap = true})
map("n", "<leader>do",[[ :VimspectorShowOutput<CR> ]],{noremap = true})
map("n", "<leader>dw",[[ :VimspectorWatch<CR> ]],{noremap = true})
map("n", "<leader>dv",[[ :VimspectorEval<CR> ]],{noremap = true})
