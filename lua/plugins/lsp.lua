return {
  -- Mason: LSP server manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-lspconfig: bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "html",
          "cssls",
          "jsonls",
          -- "rust_analyzer"
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSP config using Neovim's native API
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configure Lua LS
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

      -- Configure TypeScript/JavaScript
      vim.lsp.config("ts_ls", {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
        capabilities = capabilities,
      })

      -- Configure Python
      vim.lsp.config("pyright", {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
        capabilities = capabilities,
      })

      -- Configure HTML
      vim.lsp.config("html", {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
      })

      -- Configure CSS
      vim.lsp.config("cssls", {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
      })

      -- Configure JSON
      vim.lsp.config("jsonls", {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
      })


      -- Enable LSP automatically
      -- vim.lsp.enable({ "lua_ls", "ts_ls", "pyright", "html", "cssls", "jsonls" })

      -- LSP keymaps
          
        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function(ev)
            local bufnr = ev.buf
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            local opts = { buffer = bufnr, silent = true }

            -- Universal keymaps
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>vws", vim.diagnostic.open_float, opts) -- Changed to vws
            vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)  -- Kept
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

            -- === Rust-specific keymaps (only with rustaceanvim) ===
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

            -- === Python-specific keymaps (optional) ===
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
