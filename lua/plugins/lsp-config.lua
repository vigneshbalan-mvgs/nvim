return {
  -- Mason: Manage external tooling including LSP servers.
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason LSPConfig Bridge: Automatically installs and links LSP servers.
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- Lua language server (for Neovim config)
          "ts_ls",  -- TypeScript/JavaScript language server (powered by tsserver)
          "html",   -- Uses vscode-html-languageserver-bin
          "cssls",  -- Uses vscode-css-languageserver-bin
          "jsonls", -- Uses vscode-json-languageserver
        },
        automatic_installation = true,
      })
    end,
  },
  -- Neovim LSPConfig: Configures the LSP servers.
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- Define common on_attach function with VSCode-like keybindings.
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end

      -- Setup Lua LSP for Neovim configuration.
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Setup TypeScript/JavaScript LSP with inlay hints (VSCode-like experience).
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Disable built-in formatting to allow external tools (e.g., Prettier via null-ls).
          client.server_capabilities.documentFormattingProvider = false
          on_attach(client, bufnr)
        end,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayVariableTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayReturnTypeHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayVariableTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayReturnTypeHints = true,
            },
          },
        },
      })

      -- Setup HTML LSP (vscode-html-languageserver).
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Setup CSS LSP (vscode-css-languageserver).
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Setup JSON LSP (vscode-json-languageserver).
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },
  -- Null-ls for ESLint & Prettier
  {
    "nvimtools/none-ls.nvim", -- Alternatively, "jose-elias-alvarez/null-ls.nvim"
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Prettier for formatting.
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
          -- ESLint for diagnostics and code actions.
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.code_actions.eslint_d,
        },
      })

      -- Auto-format on save.
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- Manual Formatting Shortcut.
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
