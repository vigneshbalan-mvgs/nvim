return {
  -- LSP Config & Mason
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig_defaults = require("lspconfig").util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lspconfig_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }
          local map = vim.keymap.set
          map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
          map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
          map("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "View Diagnostics" })
          map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          map({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
          map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end,

      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "cssls",
          "vtsls",
          "cssmodules_ls",
          "tailwindcss",
          "lua_ls",
        },
      })

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        ["vtsls"] = function()
          require("lspconfig").vtsls.setup({
            root_dir = require("lspconfig").util.root_pattern(
              ".git",
              "pnpm-workspace.yaml",
              "pnpm-lock.yaml",
              "yarn.lock",
              "package-lock.json",
              "bun.lockb"
            ),
            typescript = {
              tsserver = {
                maxTsServerMemory = 12288,
              },
            },
            experimental = {
              completion = {
                entriesLimit = 3,
              },
            },
          })
        end,
      })
    end,
  },

  -- Autocompletion + Snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Insert }
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = cmp.mapping.select_next_item({ behaviour = cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behaviour = cmp.SelectBehavior.Insert }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
  },

  -- React/React Native Snippets
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "tsx",
          "json",
          "lua",
          "css",
          "html",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Null-ls for prettier & eslint
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.code_actions.eslint_d,
        },
      })
    end,
  },

  -- TailwindCSS Color Highlighting
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons" },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },

  -- Terminal Integration
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
  },
}
