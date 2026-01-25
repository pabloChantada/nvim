return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Cargar al abrir archivos
  config = function()
    local conform = require("conform")

    conform.setup({
      -- 1. Definimos tus formateadores (ESTO MANDA)
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" }, -- Soporte React
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        python = { "black" }, -- Aquí forzamos black en lugar de ruff
        cpp = { "clang-format" },
        c = { "clang-format" },
        markdown = { "prettierd" },
        json = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
      },

      -- 2. Configuración de guardado automático
      format_on_save = {
        timeout_ms = 3000, -- 3 segundos
        lsp_fallback = true,
      },

      -- 3. Personalización de herramientas
      formatters = {
        prettierd = {
          prepend_args = { "--no-semi", "--single-quote" },
        },
        ["clang-format"] = {
          prepend_args = { "--style=Google" },
        },
      },
    })
  end,
}
