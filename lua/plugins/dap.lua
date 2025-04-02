return {
	'mfussenegger/nvim-dap',
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()

			local dap = require("dap")

			dap.adapters.lldb = {
				type = "executable",
				command = "/opt/homebrew/Cellar/llvm/20.1.1/bin/lldb-dap",
				name = "lldb",
			}

			dap.configurations.cpp = {
				{
					name = "Debug",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},
				},
				{
					name = "Dummy",
				}
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end
	},
	{
		'leoluz/nvim-dap-go',
		config = function()
			require("dap-go").setup()
		end
	},
}
