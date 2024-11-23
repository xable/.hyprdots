local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local M = {}

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

options = { noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader><Right>', ':bnext<cr>', options)
map('n', '<leader><Left>', ':bprev<cr>', options)
map('n', '<leader>bc', ':BufferLinePickClose<cr>', options)
map('n', '<F2>', ':w<cr>', options)
map('n', '<F3>', ':wq<cr>', options)

-- hop.nvim
map('n', '<leader>hw', ':HopWord<CR>', options)
map('n', '<leader>hl', ':HopLine<CR>', options)

-- Panes resizing
map("n", '+', ':vertical resize +5<CR>', options)
map("n", '_', ':vertical resize -5<CR>', options)
map("n", '=', ':resize +5<CR>', options)
map('n', '-', ':resize -5<CR>', options)
