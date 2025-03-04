return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto", -- You can replace "auto" with themes like "gruvbox", "rose-pine", etc.
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { statusline = {}, winbar = {} },
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true, -- Enables a single statusline for all splits
				refresh = { statusline = 100, tabline = 100, winbar = 100 },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						-- color = { fg = "#000000", bg = "#ffcc00", gui = "bold" }, -- Highlight mode
					},
				},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", path = 1 }, -- Show full file path
					{ "filesize" }, -- Display file size
					{ "lsp_progress" }, -- Show LSP progress (needs nvim-lspconfig)
				},
				lualine_x = {
					{ "filetype" },
					-- { "location" }, -- Show line and column number
					{
						function()
							return vim.bo.modified and " Modified" or " Saved"
						end, -- Show if file is unsaved
						-- color = { fg = "#ff5555" },
					},
				},
				lualine_y = { "progress" },
				lualine_z = {
					{
						function()
							local msg = "No Active LSP"
							local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
							local clients = vim.lsp.get_active_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return "  " .. client.name
								end
							end
							return msg
						end,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "nvim-tree", "quickfix", "fugitive" },
		})
	end,
}
