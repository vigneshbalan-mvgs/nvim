return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["l"] = "open", -- Open file or folder
					["h"] = "close_node", -- Close folder or go up
					["<CR>"] = "open", -- Enter like normal Enter key
				},
			},
		})
	end,
}
