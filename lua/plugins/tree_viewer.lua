return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Custom on_attach function
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)
      
      -- Custom mappings
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      -- vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
      -- vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    end    -- Plugin setup
    require("nvim-tree").setup {
      on_attach = my_on_attach,
      filters = {
        dotfiles = false,  -- Show hidden files (dotfiles)
      },
    }
  end,
}
