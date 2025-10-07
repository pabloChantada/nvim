return {
  "3rd/image.nvim",
  lazy = true,
  event = "VeryLazy", -- o "BufRead", si prefieres activarlo al abrir archivos
  config = function()
    require("image").setup {
      backend = "kitty", -- o "ueberzug" si usas otro terminal compatible
      integrations = {
        markdown = {
          enabled = true,
        },
        neorg = {
          enabled = true,
        },
      },
      max_width = nil,
      max_height = nil,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    }
  end,
}

