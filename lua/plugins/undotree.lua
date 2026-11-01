return {
  "mbbill/undotree",
  config = function()
    -- Keymap to open undotree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    
    -- Optional settings
    vim.g.undotree_WindowLayout = 2  -- Panel layout
    vim.g.undotree_SetFocusWhenToggle = 1  -- Focus when opened
  end,
}
