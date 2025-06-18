return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require "catppuccin".setup {
			flavour = "mocha",
			transparent_background = true,
			show_end_of_buffer = false,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 2,
			},
			no_bold = true,
		}

		vim.cmd.colorscheme "catppuccin"
	end
}
