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
			local servers = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
			}

			local on_attach = function(client, bufnr)
				-- -- Set up keybindings for the LSP client
				-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>",
				-- 	{ noremap = true, silent = true })
				-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>",
				-- 	{ noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>",
					{ noremap = true, silent = true })
			end

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
					completion = {
						complete = function()
							vim.fn.call('cmp#complete', {})
						end,
					},
					on_attach = on_attach,
				})
			end
		end
	},
}
