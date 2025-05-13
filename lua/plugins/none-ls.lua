return {
  -- -- TypeScript & React LSP
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     local lspconfig = require("lspconfig")

  --     lspconfig.ts_ls.setup({
  --       on_attach = function(client, bufnr)
  --         -- Disable the server's formatting in favor of null-ls
  --         client.server_capabilities.documentFormattingProvider = false
  --         local opts = { buffer = bufnr }
  --         -- You can add more keybindings or buffer options here
  --       end,
  --       settings = {
  --         typescript = {
  --           inlayHints = {
  --             includeInlayParameterNameHints = "all",
  --             includeInlayVariableTypeHints = true,
  --           },
  --         },
  --         javascript = {
  --           inlayHints = {
  --             includeInlayParameterNameHints = "all",
  --             includeInlayVariableTypeHints = true,
  --           },
  --         },
  --       },
  --     })

  --     -- JSON LSP for better config file support
  --     lspconfig.jsonls.setup({})
  --   end,
  -- },

  -- -- Null-LS for ESLint & Prettier
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Prettier for formatting
          null_ls.builtins.formatting.prettier.with({
            filetypes = {
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "json",
              "markdown",
              "html",
              "css",
            },
          }),
          -- ESLint for diagnostics and code actions
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.code_actions.eslint_d,
        },
      })

      -- Auto-format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- Manual Formatting Shortcut
      vim.keymap.set("n", "<leader>gf", function()
        print("Formatting with null-ls…")
        vim.lsp.buf.format({
          async = true,
          filter = function(client)
            return client.name == "null-ls"
          end,
        })
      end, {})
    end,
  },
}
