-- Floaterminal based on the excellent tutorial by TJ DeVries
-- "Floating toggle-able terminal in Neovim in 50 lines of Lua"
-- https://youtu.be/5PIiKDES_wc

-- ┏━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Floating terminal  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━┛

local term = {}

local state = {
	floating = {
		buf = -1,
		win = -1,
	}
}

-- Create a floating window to place our terminal buffer.
local function create_floating_window(opts)
	opts = opts or {}

	-- Calculate the floating window's width and height.
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	-- Calculate the floating window's position (top-left corner).
	local x_pos = math.floor((vim.o.columns - width) / 2)
	local y_pos = math.floor((vim.o.lines - height) / 2)

	-- Create a buffer for the window.
	local buf = nil
	if vim.api.nvim_buf_is_valid(state.floating.buf) then
		buf = state.floating.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	-- Floating window options.
	local config = {
		relative = "editor",
		width = width,
		height = height,
		col = x_pos,
		row = y_pos,
		style = "minimal",
		border = "rounded",
		title = " neovim term 🐉",
		title_pos = "center",
		footer = " I 💖 neovim! ",
		footer_pos = "right",
	}

	local win = vim.api.nvim_open_win(buf, true, config)

	return { buf = buf, win = win }
end

-- Toggle our terminal window.
local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window()
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
		vim.defer_fn(function()
			local mode = vim.api.nvim_get_mode().mode
			if mode == "n" or mode == "nt" then
				vim.cmd "startinsert"
			end
		end, 100)
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

term.setup = function()
	vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

	-- TODO: When not in ~, bash doesn't read the configuration files.
	-- vim.opt.shell = "/opt/homebrew/bin/bash"
	-- vim.opt.shellcmdflag = "--login --rcfile ~/.bashrc"

	vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
	vim.keymap.set({ "n", "t" }, "<leader>tt", toggle_terminal)
end

return term
