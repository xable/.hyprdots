vim.g.mapleader = " "

local map = require("core.utils").map

map("n", "<F2>", "<cmd>w<CR>")
map("n", "<F3>", "<cmd>wq<CR>")
map("n", "<leader>Q", "<cmd>qa<CR>")
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- hop.nvim
map("n", "<leader>hw", ":HopWord<CR>", options)
map("n", "<leader>hl", ":HopLine<CR>", options)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>", options)
map("n", "_", ":vertical resize -5<CR>", options)
map("n", "=", ":resize +5<CR>", options)
map("n", "-", ":resize -5<CR>", options)
