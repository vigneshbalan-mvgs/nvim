return {
  {


	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			experimental = {
				fileType = {
					["js"] = "javascript",
					["jsx"] = "javascript",
					["ts"] = "typescript",
					["tsx"] = "typescript",
            
				},
			},
			model = "codeium/codeium-base",
			terminal = {
				enabled = true,
			},
		})
	end
},
  {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<TAB>", neocodeium.accept)
  end,
}
  
  }
