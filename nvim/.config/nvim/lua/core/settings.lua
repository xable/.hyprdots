-- Neovim API aliases
local u = require('core.utils')
local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Colorscheme
o.termguicolors = true

-- global options
o.autoindent = true
o.swapfile = true
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.dir = '/tmp'
o.cursorline = true
o.cul = true
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.syntax = 'on'
o.errorbells = false
o.ruler = false
o.hidden = true
o.showmode = false
-- ... snip ...

-- window-local options
wo.number = true
wo.wrap = false
wo.foldmethod = "manual"

-- buffer-local options
bo.expandtab = true
bo.smartindent = true
bo.shiftwidth = 2
