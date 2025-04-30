return {
	"mfussenegger/nvim-dap",
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
					name = "nano::debug " .. vim.fn.expand("%:r") .. ".o",
					type = "lldb",
					request = "launch",
					program = "${fileBasenameNoExtension}.o",
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
				{
					name = "nano::selece executable",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			dap.adapters.go = function(callback, config)
				if config.mode == 'remote' and config.request == 'attach' then
					callback({
						type = 'server',
						host = config.host or '127.0.0.1',
						port = config.port or 38697,
					})
				else
					callback({
						type = 'server',
						port = '${port}',
						executable = {
							command = 'dlv',
							args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
							detached = vim.fn.has('win32') == 0,
						},
						options = {
							initialize_timeout_sec = 20,
						},
					})
				end
			end

			dap.configurations.go = {
				{
					type = 'go',
					name = 'nano::debug',
					request = 'launch',
					program = '${file}',
				},
				{
					type = 'go',
					name = 'nano::debug (go.mod)',
					request = 'launch',
					program = './${relativeFileDirname}',
				},
				{
					type = 'go',
					name = 'nano::debug test',
					mode = 'test',
					request = 'launch',
					program = '${file}',
				},
				{
					type = 'go',
					name = 'nano::debug test (go.mod)',
					mode = 'test',
					request = 'launch',
					program = './${relativeFileDirname}',
				},
			}
		end,
	},
	-- {
	-- 	"leoluz/nvim-dap-go",
	-- 	config = function()
	-- 		require("dap-go").setup()
	-- 	end,
	-- },
}
