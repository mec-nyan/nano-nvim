# Nano-nvim

Another nvim configuration :cherry_blossom:

## Purpose

After trying out some **Vim/Neovim** distros like **LazyVim**, I really like the "out of the box"
experience. Yet they've got _too many stuff_ that I need to configure or I simply don't use. That's
why I decided to make my own "minimal" distro (actually it's more a big config but you get the idea).

At first I was trying to use only a minimal set of plugins, and no more. I like that. But then I discover
a nice idea (it's not mine): To use only the stuff you need, _but no less_. I guess that's a slightly
different yet hugely beneficial approach.

In a nutshell, this repo aims to:

- Provide a small configuration.
- Add only the plugins needed.

That includes:

- LSP
- Completion
- Keybindings
- Colorscheme
- Debugger

Optional:

- Status line
- File browser (netrw is really cool actually!)
- Finder (i.e. Telescope) (first try native grep)
- Context (breadcrumbs)
- Git integration

## Plugins

- Plugin manager:
    - Lazy ("folke/lazy.nvim")
- Turn comments into headers:
    - Frame-it ("mec-nyan/frame-it")
- Neovim development/configuration:
    - Lazydev ("folke/lazydev.nvim")
- Mappings:
    - Whichkey ("folke/which-key.nvim")
- LSP/completion/diagnostics:
    - Lspconfig ("neovim/nvim-lspconfig")
    - Blink.cmp (or nvim-cmp) ("saghen/blink.cmp" or "hrsh7th/nvim-cmp")
    - Trouble ("folke/trouble.nvim")
- Git:
    - Gitsigns ("lewis6991/gitsigns.nvim")
    - Neogit ("NeogitOrg/neogit")
- Linters:
    - Nvim-lint ("mfussenegger/nvim-lint")
- Debuggin:
    - Nvim-dap (plus nvim-dap-ui) ("mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui")
- Find stuff:
    - Telescope ("nvim-telescope/telescope.nvim")
    - Nvim-tree ("nvim-tree/nvim-tree.lua")
- Statusline/context:
    - Lualine ("nvim-lualine/lualine.nvim")
    - Dropbar ("Bekaboo/dropbar.nvim")
- Colorschemes:
    - Tokyonight ("folke/tokyonight.nvim")
- Distraction free mode:
    - Zen-mode ("folke/zen-mode.nvim")
- Utils:
    - Treesitter ("nvim-treesitter/nvim-treesitter")
    - Autopair ("swindwp/nvim-autopairs")

## Mappings

TODO


