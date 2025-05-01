--- Keybindings.
-- As few and organised as possible.
-- I've added the prefix "Nano::" in the description so I know I've modified these.
-- And that way you can easily add your own prefix i.e. ":%s/Nano::/your_name/".

local setkey = vim.keymap.set

-- TODO: These function should not be here.
local function toggle_scopes()
	local win_height = vim.api.nvim_win_get_height(0)
	local split_height = math.floor(win_height / 3)
	local widgets = require "dap.ui.widgets"
	local sidebar = widgets.sidebar(widgets.scopes, { height = split_height }, 'belowright split')
	return function()
		sidebar.toggle()
	end
end

local function toggle_frames()
	local win_width = vim.api.nvim_win_get_width(0)
	local split_width = math.floor(win_width / 4)
	local widgets = require "dap.ui.widgets"
	local sidebar = widgets.sidebar(widgets.frames, { width = split_width }, 'vertical topleft split')
	return function()
		sidebar.toggle()
	end
end

local function toggle_repl()
	local win_height = vim.api.nvim_win_get_height(0)
	local split_height = math.floor(win_height / 4)
	local dap = require "dap"
	dap.repl.toggle({ height = split_height }, 'belowright split')
end

local function show_breakpoints()
	require "dap".list_breakpoints()
	vim.cmd ":copen"
end

-- TODO: Check that we don't clash with some plugin's keymaps (i.e. lspconfig).
local keybindings = {
	normal = {
		-- Personal preference:
		{
			key = "<C-z>",
			cmd = ":w<CR>",
			opts = { desc = "Nano::Write" },
		},
		{
			key = "<ESC>n",
			cmd = ":tabnew<CR>",
			opts = { desc = "Nano::NewTab" },
		},
		{
			key = "<ESC>q",
			cmd = ":q<CR>",
			opts = { desc = "Nano::Quit" },
		},
		{
			key = "<ESC>Q",
			cmd = ":qa<CR>",
			opts = { desc = "Nano::QuitAll" },
		},
		{
			key = "<ESC>o",
			cmd = ":only<CR>",
			opts = { desc = "Nano::Only" },
		},
		{
			key = "<ESC>w",
			cmd = ":tabclose<CR>",
			opts = { desc = "Nano::CloseTab" },
		},
		-- Navigating windows
		{
			key = "<C-J>",
			cmd = "<C-W>j",
			opts = { desc = "Nano::Move to the window below" },
		},
		{
			key = "<C-K>",
			cmd = "<C-W>k",
			opts = { desc = "Nano::Move to the window above" },
		},
		{
			key = "<C-H>",
			cmd = "<C-W>h",
			opts = { desc = "Nano::Move to the window to the left" },
		},
		{
			key = "<C-L>",
			cmd = "<C-W>l",
			opts = { desc = "Nano::Move to the window to the right" },
		},
		-- Quickfix
		{
			key = "<leader>co",
			cmd = ":copen<CR>",
			opts = { desc = "Nano::Open QuickFix window" },
		},
		{
			key = "<leader>cc",
			cmd = ":cclose<CR>",
			opts = { desc = "Nano::Close QuickFix window" },
		},
		-- Diagnostic (i.e. linting)
		{
			key = "<leader>cd",
			cmd = ":lua vim.diagnostic.setqflist()<CR>",
			opts = { desc = "Nano::Diagnostics in QF window" },
		},
		{
			key = "<leader>td",
			cmd = ":lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>",
			opts = { desc = "Nano::Toggle diagnostics" },
		},
		-- NvimTree
		{
			key = "<leader>nt",
			cmd = "<cmd>NvimTreeToggle<CR>",
			opts = { desc = "Nano::NvimTreeToggle" },
		},
		{
			key = "<leader>nf",
			cmd = "<cmd>NvimTreeFindFile<CR>",
			opts = { desc = "Nano::NvimTreeFindFile" },
		},
		-- LSP
		{
			key = "K",
			cmd = ":lua vim.lsp.buf.hover()<CR>",
			opts = { desc = "Nano::Hover" },
		},
		{
			key = "<leader>rn",
			cmd = ":lua vim.lsp.buf.rename()<CR>",
			opts = { desc = "Nano::LSP Rename" },
		},
		{
			key = "<leader>ca",
			cmd = ":lua vim.lsp.buf.code_action()<CR>",
			opts = { desc = "Nano::LSP Code action" },
		},
		{
			key = "gd",
			cmd = ":lua vim.lsp.buf.declaration()<CR>",
			opts = { desc = "Nano::LSP Declaration" },
		},
		{
			key = "<leader>gd",
			cmd = ":lua vim.lsp.buf.definition()<CR>",
			opts = { desc = "Nano::LSP Definition" },
		},
		{
			key = "<leader>gt",
			cmd = ":lua vim.lsp.buf.type_definition()<CR>",
			opts = { desc = "Nano::LSP Definition" },
		},
		{
			key = "<leader>gI",
			cmd = ":lua vim.lsp.buf.implementation()<CR>",
			opts = { desc = "Nano::LSP Implementation" },
		},
		{
			key = "<leader>gr",
			cmd = ":lua vim.lsp.buf.references()<CR>",
			opts = { desc = "Nano::LSP References" },
		},
		{
			key = "<leader>ss",
			cmd = ":lua vim.lsp.buf.document_symbol()<CR>",
			opts = { desc = "Nano::LSP Symbols" },
		},
		{
			key = "<leader>sh",
			cmd = ":lua vim.lsp.buf.signature_help()<CR>",
			opts = { desc = "Nano::LSP Symbols" },
		},
		{
			key = "<leader>ff",
			cmd = ":lua vim.lsp.buf.format()<CR>",
			opts = { desc = "Nano::LSP Format" },
		},
		{
			key = "]e",
			cmd = ":lua vim.diagnostic.open_float()<CR>",
			opts = { desc = "Nano::Diagnostic Open" },
		},
		{
			key = "]d",
			cmd = ":lua vim.diagnostic.goto_next()<CR>",
			opts = { desc = "Nano::Diagnostic next" },
		},
		{
			key = "[d",
			cmd = ":lua vim.diagnostic.goto_prev()<CR>",
			opts = { desc = "Nano::Diagnostic previous" },
		},
		{
			key = "<leader>ih",
			cmd = ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({bufnr=0}), {bufnr=0})<CR>",
			opts = { desc = "Nano::Toggle inlay hints" },
		},
		-- Telescope
		{
			key = "<leader>sf",
			cmd = "<CMD>Telescope find_files<CR>",
			opts = { desc = "Nano::Find files" },
		},
		{
			key = "<leader>sg",
			cmd = "<CMD>Telescope live_grep<CR>",
			opts = { desc = "Nano::Live grep" },
		},
		{
			key = "<leader>sd",
			cmd = "<CMD>Telescope diagnostics<CR>",
			opts = { desc = "Nano::Diagnostics" },
		},
		-- DAP
		{
			key = "<leader>d,",
			cmd = ":DapContinue<CR>",
			opts = { desc = "Nano::Dap Continue" },
		},
		{
			key = "<leader>dt",
			cmd = ":DapToggleBreakpoint<CR>",
			opts = { desc = "Nano::Dap Toggle Breakpoint" },
		},
		{
			key = "<leader>db",
			cmd = show_breakpoints,
			opts = { desc = "Nano::Dap List Breakpoints" },
		},
		{
			key = "<leader>dc",
			cmd = ":lua require'dap'.clear_breakpoints()<CR>",
			opts = { desc = "Nano::Dap Clear Breakpoints" },
		},
		{
			key = "<leader>dx",
			cmd = ":DapTerminate<CR>",
			opts = { desc = "Nano::Dap Terminate" },
		},
		{
			key = "<leader>dr",
			cmd = toggle_repl,
			opts = { desc = "Nano::Dap Toggle REPL" },
		},
		{
			key = "<leader>de",
			cmd = ":DapEval<CR>",
			opts = { desc = "Nano::Dap Eval" },
		},
		{
			key = "<leader>do",
			cmd = ':DapStepOver<CR>',
			opts = { desc = "Nano::Dap Step Over" },
		},
		{
			key = "<leader>di",
			cmd = ':DapStepInto<CR>',
			opts = { desc = "Nano::Dap Step Into" },
		},
		{
			key = "<leader>dh",
			cmd = ':lua require("dap.ui.widgets").hover()<CR>',
			opts = { desc = "Nano::Dap Widgets::hover" },
		},
		{
			key = "<leader>dp",
			cmd = ':lua require("dap.ui.widgets").preview()<CR>',
			opts = { desc = "Nano::Dap Widgets::preview" },
		},
		{
			key = "<leader>df",
			cmd = function()
				local widgets = require "dap.ui.widgets"
				widgets.centered_float(widgets.frames)
			end,
			opts = { desc = "Nano::Dap Widgets::frames" },
		},
		{
			key = "<leader>ds",
			cmd = function()
				local widgets = require "dap.ui.widgets"
				widgets.centered_float(widgets.scopes)
			end,
			opts = { desc = "Nano::Dap Widgets::scopes" },
		},
		{
			key = "<leader>dss",
			cmd = toggle_scopes(),
			opts = { desc = "Nano::Dap Widgets::scopes" },
		},
		{
			key = "<leader>dff",
			cmd = toggle_frames(),
			opts = { desc = "Nano::Dap Widgets::frames" },
		},
		-- Dap UI
		{
			key = "<leader>ui",
			cmd = ':lua require("dapui").toggle()<CR>',
			opts = { desc = "Nano::DapUI Toggle" },
		},
		-- Zen
		{
			key = "<leader>zz",
			cmd = ":ZenMode<CR>",
			opts = { desc = "Nano::Zen mode" },
		},
		-- Other
		{
			key = "<leader><esc>",
			cmd = ":nohlsearch<CR>",
			opts = { desc = "Nano::Clear search" },
		},
		{
			key = "<leader>ss",
			cmd = ":suspend<CR>",
			opts = { desc = "Nano::Suspend" },
		},
	},
	insert = {
		{
			key = "<C-z>",
			cmd = "<ESC>:w<CR>",
			opts = { desc = "Nano::Write" },
		},
	},
}

for _, kb in pairs(keybindings.normal) do
	setkey("n", kb.key, kb.cmd, kb.opts)
end

for _, kb in pairs(keybindings.insert) do
	setkey("i", kb.key, kb.cmd, kb.opts)
end

-- Vsnip
-- TODO: How to write this in Lua?
vim.cmd([[imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']])
vim.cmd([[imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<Tab>']])
vim.cmd([[smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']])
vim.cmd([[smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<Tab>']])

return {}
