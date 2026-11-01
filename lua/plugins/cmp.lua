-- Enhanced autocomplete

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",       -- LSP source
    "hrsh7th/cmp-buffer",         -- Buffer source
    "hrsh7th/cmp-path",           -- Path source
    "hrsh7th/cmp-cmdline",        -- Commandline source (NEW)
    "L3MON4D3/LuaSnip",           -- Snippets engine
    "saadparwaiz1/cmp_luasnip",   -- Snippet source
    "rafamadriz/friendly-snippets", -- Snippet collection (NEW)
    "onsails/lspkind.nvim",       -- Pretty icons in the menu (NEW)
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Load snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Bordered completion window
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      -- Formatting with icons
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',  -- Show icon + text
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(entry, vim_item)
            -- Show the suggestion source
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
        
        -- Tab to navigate and expand snippets
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
        { name = "crates", priority = 800 },  -- For Rust
      }, {
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }),

      -- Selection behavior
      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      -- Experimental: ghost text (shows suggestion in gray)
      experimental = {
        ghost_text = true,
      },
    })

    -- Command-line autocomplete
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
