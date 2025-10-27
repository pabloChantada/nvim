return {
  -- Pyright: LSP server para Python (ya configurado en lsp.lua pero con mejoras aquí)
  {
    "neovim/nvim-lspconfig",
    ft = { "python" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- Configuración avanzada de Pyright
      vim.lsp.config("pyright", {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { 
          "pyproject.toml", 
          "setup.py", 
          "setup.cfg", 
          "requirements.txt", 
          "Pipfile", 
          "pyrightconfig.json",
          ".git" 
        },
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
              typeCheckingMode = "basic", -- "off", "basic", "strict"
              autoImportCompletions = true,
              diagnosticSeverityOverrides = {
                reportUnusedImport = "warning",
                reportUnusedVariable = "warning",
              },
            },
          },
        },
      })
    end,
  },

  -- Ruff: Linter y formatter ultra-rápido para Python
  {
    "neovim/nvim-lspconfig",
    ft = { "python" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      vim.lsp.config("ruff", {
        cmd = { "ruff", "server" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
        capabilities = capabilities,
        init_options = {
          settings = {
            -- Configuración de Ruff
            lint = {
              enable = true,
              select = { "E", "F", "W", "I", "N" },
            },
            format = {
              preview = false,
            },
          },
        },
      })
      
      -- Habilitar Ruff LSP
      vim.lsp.enable({ "ruff" })
    end,
  },

  -- Conform.nvim: Formateo automático
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    ft = { "python" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "ruff_format", "ruff_fix" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
      
      -- Keymap para formatear manualmente
      vim.keymap.set("n", "<leader>f", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format buffer" })
    end,
  },

  -- nvim-lint: Linting adicional con herramientas específicas
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "python" },
    config = function()
      local lint = require("lint")
      
      lint.linters_by_ft = {
        python = { "ruff" }, -- También puedes usar: "mypy", "pylint"
      }
      
      -- Auto-lint al guardar y entrar al buffer
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        pattern = { "*.py" },
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- Venv-selector: Selector de entornos virtuales
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
    },
    ft = "python",
    config = function()
      require("venv-selector").setup({
        settings = {
          search = {
            my_venvs = {
              command = "fd python$ ~/.virtualenvs --full-path --color never",
            },
          },
        },
      })
      
      -- Keymap para seleccionar venv
      vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select VirtualEnv" })
      vim.keymap.set("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { desc = "Select Cached VirtualEnv" })
    end,
  },

  -- nvim-dap-python: Debugger para Python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      -- Configurar debugpy (requiere: pip install debugpy)
      require("dap-python").setup("python") -- Usa el python del PATH o especifica ruta
      
      -- Keymaps para debugging
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          local opts = { silent = true, buffer = true }
          vim.keymap.set("n", "<leader>dn", require("dap-python").test_method, opts)
          vim.keymap.set("n", "<leader>df", require("dap-python").test_class, opts)
          vim.keymap.set("v", "<leader>ds", require("dap-python").debug_selection, opts)
        end,
      })
    end,
  },

  -- DAP UI: Interfaz visual para debugging
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    ft = "python",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      
      dapui.setup()
      
      -- Abrir/cerrar UI automáticamente
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      
      -- Keymaps para DAP
      vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", require("dap").continue, { desc = "Continue" })
      vim.keymap.set("n", "<leader>di", require("dap").step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>do", require("dap").step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>dO", require("dap").step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dr", require("dap").repl.toggle, { desc = "Toggle REPL" })
      vim.keymap.set("n", "<leader>dl", require("dap").run_last, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "Toggle DAP UI" })
      vim.keymap.set("n", "<leader>dt", require("dap").terminate, { desc = "Terminate" })
    end,
  },

  -- Neotest: Framework de testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    ft = "python",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest", -- o "unittest"
            python = "python",
          }),
        },
      })
      
      -- Keymaps para testing
      vim.keymap.set("n", "<leader>tt", function()
        require("neotest").run.run()
      end, { desc = "Run nearest test" })
      
      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Run current file" })
      
      vim.keymap.set("n", "<leader>td", function()
        require("neotest").run.run({ strategy = "dap" })
      end, { desc = "Debug nearest test" })
      
      vim.keymap.set("n", "<leader>ts", function()
        require("neotest").summary.toggle()
      end, { desc = "Toggle test summary" })
      
      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open({ enter = true })
      end, { desc = "Show test output" })
    end,
  },

  -- Keymaps adicionales específicos de Python
  {
    "neovim/nvim-lspconfig",
    ft = "python",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          local opts = { silent = true, buffer = true }
          
          -- Organizar imports
          vim.keymap.set("n", "<leader>oi", function()
            vim.lsp.buf.code_action({
              context = { only = { "source.organizeImports" } },
              apply = true,
            })
          end, opts)
          
          -- Ejecutar archivo Python actual
          vim.keymap.set("n", "<leader>rp", ":!python %<CR>", opts)
        end,
      })
    end,
  },
}
