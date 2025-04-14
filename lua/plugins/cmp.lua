return {
	"hrsh7th/nvim-cmp",
	-- load cmp on InsertEnter
	event = "InsertEnter",
	-- these dependencies will only be loaded when cmp loads
	-- dependencies are always lazy-loaded unless specified otherwise
	dependencies = {
		'neovim/nvim-lspconfig',
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'hrsh7th/cmp-nvim-lsp-signature-help',
	},
	-- >>> Added for lazydev.
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
	-- <<< Added for lazydev. [end]
	config = function()
		local cmp = require 'cmp'

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn['vsnip#anonymous'](args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'buffer' },
				{ name = 'vsnip' },
				{ name = 'path',                   options = { trailing_slash = true } },
			}),
		})

		-- cmp.setup.cmdline({ '/', '?' }, {
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = cmp.config.sources({
		-- 		{ name = 'path' }
		-- 	}, {
		-- 		{ name = 'cmdline' },
		-- 	}),
		-- 	matching = { disallow_symbold_nonprefix_matching = false }
		-- })
	end,
}
