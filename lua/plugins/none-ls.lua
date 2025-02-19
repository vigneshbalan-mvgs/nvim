return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml", "markdown" },
				}),

				-- null_ls.builtins.diagnostics.eslint, -- Corrected from `ts_ls` to `eslint`
			}
		})

		-- Keymap for formatting
		vim.keymap.set('n', '<leader>gf', function()
			vim.lsp.buf.format({ async = true })
		end, {})
	end
}
