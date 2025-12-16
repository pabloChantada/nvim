
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
-- File explorer
keymap('n', '<leader>pv', ':Ex<CR>', opts)

-- Cerrar buffer actual con leader + q
keymap('n', '<leader>bc', ':bd<CR>', opts)

-- Buscar palabra bajo cursor con leader + f
keymap('n', '<leader>fw', '*', opts)

-- Remplazar palabra bajo cursor con confirmación con leader + r
keymap('n', '<leader>r', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', opts)

-- Tree 
keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)
keymap('n', '<leader>ç', '<cmd>:Telescope keymaps<CR>', opts)
-- SHIFT + H -> Hidden files
-- SHIFT + I -> Hidden .gitignore


-- Change splits
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<A-h>', '<C-w>H', opts)
keymap('n', '<A-j>', '<C-w>J', opts)
keymap('n', '<A-k>', '<C-w>K', opts)
keymap('n', '<A-l>', '<C-w>L', opts)
