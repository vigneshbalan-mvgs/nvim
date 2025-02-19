return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim", -- include the extension as a dependency
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              -- Alt-j/k to move selection down/up
              ["<A-j>"] = actions.move_selection_next,
              ["<A-k>"] = actions.move_selection_previous,
              -- Optional: Alt-h/l to scroll preview window up/down
              ["<A-h>"] = actions.preview_scrolling_up,
              ["<A-l>"] = actions.preview_scrolling_down,
            },
            n = {
              ["<A-j>"] = actions.move_selection_next,
              ["<A-k>"] = actions.move_selection_previous,
            },
          },
        },
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({}),
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
