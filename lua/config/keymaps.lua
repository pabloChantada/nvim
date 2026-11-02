vim.g.mapleader = " "

-- Every mapping has a desc so which-key shows a readable label
local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Files
map("n", "<leader>pv", "<cmd>Ex<CR>", "File explorer (netrw)")
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", "Toggle file tree")
-- In NvimTree: Shift+H -> hidden files, Shift+I -> .gitignored files

-- Buffers
map("n", "<leader>bc", "<cmd>bd<CR>", "Close buffer")

-- Search / replace
map("n", "<leader>fw", "*", "Find word under cursor")
map("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace word under cursor")
map("n", "<leader>ç", "<cmd>Telescope keymaps<CR>", "Search keymaps")

-- Move between splits
map("n", "<C-h>", "<C-w>h", "Go to left split")
map("n", "<C-j>", "<C-w>j", "Go to lower split")
map("n", "<C-k>", "<C-w>k", "Go to upper split")
map("n", "<C-l>", "<C-w>l", "Go to right split")

-- Move splits (was Alt+hjkl, which GlazeWM captures system-wide)
map("n", "<leader>wh", "<C-w>H", "Move split left")
map("n", "<leader>wj", "<C-w>J", "Move split down")
map("n", "<leader>wk", "<C-w>K", "Move split up")
map("n", "<leader>wl", "<C-w>L", "Move split right")

-- Resize splits
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", "Narrow split")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", "Widen split")
map("n", "<C-Up>", "<cmd>resize -2<CR>", "Shorten split")
map("n", "<C-Down>", "<cmd>resize +2<CR>", "Heighten split")
