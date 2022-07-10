local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python",
        "rust",
        "go"
    },
    highlight = {
		disable = function (_, bufnr)
			local filename = vim.api.nvim_buf_get_name(bufnr)
			if filename == nil or filename == '' then
				return vim.api.nvim_buf_line_count(bufnr) > 10000;
			else
				return (vim.fn.getfsize(filename) > 1000000)
			end
		end,
        enable = true,
    },
    textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)
