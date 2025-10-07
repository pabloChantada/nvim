-- NUMBER LINES
vim.opt.nu = true
vim.opt.relativenumber = true

-- TABS
vim.opt.tabstop = 4 -- Spaces in tabs
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UNDO HISTORY
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- SEARCHES
vim.opt.hlsearch = false
vim.opt.incsearch = true -- Incremental search for complex terms

-- COLORS
vim.opt.termguicolors = true

-- Cargar el esquema y luego aplica transparencia
vim.cmd([[colorscheme kanagawa]])

-- Activar transparencia
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi StatusLineNC guibg=NONE ctermbg=NONE
]])


-- SCROLL
vim.opt.scrolloff = 8 -- Never less than 8 char under the line


