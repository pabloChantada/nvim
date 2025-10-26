return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Define tu función personalizada para on_attach
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- Mapeos por defecto
      api.config.mappings.default_on_attach(bufnr)
      -- Tus mapeos personalizados
      vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Subir un nivel'))
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Ayuda'))
    end
    -- Configuración del plugin
    require("nvim-tree").setup {
      on_attach = my_on_attach,
      filters = {
        dotfiles = false,  -- Muestra archivos ocultos (los que empiezan con punto)
      },
    }
  end,
}
