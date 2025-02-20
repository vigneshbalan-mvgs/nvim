return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
		"Shatur/neovim-session-manager" -- Ensure this dependency is present
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local session_manager = require("session_manager")

		dashboard.section.header.val = {
			[[          _____                    _____                    _____                    _____          ]],
			[[         /\    \                  /\    \                  /\    \                  /\    \         ]],
			[[        /::\____\                /::\____\                /::\    \                /::\    \        ]],
			[[       /::::|   |               /:::/    /               /::::\    \              /::::\    \       ]],
			[[      /:::::|   |              /:::/    /               /::::::\    \            /::::::\    \      ]],
			[[     /::::::|   |             /:::/    /               /:::/\:::\    \          /:::/\:::\    \     ]],
			[[    /:::/|::|   |            /:::/____/               /:::/  \:::\    \        /:::/__\:::\    \    ]],
			[[   /:::/ |::|   |            |::|    |               /:::/    \:::\    \       \:::\   \:::\    \   ]],
			[[  /:::/  |::|___|______      |::|    |     _____    /:::/    / \:::\    \    ___\:::\   \:::\    \  ]],
			[[ /:::/   |::::::::\    \     |::|    |    /\    \  /:::/    /   \:::\ ___\  /\   \:::\   \:::\    \ ]],
			[[/:::/    |:::::::::\____\    |::|    |   /::\____\/:::/____/  ___\:::|    |/::\   \:::\   \:::\____\]],
			[[\::/    / ~~~~~/:::/    /    |::|    |  /:::/    /\:::\    \ /\  /:::|____|\:::\   \:::\   \::/    /]],
			[[ \/____/      /:::/    /     |::|    | /:::/    /  \:::\    /::\ \::/    /  \:::\   \:::\   \/____/ ]],
			[[             /:::/    /      |::|____|/:::/    /    \:::\   \:::\ \/____/    \:::\   \:::\    \     ]],
			[[            /:::/    /       |:::::::::::/    /      \:::\   \:::\____\       \:::\   \:::\____\    ]],
			[[           /:::/    /        \::::::::::/____/        \:::\  /:::/    /        \:::\  /:::/    /    ]],
			[[          /:::/    /          ~~~~~~~~~~               \:::\/:::/    /          \:::\/:::/    /     ]],
			[[         /:::/    /                                     \::::::/    /            \::::::/    /      ]],
			[[        /:::/    /                                       \::::/    /              \::::/    /       ]],
			[[        \::/    /                                         \::/____/                \::/    /        ]],
			[[         \/____/                                                                    \/____/         ]],


		}

		-- Dashboard Buttons
		dashboard.section.buttons.val = {
			dashboard.button("s", "Last Session", ":SessionManager load_last_session<CR>"),
			dashboard.button("l", "List Session", ":SessionManager load_session<CR>"),
			dashboard.button("c", "Config", ":e ~/.config/nvim/init.lua<CR>"),
			dashboard.button("k", "Keymaps", ":e ~/.config/nvim/lua/keymaps.lua<CR>"),
			dashboard.button("r", "Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "Quit", ":qa<CR>")
		}

		-- Apply Dashboard Settings
		alpha.setup(dashboard.opts)
	end
}
