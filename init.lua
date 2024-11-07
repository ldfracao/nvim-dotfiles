--[[
    :help mapleader
--]]

-- set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

require 'options'
require 'lsp'
require 'keymaps'
require 'autocommands'
--require('colorscheme').setup()
require 'diagnostics'
require 'lsprobe'
