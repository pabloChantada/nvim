return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({})

		-- Only group labels here; the mappings themselves (with desc) live
		-- in config/keymaps.lua and in each plugin file.
		wk.add({
			{ "<leader>b", group = "Buffers" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>o", group = "Organize" },
			{ "<leader>p", group = "Project" },
			{ "<leader>v", group = "LSP" },
			{ "<leader>vr", group = "References / Rename" },
			{ "<leader>w", group = "Windows" },
			{ "<leader>z", group = "Copilot" },
		})
	end,
}
