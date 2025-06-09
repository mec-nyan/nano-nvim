return {
	---[[
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
		local my_kind = require "config.kind".MyKind

		local feedkey = function(key, mode)
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
		end

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			view = {
				entries = "custom",
				docs = {
					auto_open = false,
				},
			},
			snippet = {
				expand = function(args)
					vim.fn['vsnip#anonymous'](args.body)
				end,
			},
			window = {
				completion = {
					border = "solid",
					winhighlight = 'FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
					scrollbar = true,
					col_offset = -1,
					winblend = 20,
					side_padding = 2,
				},
				documentation = {
					-- border = { "╭", "━", "╮", "┃", "╯", "━", "╰", "┃" },
					border = "solid",
					max_width = 60,
					winhighlight = 'FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
					scrollbar = true,
					zindex = 1001,
					winblend = 20,
				}
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-k>'] = cmp.mapping(function(fallback)
					if cmp.visible_docs() then
						cmp.close_docs()
					elseif cmp.visible() then
						cmp.open_docs()
					else
						fallback()
					end
				end),
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#available"](1) == 1 then
						feedkey("<Plug>(vsnip-expand-or-jump)", "")
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				['S-<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn["vsnip#available"](-1) == 1 then
						feedkey("<Plug>(vsnip-jump-prev)", "")
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'buffer' },
				{ name = 'vsnip' },
				{ name = 'path',                   options = { trailing_slash = true } },
			}),
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = my_kind[vim_item.kind] or vim_item.kind
					vim_item.menu = ({
						buffer = "buf",
						nvim_lsp = "lsp",
						path = "/",
						vsnip = "snp",
						nvim_lsp_signature_help = "sig",
					})[entry.source.name]
					return vim_item
				end
			}
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
	--]]
}
