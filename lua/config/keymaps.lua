local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
-- File explorer
keymap("n", "<leader>pv", ":Ex<CR>", opts)

-- Close current buffer with leader + q
keymap("n", "<leader>bc", ":bd<CR>", opts)

-- Search word under cursor with leader + f
keymap("n", "<leader>fw", "*", opts)

-- Replace word under cursor (with confirmation) with leader + r
keymap("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- Tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ç", "<cmd>:Telescope keymaps<CR>", opts)
-- SHIFT + H -> Hidden files
-- SHIFT + I -> Hidden .gitignore

-- Change splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move splits (was Alt+hjkl, which GlazeWM captures system-wide)
keymap("n", "<leader>wh", "<C-w>H", opts)
keymap("n", "<leader>wj", "<C-w>J", opts)
keymap("n", "<leader>wk", "<C-w>K", opts)
keymap("n", "<leader>wl", "<C-w>L", opts)

-- Resize splits
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
