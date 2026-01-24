-- Copilot
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",  -- For latest features
  dependencies = {
    { "zbirenbaum/copilot.lua" },  -- Base Copilot (or github/copilot.vim)
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },  -- Optional for actions
  },
  opts = {
    window = { layout = "float" },  -- Or "vsplit"
    auto_follow_cursor = false,
  },
  keys = {
    { "<leader>cc", ":CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
    { "<leader>cce", ":CopilotChatExplain<CR>", desc = "Explain code" },
    { "<leader>ccf", ":CopilotChatFix<CR>", desc = "Fix code" },
  },
}

