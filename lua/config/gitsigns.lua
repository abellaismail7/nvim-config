return {
	signcolumn = false,
	numhl = true,
	on_attach = function(_)
		require("keymaps"):gitSigns()
	end,
}
