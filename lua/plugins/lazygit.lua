return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Keymap principal
    vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })
    vim.keymap.set("n", "<leader>gc", ":LazyGitConfig<CR>", { desc = "LazyGit Config" })
    vim.keymap.set("n", "<leader>gf", ":LazyGitFilter<CR>", { desc = "LazyGit Filter" })
    vim.keymap.set("n", "<leader>gl", ":LazyGitFilterCurrentFile<CR>", { desc = "LazyGit Current File" })
    
    -- Configuración de ventana flotante
    vim.g.lazygit_floating_window_winblend = 0  -- Transparencia (0-100)
    vim.g.lazygit_floating_window_scaling_factor = 0.9  -- Tamaño de ventana (0.0-1.0)
    vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'}
    vim.g.lazygit_floating_window_use_plenary = 0
    vim.g.lazygit_use_neovim_remote = 1
  end,
}
