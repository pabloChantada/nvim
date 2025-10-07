-- Transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )


-- Kanagawa theme
return {
  "rebelot/kanagawa.nvim",
  priority = 1000,  
  config = function()
    require('kanagawa').setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors)
      local theme = colors.theme
      return {
	NormalFloat = { bg = "none" },
	FloatBorder = { bg = "none" },
	FloatTitle = { bg = "none" },

	-- Save an hlgroup with dark background and dimmed foreground
	-- so that you can use it where your still want darker windows.
	-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
	NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

	-- Popular plugins that open floats will link to NormalFloat by default;
	-- set their background accordingly if you wish to keep them dark and borderless
	LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	}
	end,
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus"
      },
    })
    
    -- Aplicar el colorscheme
    vim.cmd("colorscheme kanagawa")


    -- Sincronizar con Kitty
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "kanagawa",
      callback = function()
        if vim.o.background == "light" then
          vim.fn.system("kitty +kitten themes Kanagawa_light")
        elseif vim.o.background == "dark" then
          vim.fn.system("kitty +kitten themes Kanagawa_dragon")
        else
          vim.fn.system("kitty +kitten themes Kanagawa")
        end
      end,
    })
  end,
}
