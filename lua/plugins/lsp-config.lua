return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"jsonls",
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
capabilities = capabilities
			})
			local servers = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
			}

			for _, server in ipairs(servers) do
				lspconfig[server].setup({})
			end

			-- LSP Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			-- vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {})
		end
	},
}

