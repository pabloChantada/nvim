return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Load when opening files
  config = function()
    local conform = require("conform")

    conform.setup({
      -- 1. Formatters by filetype (this takes precedence)
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" }, -- React support
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        python = { "ruff_organize_imports", "ruff_format" }, -- ruff: same formatter Claude Code uses
        cpp = { "clang-format" },
        c = { "clang-format" },
        markdown = { "prettierd" },
        json = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
      },

      -- 2. Format on save
      format_on_save = {
        timeout_ms = 3000, -- 3 seconds
        lsp_fallback = true,
      },

      -- 3. Formatter customization
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
