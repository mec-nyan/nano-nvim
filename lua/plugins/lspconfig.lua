return {
	"neovim/nvim-lspconfig",
	config = function()
		local cap = require "cmp_nvim_lsp".default_capabilities()

		require "lspconfig".lua_ls.setup {
			capabilities = cap,
			settings = {
				lua_ls = {
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
			on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end
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
			on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end
		}

		require "lspconfig".rust_analyzer.setup {
			capabilities = cap,
			settings = {
				rust_analyzer = {
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
			on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end
		}

		require "lspconfig".clangd.setup {
			capabilities = cap,
			cmd = {
				"clangd",
				"--enable-config",
			},
			settings = {
				clangd = {
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
			on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end
		}

		require "lspconfig".pylsp.setup {
			capabilities = cap,
			settings = {
				pylsp = {
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
			on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end
		}
	end
}
