local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
    group = highlight_group,
})

-- Spell check prose only, never code buffers
autocmd('FileType', {
    pattern = { 'markdown', 'text', 'gitcommit', 'tex', 'plaintex' },
    callback = function()
        vim.opt_local.spell = true
    end,
    group = augroup('Spell', { clear = true }),
})
