local M = {}

function M:setup()
	require("codecompanion").setup({
		strategies = {
			chat = {
				adapter = "anthropic",
			},
			inline = {
				adapter = "anthropic",
			},
		},
	})
end

return M
