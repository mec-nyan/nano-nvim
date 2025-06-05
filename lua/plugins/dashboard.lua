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
					"        N  e  o  V  i  m       ",
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
				},
				center = {
					{
						icon = "󰈤 ",
						-- icon_hl = "group",
						desc = "Open file",
						-- desc_hl = 'group',
						key = 'f',
						-- key_hl = 'group',
						key_format = ' [%s]',
						action = 'Telescope find_files',

					},
					{
						icon = " ",
						desc = "Quit",
						key = "q",
						key_format = ' [%s]',
						action = 'qa',
					}
				},
				footer = { 'a footer' },
			}
		}
	end
}
