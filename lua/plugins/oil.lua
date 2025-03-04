return {
  "stevearc/oil.nvim",
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
  },
  lazy = true,
  config = function()
    require("oil").setup({
      columns = { "permissions", "size", "mtime" },
      view_options = {
	show_hidden = true,
      },
      keymaps = {
	["<CR>"] = "actions.open",
	["<BS>"] = "actions.parent",
	["q"] = "actions.close",
      },
    })

  end,
}
