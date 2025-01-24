--- Dignostics configuration.

vim.diagnostic.config({
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

return {}
