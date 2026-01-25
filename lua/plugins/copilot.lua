return {
  -- Copilot BASE (requerido para Chat)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
        ["*"] = true,
      },
    },
  },

  -- CopilotChat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      window = { layout = "float" },
      auto_follow_cursor = false,
      show_help = true,
    },
    keys = {
      { "<leader>co", ":CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
      { "<leader>coe", ":CopilotChatExplain<CR>", desc = "Explain code" },
      { "<leader>cof", ":CopilotChatFix<CR>", desc = "Fix code" },
      { "<leader>cor", ":CopilotChatReview<CR>", desc = "Review code" },
      { "<leader>cot", ":CopilotChatTests<CR>", desc = "Generate tests" },
      { "<leader>com", ":CopilotChatCommit<CR>", desc = "Commit message" },
    },
  },
}

