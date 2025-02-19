return {

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
}
