--[[

  ┏┓╻┏━┓┏┓╻┏━┓   ┏┓╻╻ ╻╻┏┳┓
  ┃┗┫┣━┫┃┗┫┃ ┃╺━╸┃┗┫┃┏┛┃┃┃┃
  ╹ ╹╹ ╹╹ ╹┗━┛   ╹ ╹┗┛ ╹╹ ╹

            An
          almost
        minimalist
       configuration
     for neovim editor.

Using the Lazy package manager.
Installing only the plugins I need.

--]]

require "config.options"
require "config.lazy"
require "config.keymaps"
require "config.icons"
require "config.startup"
require "config.au"
require "nano.smooth".setup()
require "nano.terminal".setup()
