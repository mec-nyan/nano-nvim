-- Startup configuration.
--
-- I want to open the file tree when nvim is invoked with no files.
-- But maybe we can add other stuff later, like a splash screen etc.
--
-- Neovim ASCII logo generated with jp2a.


--[[
       x:             .x
     :Odoc             d0;
    Kdoolll            ddxK
  dxoooolllo           ooookd
.d:oddddlllld          oooood0.
c:;;odddllllld         ooooooox
;;;;;lddllllllx        oooooooo
;;;;;;lolllllllx       llllllll
;;;;;;,llllllllld.     llllllll
;;;;;;;,.llllllllo.    llllllll
;;;;;;;; .cccccccco.   llllllll
,,,,,,,,  .ccccccccl,  llllllll
,,,,,,,,   .cccccccco; cccccccc
,,,,,,,,     ccccccccl:cccccccc
,,,,,,,,      ccccccccccccccccc
,,,,,,,,       ::::::::lccccccc
,,,,,,,,        :::::::llc:::::
,,,,,,,,         ;:::::lllc::::
.,,,,,,,          ,::::cccc:::.
  .,,,,,           ,:::ccccc;
    ''''            ';;cccc
     .''             .;cc'
       .              .:
--]]


local startup = function()
	require "nvim-tree.api".tree.open()
	vim.cmd ":winc l"
	local splash = false
	---[[
	if vim.fn.argc() == 0 then
		splash = true
		vim.cmd "enew"
		vim.bo.modified = false
		vim.bo.buflisted = false
		vim.bo.buftype = 'nofile'
		vim.bo.swapfile = false
		vim.bo.bufhidden = 'wipe'
		vim.bo.readonly = true

		-- Save user's settings.
		local u_ccolumn = vim.api.nvim_get_option_value('colorcolumn', {})
		local u_number = vim.api.nvim_get_option_value('number', {})
		local u_relnumber = vim.api.nvim_get_option_value('relativenumber', {})
		print("cc:", u_ccolumn, "ln:", u_number, "rn:", u_relnumber)

		-- Don't show these on the welcome screen.
		vim.api.nvim_set_option_value('colorcolumn', '', {})
		vim.api.nvim_set_option_value('number', false, {})
		vim.api.nvim_set_option_value('relativenumber', false, {})
		local ns = vim.api.nvim_create_namespace("StartupScreen")
		local comment_hl = vim.api.nvim_get_hl(0, {
			name = "Comment", link = false,
		})
		vim.api.nvim_set_hl(ns, "Normal", { fg = comment_hl.fg })
		vim.api.nvim_win_set_hl_ns(0, ns)
		vim.api.nvim_set_option_value("winhighlight", "Normal:Normal", { scope = "local" })
		local welcome_message = {
			"       Welcome to Neovim       ",
			"",
			"",
			"",
			"",
			"       x:             .x       ",
			"     :Odoc             d0;     ",
			"    Kdoolll            ddxK    ",
			"  dxoooolllo           ooookd  ",
			".d:oddddlllld          oooood0.",
			"c:;;odddllllld         ooooooox",
			";;;;;lddllllllx        oooooooo",
			";;;;;;lolllllllx       llllllll",
			";;;;;;,llllllllld.     llllllll",
			";;;;;;;,.llllllllo.    llllllll",
			";;;;;;;; .cccccccco.   llllllll",
			",,,,,,,,  .ccccccccl,  llllllll",
			",,,,,,,,   .cccccccco; cccccccc",
			",,,,,,,,     ccccccccl:cccccccc",
			",,,,,,,,      ccccccccccccccccc",
			",,,,,,,,       ::::::::lccccccc",
			",,,,,,,,        :::::::llc:::::",
			",,,,,,,,         ;:::::lllc::::",
			".,,,,,,,          ,::::cccc:::.",
			"  .,,,,,           ,:::ccccc;  ",
			"    ''''            ';;cccc    ",
			"     .''             .;cc'     ",
			"       .              .:       ",
			"",
			"",
			"",
			"",
			"      You know what to do.     ",
		}

		local height = vim.api.nvim_win_get_height(0)
		local width = vim.api.nvim_win_get_width(0)

		local padding_left = math.floor((width - vim.fn.strdisplaywidth(welcome_message[1])) / 2)
		for i in ipairs(welcome_message) do
			welcome_message[i] = string.rep(" ", padding_left) .. welcome_message[i]
		end

		local padding_top = math.floor((height - #welcome_message) / 2)
		for _ = 1, padding_top do
			table.insert(welcome_message, 1, "")
		end

		vim.api.nvim_buf_set_lines(0, 0, -1, false,
			welcome_message
		)

		-- Make sure to restore them later.
		vim.api.nvim_create_autocmd("BufReadPost", {
			once = true,
			callback = function()
				vim.api.nvim_win_set_hl_ns(0, 0)
				vim.api.nvim_set_option_value('colorcolumn', u_ccolumn, {})
				vim.api.nvim_set_option_value('number', u_number, {})
				vim.api.nvim_set_option_value('relativenumber', u_relnumber, {})
			end
		})
	end
	--]]
	if splash then
		vim.cmd ":winc h"
	end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = startup })
