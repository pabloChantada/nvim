
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
