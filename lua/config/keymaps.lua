
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
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Abrir/Cerrar NvimTree' })
vim.keymap.set('n', '<leader>ç', '<cmd>:Telescope keymaps<CR>', { desc = 'Abrir/Cerrar Keymaps'})
-- SHIFT + H -> Hidden files
-- SHIFT + I -> Hidden .gitignore


-- Change splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Ir al split izquierdo' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Ir al split inferior' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Ir al split superior' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Ir al split derecho' })

vim.keymap.set('n', '<A-h>', '<C-w>H', { desc = 'Mover split a la izquierda' })
vim.keymap.set('n', '<A-j>', '<C-w>J', { desc = 'Mover split abajo' })
vim.keymap.set('n', '<A-k>', '<C-w>K', { desc = 'Mover split arriba' })
vim.keymap.set('n', '<A-l>', '<C-w>L', { desc = 'Mover split a la derecha' })
