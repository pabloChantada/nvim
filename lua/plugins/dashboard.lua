
return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        header = {
          "",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠿⠿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣷⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠒⠥⢢⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⣀⠀⢰⣦⡀⢢⣿⣷⣦⣀⡀⡀⠀⢠⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣷⣿⣷⣿⣿⣿⣿⣿⠟⠋⢀⡾⡀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠘⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣷⣄⡾⠆⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⡀⣿⣿⣿⣿⣟⢿⣿⣿⣿⣿⣿⣼⣿⣿⡿⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⡇⣿⣿⣿⣿⣿⣷⣦⣚⣯⣻⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠁⣌⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⢠⠀⠀⠀⠀⣿⡆⠨⡛⠿⣿⣿⣿⣿⠿⠛⠉⠀⠑⠀⠀⠀⠀⠀⠀⠲",
          "⠀⠀⠀⢀⣸⠀⠀⠀⠀⢿⡿⣆⠙⠀⠀⠉⠋⠁⠀⠀⠀⠠⠀⠀⠀⠠⠀⠀⣀⠀",
          "⠀⠀⠀⢰⣿⠀⠀⠀⠀⣶⣬⣭⣅⣰⠃⠀⠀⠀⠀⠀⠀⠀⠂⠁⠀⠀⠀⠀⠉⠁",
          "",
          " ___________.__                    _______                             .____    .__        ",
          " \\__    ___/|  |__   ____ ___.__.  \\      \\   _______  __ ___________  |    |   |__| ____  ",
          "   |    |   |  |  \\_/ __ <   |  |  /   |   \\_/ __ \\  \\/ // __ \\_  __ \\ |    |   |  |/ __ \\ ",
          "   |    |   |   Y  \\  ___/\\___  | /    |    \\  ___/\\   /\\  ___/|  | \\/ |    |___|  \\  ___/ ",
          "   |____|   |___|  /\\___  > ____| \\____|__  /\\___  >\\_/  \\___  >__|    |_______ \\__|\\___  >",
          "                 \\/     \\/\\/              \\/     \\/          \\/                \\/       \\/ ",
          "",
        },

        shortcut = {
          -- Iconos más grandes/vistosos de Nerd Font JetBrains Mono (o similares)
          { icon = "  ", desc = "Find File", group = "Label", key = "f", action = "Telescope find_files" },  -- lupa más grande
          { icon = "  " , desc = "Open Lazy", group = "Label", key = "u", action = "Lazy" },      -- actualización
          { icon = "  ", desc = "New File", group = "Label", key = "n", action = "enew" },                 -- nuevo archivo
          { icon = "  ", desc = "Config", group = "Label", key = "c", action = "edit ~/.config/nvim/init.lua" }, -- configuración
          { icon = "  ", desc = "Git Status", group = "Label", key = "g", action = "Telescope git_status" }, -- git
        },

        footer = {
          "",
          " .----..----..----.   .-.  .-..----. .-. .-.   .-..-. .-.    .----..----.  .--.   .---. .----.    .---.  .----. .-. . .-..----.  .----..-.  .-.",
          "{ {__  | {_  | {_      \\ \\/ //  {}  \\| { } |   | ||  `| |   { {__  | {}  }/ {} \\ /  ___}| {_     /  ___}/  {}  \\| |/ \\| || {}  }/  {}  \\\\ \\/ / ",
          ".-._} }| {__ | {__      }  { \\      /| {_} |   | || |\\  |   .-._} }| .--'/  /\\  \\\\     }| {__    \\     }\\      /|  .'.  || {}  }\\      / }  {  ",
          "`----' `----'`----'     `--'  `----' `-----'   `-'`-' `-'   `----' `-'   `-'  `-' `---' `----'    `---'  `----' `-'   `-'`----'  `----'  `--'  ",
          "",
        },
      },
    }

    -- Colores Kanagawa
    vim.cmd [[
      highlight DashboardHeader guifg=#c34043
      highlight DashboardFooter guifg=#c2a95f
      highlight DashboardShortcut guifg=#7fb4ca
    ]]
  end,
}


