return {
	{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
},
	{
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
},
	{
    'farias-hecdin/CSSVarViewer',
    ft = "css",
    config = true,
    -- If you want to configure some options, replace the previous line with:
    -- config = function()
    -- end,
},
	{
  "roobert/tailwindcss-colorizer-cmp.nvim",
  -- optionally, override the default options:
  config = function()
    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })
  end
},
	-- Fuzzy Finder Performance
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end
	},

	-- Better Buffer Navigation
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup {}
			vim.keymap.set('n',"L", ":BufferLineCycleNext<CR>")
			vim.keymap.set('n',"H", ":BufferLineCyclePrev<CR>")
			vim.keymap.set('n',"<leader>bo", ":BufferLineCloseOthers<CR>")
			vim.keymap.set('n',"<leader>bd", ":BufferLineCloseOthers<CR>")
		end
	},

	-- Quick Text Surroundings (parentheses, brackets, quotes)
	{
		"tpope/vim-surround",
		event = "VeryLazy"
	},
	-- Commenting Made Easy
	{
		"tpope/vim-commentary",
		event = "VeryLazy"
	},

	-- Git Integration
	{
		"lewis6991/gitsigns.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("gitsigns").setup()
		end
	},

	-- Better UI for Neovim (e.g., floating menus)
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy"
	},

	-- Which Key (Shows available keymaps)
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end
	},
	{
  "matze/vim-move",
  event = "VeryLazy"
},


}
