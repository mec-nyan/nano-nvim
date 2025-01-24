--[[ Scroll functions to make <C-D>/<C-U> more visual.
--]]

-- TODO: Add ease functions.
-- TODO: Simplify...

local smooth = {}

-- Default delay. Use "setup(delay)" to use a custom delay.
local _delay = 15

function make_callback_next(timer, amount)
	local start = 0
	local ctrl_e = vim.api.nvim_replace_termcodes('<C-e>', false, false, true)
	return function()
		local pos = vim.api.nvim_win_get_cursor(0)
		local last = vim.fn.line('$')
		local scroll = vim.o.scroll
		-- We've reached the top of the screen.
		if start == amount or pos[1] >= (last - scroll) then
			timer:stop()
			timer:close()
			return
		end
		vim.api.nvim_feedkeys(ctrl_e, 'n', false)
		start = start + 1
	end
end

function smooth.scroll_next_w_timer()
	local amount = vim.wo.scroll
	local timer = vim.uv.new_timer()
	timer:start(0, _delay, vim.schedule_wrap(make_callback_next(timer, amount)))
	-- In case something goes wrong, you can stop this timer.
	return timer
end

function make_callback_prev(timer, amount)
	local start = 0
	local ctrl_y = vim.api.nvim_replace_termcodes('<C-y>', false, false, true)
	return function()
		if start == amount then
			timer:stop()
			timer:close()
			return
		end
		vim.api.nvim_feedkeys(ctrl_y, 'n', false)
		start = start + 1
	end
end

function smooth.scroll_prev_w_timer()
	local amount = vim.wo.scroll
	local timer = vim.uv.new_timer()
	timer:start(0, _delay, vim.schedule_wrap(make_callback_prev(timer, amount)))
	-- In case something goes wrong, you can stop this timer.
	return timer
end

-- ZZ
-- These are relative to the window, not the buffer!

function make_callback_down(timer, amount)
	local start = 0
	local ctrl_e = vim.api.nvim_replace_termcodes('<C-e>', false, false, true)
	return function()
		local pos = vim.fn.winline()
		local off = vim.wo.scrolloff
		if start == amount or off+1 == pos then
			timer:stop()
			timer:close()
			return
		end
		vim.api.nvim_feedkeys(ctrl_e, 'n', false)
		start = start + 1
	end
end

function make_callback_up(timer, amount)
	local start = 0
	local ctrl_y = vim.api.nvim_replace_termcodes('<C-y>', false, false, true)
	return function()
		if start == amount then
			timer:stop()
			timer:close()
			return
		end
		vim.api.nvim_feedkeys(ctrl_y, 'n', false)
		start = start + 1
	end
end

function smooth.zz()
	local height = vim.o.scroll
	local pos = vim.fn.winline()
	if pos == height then
		return
	end

	local timer = vim.uv.new_timer()

	if pos > height then
		timer:start(0, _delay, vim.schedule_wrap(make_callback_down(timer, pos - height)))
	else
		timer:start(0, _delay, vim.schedule_wrap(make_callback_up(timer, height - pos)))
	end

	return timer
end

function smooth.zt()
	local off = vim.wo.scrolloff
	local pos = vim.fn.winline()
	if pos <= off + 1 then
		return
	end
	local amount = pos - off
	local timer = vim.uv.new_timer()
	timer:start(0, _delay, vim.schedule_wrap(make_callback_down(timer, amount)))
	return timer
end

function smooth.zb()
	local off = vim.wo.scrolloff
	local height = vim.api.nvim_win_get_height(0)
	local pos = vim.fn.winline()
	local amount = height - pos - off
	local timer = vim.uv.new_timer()
	timer:start(0, _delay, vim.schedule_wrap(make_callback_up(timer, amount)))
	return timer
end

--- Sets default delay and adds key bindings to replace <C-u> and <C-d>.
-- @param delay (optional) The delay in ms (default = 16).
function smooth.setup(delay)
	_delay = delay or _delay
	vim.keymap.set('n', '<C-u>', smooth.scroll_prev_w_timer, { desc = "Nano::Prev page" })
	vim.keymap.set('n', '<C-d>', smooth.scroll_next_w_timer, { desc = "Nano::Next page" })
	vim.keymap.set('n', 'zt', smooth.zt, { desc = "Nano::Next zt" })
	vim.keymap.set('n', 'zb', smooth.zb, { desc = "Nano::Next zb" })
	vim.keymap.set('n', 'zz', smooth.zz, { desc = "Nano::Next zz" })
end

return smooth
