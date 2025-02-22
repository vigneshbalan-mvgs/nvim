return {
	{
		"hrsh7th/cmp-nvim-lsp",
		opts = {
			lazy_load = true,
			-- other setup options
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			lazy_load = true,
			-- other setup options
		},
	},
	{
		"hrsh7th/nvim-cmp",
		opts = {
			lazy_load = true,
			-- other setup options
		},
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Alternative icons for completion kinds
			local kind_icons = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "ﰮ",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "﬌",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "ﬦ",
				TypeParameter = "",
			}

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						border = "rounded",
						winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,Search:None",
					},
					documentation = {
						border = "rounded",
						winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,Search:None",
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				formatting = {
					format = function(entry, vim_item)
						-- Add icon and kind label
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "",
							vim_item.kind)
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name] or ""
						return vim_item
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- Enable snippet suggestions
				}, {
					{ name = "buffer" },
				}),
			})

			-- Setup for command-line completion on '/' and '?'
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			print("nvim-cmp config loaded")
		end,
	},
}
