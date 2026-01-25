return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		build = ":Copilot auth",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-l>", -- aceptar sugerencia
					-- accept = "<Tab>", -- aceptar sugerencia
					next = "<M-]>", -- siguiente sugerencia
					prev = "<M-[>", -- sugerencia anterior
					dismiss = "<C-]>", -- descartar sugerencia
				},
			},
			panel = { enabled = true },
			filetypes = {
				["*"] = true,
			},
			should_attach = function()
				return true
			end,
		},
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			window = { layout = "vertical", border = "rounded" },
			width = 0.4,

			auto_follow_cursor = false,
			show_help = true,
		},
		keys = {
			{ "<leader>zo", ":CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
			{ "<leader>ze", ":CopilotChatExplain<CR>", desc = "Explain code" },
			{ "<leader>zf", ":CopilotChatFix<CR>", desc = "Fix code" },
			{ "<leader>zr", ":CopilotChatReview<CR>", desc = "Review code" },
			{ "<leader>zt", ":CopilotChatTests<CR>", desc = "Generate tests" },
			{ "<leader>zm", ":CopilotChatCommit<CR>", desc = "Commit message" },
		},
	},
}
