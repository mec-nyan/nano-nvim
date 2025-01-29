local cap = require "cmp_nvim_lsp".default_capabilities()

require "lspconfig".lua_ls.setup{
	capabilities = cap
}

require "lspconfig".gopls.setup{
	capabilities = cap
}

require "lspconfig".rust_analyzer.setup{
	capabilities = cap
}

require "lspconfig".clangd.setup{
	capabilities = cap
}

require "lspconfig".pylsp.setup{
	capabilities = cap
}
