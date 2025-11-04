-- Autocomplete mejorado

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",       -- LSP source
    "hrsh7th/cmp-buffer",         -- Buffer source
    "hrsh7th/cmp-path",           -- Path source
    "hrsh7th/cmp-cmdline",        -- Commandline source (NUEVO)
    "L3MON4D3/LuaSnip",           -- Snippets engine
    "saadparwaiz1/cmp_luasnip",   -- Snippet source
    "rafamadriz/friendly-snippets", -- Colección de snippets (NUEVO)
    "onsails/lspkind.nvim",       -- Iconos bonitos en el menú (NUEVO)
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Cargar snippets de friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Ventana de completado con bordes
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      -- Formateo con iconos
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',  -- Mostrar icono + texto
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(entry, vim_item)
            -- Mostrar el origen de la sugerencia
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              crates = "[Crates]",
            })[entry.source.name]
            return vim_item
          end,
        }),
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        
        -- Tab para navegar y expandir snippets
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "copilot" , priority = 800 },
        { name = "luasnip", priority = 750 },
        { name = "crates", priority = 800 },  -- Para Rust
      }, {
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }),

      -- Comportamiento de selección
      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      -- Experimental: ghost text (muestra sugerencia en gris)
      experimental = {
        ghost_text = true,
      },
    })

    -- Autocompletado en la línea de comandos
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}
