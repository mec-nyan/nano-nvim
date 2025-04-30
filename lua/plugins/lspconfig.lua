return {
	"neovim/nvim-lspconfig",
	config = function()
		local cap = require "cmp_nvim_lsp".default_capabilities()
		local on_attach = function(client, bufnr)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end
		end


		require "lspconfig".lua_ls.setup {
			capabilities = cap,
			settings = {
				Lua = {
					hint = {
						enable = true,
						setType = true,
						paramType = true,
					}
				}
			},
			on_attach = on_attach,
		}


		require "lspconfig".gopls.setup {
			capabilities = cap,
			settings = {
				gopls = {
					hints = {
						assignVarialbeTypes = true,
						compsiteLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					}
				}
			},
			on_attach = on_attach,
		}

		require "lspconfig".rust_analyzer.setup {
			capabilities = cap,
			settings = {
				["rust-analyzer"] = {
					inlayHints = {
						lifetimeElisionHints = {
							enable = true,
							useParameterNames = true,
						},
						bindingModeHints = {
							enable = true,
						},
						typeHints = {
							enable = true,
						},
						chainingHints = {
							enable = true,
						},
						closingBraceHints = {
							enable = true,
						},
						parameterHints = {
							enable = true,
						},
					},
				},
			},
			on_attach = on_attach,
		}

		require "lspconfig".clangd.setup {
			capabilities = cap,
			cmd = {
				"clangd",
				"--completion-style=detailed",
				"--inlay-hints",
				"--enable-config",
			},
			on_attach = on_attach,
		}

		require "lspconfig".pylsp.setup {
			capabilities = cap,
		}

	end
}
