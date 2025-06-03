--- Dignostics configuration.
local border = { "╭", "━", "╮", "┃", "╯", "━", "╰", "┃" }


vim.diagnostic.config({
	float = { border = "solid", source = true },
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.INFO] = ' ',
			[vim.diagnostic.severity.HINT] = ' ',
			[vim.diagnostic.severity.WARN] = ' ',
			[vim.diagnostic.severity.ERROR] = ' ',
		},
		linehl = {
			[vim.diagnostic.severity.INFO] = '',
			[vim.diagnostic.severity.HINT] = '',
			[vim.diagnostic.severity.WARN] = '',
			[vim.diagnostic.severity.ERROR] = '',
		},
		numhl = {
			[vim.diagnostic.severity.INFO] = 'Directory',
			[vim.diagnostic.severity.HINT] = 'Character',
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
		},
	},
})

local def_sign = vim.fn.sign_define

def_sign('DapBreakpoint', {
	text = ' ',
	texthl = 'WarningMsg',
	linehl = '',
	numhl = '',
})
def_sign('DapBreakpointCondition', {
	text = ' ',
	texthl = 'Character',
	linehl = '',
	numhl = ''
})
def_sign('DapLogPoint', {
	text = ' ',
	texthl = 'Character',
	linehl = '',
	numhl = ''
})
def_sign('DapStopped', {
	text = ' ',
	texthl = 'ErrorMsg',
	linehl = '',
	numhl = ''
})
def_sign('DapBreakpointRejected', {
	text = ' ',
	texthl = 'ErrorMsg',
	linehl = '',
	numhl = ''
})

return {}
