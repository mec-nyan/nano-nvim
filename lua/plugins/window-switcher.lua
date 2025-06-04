return {
	"mec-nyan/window-switcher",
	config = function ()
		require"window-switcher".setup{
			floats = {
				width = 9,
				height = 5,
				border = "shadow",
			},
		}
		local switch = require"window-switcher".pick_window
		vim.keymap.set("n", "<leader>ws", switch, { desc = "Nano::Window Switcher"})
	end
}
