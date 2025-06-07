return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		require "dashboard".setup {
			theme = 'doom',
			hide = {
				statusline = false,
			},
			config = {
				header = {
					"",
					"",
					"",
					"",
					"        N  e  o  V  i  m       ",
					"",
					"",
					"",
					--[[
					-- TODO: Can we colorise this logo?
					-- TODO: Use legacy drawing chars.
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
					--]]
					' ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ ',
					' ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ ',
					' ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ ',
					' ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ ',
					' ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ ',
					' ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ ',
					' ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ ',
					' ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ ',
					' ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ ',
					' ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
					' ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ ',
					' ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ ',
					' ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ ',
					' ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ ',
					"",
					"",
					"",
					"",
				},
				center = {
					{
						icon = "󰈤   ",
						desc = "Open file            ",
						key = 'f',
						key_format = ' [%s]',
						action = 'Telescope find_files',

					},
					{
						icon = "󰈤   ",
						desc = "New file             ",
						key = 'n',
						key_format = ' [%s]',
						action = 'new +only',

					},
					{
						icon = "   ",
						desc = "Live grep            ",
						key = 'g',
						key_format = ' [%s]',
						action = 'Telescope live_grep',

					},
					{
						icon = "󰉖   ",
						desc = "Tree                 ",
						key = 't',
						key_format = ' [%s]',
						action = 'NvimTreeToggle',

					},
					{
						icon = "󰉖   ",
						desc = "Oil                  ",
						key = 'o',
						key_format = ' [%s]',
						action = 'Oil',

					},
					{
						icon = "   ",
						desc = "Lazy                  ",
						key = 'l',
						key_format = ' [%s]',
						action = 'Lazy',

					},
					{
						icon = "   ",
						desc = "Quit                 ",
						key = "q",
						key_format = ' [%s]',
						action = 'qa!',
					},
					{
						icon = "   ",
						desc = "Help                 ",
						key = "?",
						key_format = ' [%s]',
						action = 'vert :h',
					},
					{
						-- Spacer
						desc = "",
					},
					{
						desc = "",
					},
				},
				footer = function()
					local stats = require "lazy".stats()
					local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
					return { "🌸 Neovim loaded " .. stats.loaded .. " / " .. stats.count .. " plugins in " .. ms .. "ms ⛩ " }
				end,
				vertical_center = false,
			}
		}
	end
}
