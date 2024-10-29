require("lazy").setup({spec = {
    -- import your plugins
    { import = "plugins.basic" },
		{ import = "plugins.lsp" },
		{ import = "plugins.dap" },
		-- not necessarily important
		{ import = "plugins.extra" },
}});
