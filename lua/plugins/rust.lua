-- NOTA: Agregar 'saecki/crates.nvim' a las sources de cmp.lua:
-- En tu cmp.lua, añade esto a las sources:
-- { name = "crates" },

return {
  -- Rustaceanvim: Plugin todo-en-uno para Rust
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        -- LSP configuration
        server = {
          -- on_attach = function(client, bufnr)
          --   -- Keymaps específicos de Rust
          --   local opts = { buffer = bufnr }
          --   vim.keymap.set("n", "<leader>ca", function()
          --     vim.cmd.RustLsp('codeAction')
          --   end, opts)
          --   vim.keymap.set("n", "<leader>dr", function()
          --     vim.cmd.RustLsp('debuggables')
          --   end, opts)
          --   vim.keymap.set("n", "<leader>rr", function()
          --     vim.cmd.RustLsp('runnables')
          --   end, opts)
          -- end,
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
              checkOnSave = {
                command = "clippy",
                allFeatures = true,
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
              -- Inlay hints
              inlayHints = {
                bindingModeHints = {
                  enable = false,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  enable = true,
                  minLines = 25,
                },
                closureReturnTypeHints = {
                  enable = "never",
                },
                lifetimeElisionHints = {
                  enable = "never",
                  useParameterNames = false,
                },
                maxLength = 25,
                parameterHints = {
                  enable = true,
                },
                reborrowHints = {
                  enable = "never",
                },
                renderColons = true,
                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false,
                },
              },
            },
          },
        },
        -- DAP configuration
        dap = {
          adapter = {
            type = 'executable',
            command = 'lldb-dap',
            name = 'rt_lldb',
          },
        },
      }
    end,
  },

  -- Crates.nvim: Gestión de dependencias de Cargo.toml
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup({
        completion = {
          cmp = {
            enabled = true,
          },
        },
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
      })
      
      -- Keymaps para crates
      vim.api.nvim_create_autocmd("BufRead", {
        pattern = "Cargo.toml",
        callback = function()
          local opts = { silent = true, buffer = true }
          vim.keymap.set("n", "<leader>ct", require('crates').toggle, opts)
          vim.keymap.set("n", "<leader>cr", require('crates').reload, opts)
          vim.keymap.set("n", "<leader>cv", require('crates').show_versions_popup, opts)
          vim.keymap.set("n", "<leader>cf", require('crates').show_features_popup, opts)
          vim.keymap.set("n", "<leader>cd", require('crates').show_dependencies_popup, opts)
          vim.keymap.set("n", "<leader>cu", require('crates').update_crate, opts)
          vim.keymap.set("v", "<leader>cu", require('crates').update_crates, opts)
          vim.keymap.set("n", "<leader>ca", require('crates').update_all_crates, opts)
          vim.keymap.set("n", "<leader>cU", require('crates').upgrade_crate, opts)
          vim.keymap.set("v", "<leader>cU", require('crates').upgrade_crates, opts)
          vim.keymap.set("n", "<leader>cA", require('crates').upgrade_all_crates, opts)
        end,
      })
    end,
  },
}
