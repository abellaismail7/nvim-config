
return {
	on_attach = function (client, bufrn)
		client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

		local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
		vim.keymap.set("n", "gs", ":TSLspOrganize<CR>", {buffer = bufrn})
        vim.keymap.set("n", "gi", ":TSLspRenameFile<CR>", {buffer = bufrn})
        vim.keymap.set("n", "go", ":TSLspImportAll<CR>", {buffer = bufrn})
	end
}
