--- Keybindings.
-- As few and organised as possible.
-- I've added the prefix "Nano::" in the description so I know I've modified these.
-- And that way you can easily add your own prefix i.e. ":%s/Nano::/your_name/".

local setkey = vim.keymap.set

-- TODO: Check that we don't clash with some plugin's keymaps (i.e. lspconfig).
local keybindings = {
	normal = {
		-- Personal preference:
		{
			key = '<C-z>',
			cmd = ':w<CR>',
			opts = { desc = 'Nano::Write' }
		},
		{
			key = '<ESC>n',
			cmd = ':tabnew<CR>',
			opts = { desc = 'Nano::NewTab' }
		},
		{
			key = '<ESC>q',
			cmd = ':q<CR>',
			opts = { desc = 'Nano::Quit' }
		},
		{
			key = '<ESC>Q',
			cmd = ':qa<CR>',
			opts = { desc = 'Nano::QuitAll' }
		},
		{
			key = '<ESC>o',
			cmd = ':only<CR>',
			opts = { desc = 'Nano::Only' }
		},
		{
			key = '<ESC>w',
			cmd = ':tabclose<CR>',
			opts = { desc = 'Nano::CloseTab' }
		},
		-- NvimTree
		{
			key = '<leader>nt',
			cmd = '<cmd>NvimTreeToggle<CR>',
			opts = { desc = 'Nano::NvimTreeToggle' },
		},
		-- LSP
		{
			key = 'K',
			cmd = ':lua vim.lsp.buf.hover()<CR>',
			opts = { desc = 'Nano::Hover' }
		},
		{
			key = '<leader>rn',
			cmd = ':lua vim.lsp.buf.rename()<CR>',
			opts = { desc = 'Nano::LSP Rename' }
		},
		{
			key = '<leader>ca',
			cmd = ':lua vim.lsp.buf.code_action()<CR>',
			opts = { desc = 'Nano::LSP Code action' }
		},
		{
			key = 'gd',
			cmd = ':lua vim.lsp.buf.declaration()<CR>',
			opts = { desc = 'Nano::LSP Declaration' }
		},
		{
			key = '<leader>gd',
			cmd = ':lua vim.lsp.buf.definition()<CR>',
			opts = { desc = 'Nano::LSP Definition' }
		},
		{
			key = '<leader>gt',
			cmd = ':lua vim.lsp.buf.type_definition()<CR>',
			opts = { desc = 'Nano::LSP Definition' }
		},
		{
			key = '<leader>gI',
			cmd = ':lua vim.lsp.buf.implementation()<CR>',
			opts = { desc = 'Nano::LSP Implementation' }
		},
		{
			key = '<leader>gr',
			cmd = ':lua vim.lsp.buf.references()<CR>',
			opts = { desc = 'Nano::LSP References' }
		},
		{
			key = '<leader>ss',
			cmd = ':lua vim.lsp.buf.document_symbol()<CR>',
			opts = { desc = 'Nano::LSP Symbols' }
		},
		{
			key = '<leader>sh',
			cmd = ':lua vim.lsp.buf.signature_help()<CR>',
			opts = { desc = 'Nano::LSP Symbols' }
		},
		{
			key = '<leader>ff',
			cmd = ':lua vim.lsp.buf.format()<CR>',
			opts = { desc = 'Nano::LSP Format' }
		},
		{
			key = ']e',
			cmd = ':lua vim.diagnostic.open_float()<CR>',
			opts = { desc = 'Nano::Diagnostic Open' }
		},
		{
			key = ']d',
			cmd = ':lua vim.diagnostic.goto_next()<CR>',
			opts = { desc = 'Nano::Diagnostic next' }
		},
		{
			key = '[d',
			cmd = ':lua vim.diagnostic.goto_prev()<CR>',
			opts = { desc = 'Nano::Diagnostic previous' }
		},
		-- Telescope
		{
			key = '<leader>sf',
			cmd = '<CMD>Telescope find_files<CR>',
			opts = { desc = 'Nano::Find files' }
		},
		{
			key = '<leader>sg',
			cmd = '<CMD>Telescope live_grep<CR>',
			opts = { desc = 'Nano::Live grep' }
		},
		{
			key = '<leader>sd',
			cmd = '<CMD>Telescope diagnostics<CR>',
			opts = { desc = 'Nano::Diagnostics' }
		},
		-- DAP
		{
			key = '<leader>,',
			cmd = ':lua require("dap").continue()<CR>',
			opts = { desc = 'Nano::Dap Continue' }
		},
		{
			key = '<leader>t',
			cmd = ':lua require("dap").toggle_breakpoint()<CR>',
			opts = { desc = 'Nano::Dap Toggle Breakpoint' }
		},
		-- Dap UI
		{
			key = '<leader>ui',
			cmd = ':lua require("dapui").toggle()<CR>',
			opts = { desc = 'Nano::DapUI Toggle' }
		},
		-- Other
		{
			key = '<C-l>',
			cmd = ':nohlsearch<CR>',
			opts = { desc = 'Nano::Clear search' }
		},
	},
	insert = {
		{
			key = '<C-z>',
			cmd = '<ESC>:w<CR>',
			opts = { desc = 'Nano::Write' }
		},
	},

}

for _, kb in pairs(keybindings.normal) do
	setkey('n', kb.key, kb.cmd, kb.opts)
end

for _, kb in pairs(keybindings.insert) do
	setkey('i', kb.key, kb.cmd, kb.opts)
end

-- Vsnip
-- TODO: How to write this in Lua?
vim.cmd [[imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
vim.cmd [[imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<Tab>']]
vim.cmd [[smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
vim.cmd [[smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<Tab>']]

return {}
