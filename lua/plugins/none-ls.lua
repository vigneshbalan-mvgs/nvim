return {
	"nvimtools/none-ls.nvim",
	opts = {
		lazy_load = true,
		-- other setup options
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"json",
						"lua",
						"markdown",
					},
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.shfmt,
			},
		})

		-- Keymap for formatting using only null-ls client
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
}
