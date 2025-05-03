return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = {
			preset = "enter",
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = true,
			},
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function (ctx)
								local my_kind = require"config.kind".MyKind
								return " " .. my_kind[ctx.kind] .. ctx.icon_gap .. " "
							end
						},
					},
					columns = {
						{ "kind_icon",  gap = 1 },
						{ "label" },
						{ "source_name" },
					},
				},
			},
		},
		sources = {
			default = {
				"lsp",
				"path",
				"buffer",
			},
		},
		fuzzy = {
			implementation = "lua",
		},
	},
	opts_extend = {
		"sources.default",
	}
}
