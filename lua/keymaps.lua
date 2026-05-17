vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize windows
map("n", "<C-Up>",    ":resize +2<CR>")
map("n", "<C-Down>",  ":resize -2<CR>")
map("n", "<C-Left>",  ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Buffer navigation
map("n", "<S-h>",      ":bprevious<CR>")
map("n", "<S-l>",      ":bnext<CR>")
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Keep indent selection after shifting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- Quick save/quit
map("n", "<leader>w", ":w<CR>",  { desc = "Save" })
map("n", "<leader>q", ":q<CR>",  { desc = "Quit" })

