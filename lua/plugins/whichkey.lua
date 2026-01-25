return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({})

		wk.add({
			{ "<leader>b", group = "Buffers" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>z", group = "Copilot" },

			{ "<leader>pv", ":Ex<CR>", desc = "File explorer" },
			{ "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI", desc = "Replace word under cursor" },
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
			{ "<leader>ç", "<cmd>:Telescope keymaps<CR>", desc = "Telescope keymaps" },
		})
	end,
}
