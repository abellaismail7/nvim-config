local js_based_languages = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vue",
}

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"mxsdev/nvim-dap-vscode-js",
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
			},
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()

			require("dap-vscode-js").setup({
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			require("keymaps"):dap()

			for _, language in ipairs(js_based_languages) do
				dap.configurations[language] = {
					{
						type = "pwa-chrome",
						name = "Next.js: Debug Chrome",
						request = "launch",
						url = "http://localhost:3000",
						webRoot = "${workspaceFolder}",
						sourceMaps = true,
						protocol = "inspector",
						sourceMapPathOverrides = {
							-- Add source map overrides if needed
							["webpack://_N_E/./*"] = "${webRoot}/*",
							["webpack:///./*"] = "${webRoot}/*",
						},
					},
					{
						type = "pwa-node",
						name = "Next.js: Debug Server-side pnpm",
						request = "launch",
						cwd = "${workspaceFolder}",
						runtimeExecutable = "pnpm",
						runtimeArgs = { "dev" },
						sourceMaps = true,
						protocol = "inspector",
						console = "integratedTerminal",
						skipFiles = { "<node_internals>/**" },
					},
				}
			end

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
				print("terminated")
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
				print("closed")
			end
		end,
	},
}
