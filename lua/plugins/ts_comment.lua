return {
  {
    "folke/ts-comments.nvim",
    opts = {
      ignore_empty = true,
      markers = {
        javascript = { "// %s", "/* %s */" },
        typescript = { "// %s", "/* %s */" },
        lua = { "-- %s" },
        python = { "# %s" },
      },
      keymaps = {
        comment_line = "<leader>c",  -- Toggle line comment
        comment_block = "<leader>b", -- Toggle block comment
      },
    },
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  }
}
