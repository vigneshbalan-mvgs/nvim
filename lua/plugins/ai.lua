return {
  {
    "Exafunction/codeium.nvim",
    enabled = false,
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
          enabled = false,
        },
      })
    end,
  },
  {
    "monkoose/neocodeium",
    enabled = false,
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<TAB>", neocodeium.accept)
    end,
  }
}
