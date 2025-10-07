return {
  "mbbill/undotree",
  config = function()
    -- Keymap para abrir undotree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    
    -- Configuración opcional
    vim.g.undotree_WindowLayout = 2  -- Layout del panel
    vim.g.undotree_SetFocusWhenToggle = 1  -- Hacer foco al abrir
  end,
}
