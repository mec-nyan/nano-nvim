return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup {
			-- I removed 'cpp' due to some tar issues. I'll added again later.
			ensure_installed = { 'c', 'go', 'lua', 'python', 'rust', 'javascript', 'vimdoc',
				'vim', 'json', 'html', 'tsx', },
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
					keymaps = {
						init_selection = '<C-space>',
						node_incremental = 'C-space>',
						scope_incremental = '<C-s>',
						node_decremental = '<M-space>',
					},
				},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						['aa'] = '@parameter.outer',
						['ia'] = '@parameter.inner',
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						[']m'] = '@function.outer',
						[']]'] = '@class.outer',
					},
					goto_next_end = {
						[']M'] = '@function.outer',
						[']['] = '@class.outer',
					},
					goto_previous_start = {
						['[m'] = '@function.outer',
						['[['] = '@class.outer',
					},
					goto_previous_end = {
						['[M'] = '@function.outer',
						['[]'] = '@class.outer',
					}
				}
			}
		}
	end
}
