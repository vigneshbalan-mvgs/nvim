return {
	{
		"nvim-telescope/telescope.nvim",
		tag = '0.1.6',
		dependecies = { 'nvim-lua/plenary.nvim' },

		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
			vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
		end

	},
	{
		'nvim-telescope/telescope-ui-select.nvim',

		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
							-- even more opts
						}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end

	}

}
