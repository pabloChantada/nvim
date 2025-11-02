return {
  -- Mason: gestor de LSP servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-lspconfig: puente entre mason y lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "ruff",
          "html",
          "cssls",
          "jsonls",
          -- "rust_analyzer"
        },
        automatic_installation = true,
      })
    end,
  },

  -- Configuración LSP con API nativa de Neovim
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configurar Lua LS
      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
          },
        },
      })

      -- Configurar TypeScript/JavaScript
      vim.lsp.config("ts_ls", {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
        capabilities = capabilities,
      })

      -- Configurar Python
      vim.lsp.config("pyright", {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
        capabilities = capabilities,
      })

      -- Configurar HTML
      vim.lsp.config("html", {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
      })

      -- Configurar CSS
      vim.lsp.config("cssls", {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
      })

      -- Configurar JSON
      vim.lsp.config("jsonls", {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
      })


      -- Habilitar LSP automáticamente
      vim.lsp.enable({ "lua_ls", "ts_ls", "pyright", "html", "cssls", "jsonls" })

      -- Keymaps para LSP
          
        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function(ev)
            local bufnr = ev.buf
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            local opts = { buffer = bufnr, silent = true }

            -- Keymaps universales
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>vws", vim.diagnostic.open_float, opts) -- Cambiado a vws
            vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)  -- Mantenido
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            
            vim.keymap.set("n", "<leader>oi", function()
                  vim.lsp.buf.code_action({
                    context = { only = { "source.organizeImports" } },
                    apply = true,
                  })
                end, vim.tbl_extend("force", opts, { desc = "Organize Imports" }))

            -- === Keymaps específicos de Rust (solo si es rustaceanvim) ===
            if client.name == "rust_analyzer" then
              vim.keymap.set("n", "<leader>ca", function()
                vim.cmd.RustLsp('codeAction')
              end, opts)
              vim.keymap.set("n", "<leader>dr", function()
                vim.cmd.RustLsp('debuggables')
              end, opts)
              vim.keymap.set("n", "<leader>rr", function()
                vim.cmd.RustLsp('runnables')
              end, opts)
            end

            -- === Keymaps específicos de Python (opcional) ===
            if client.name == "pyright" or client.name == "ruff" then
              vim.keymap.set("n", "<leader>oi", function()
                vim.lsp.buf.code_action({
                  context = { only = { "source.organizeImports" } },
                  apply = true,
                })
              end, opts)
            end
          end,
        })

    end,
  },
}
