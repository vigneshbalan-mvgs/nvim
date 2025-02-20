return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- JavaScript, TypeScript, JSON, YAML, Markdown
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "lua", "markdown" },
				}),

				-- Lua Formatter
				null_ls.builtins.formatting.stylua,

				-- Python Formatter (Black) & Import Sorter (isort)
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				-- C/C++ Formatter (clang-format)
				null_ls.builtins.formatting.clang_format,

				-- Go Formatters
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,

				-- Shell Script Formatter
				null_ls.builtins.formatting.shfmt,
			}
		})

		-- Keymap for formatting
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = true })
		end, {})
	end
}
