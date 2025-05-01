return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "InsertLeave" },
	config = function()
		local lint = require "lint"

		lint.linters_by_ft = {
			rust = { "clippy" },
			go = { "golangcilint" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			lua = { "luacheck" },
			python = { "flake8", "mypy" },
		}

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			callback = function()
				require "lint".try_lint()
			end
		})
	end
}
