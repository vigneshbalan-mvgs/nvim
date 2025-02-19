-- return {
--     "goolord/alpha-nvim",
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
--     config = function()
-- 	local alpha = require("alpha")
-- 	local dashboard = require("alpha.themes.startify")

-- 	-- Set custom title "mvgs" in the header
-- 	dashboard.section.header.val = {
-- 	    [[ ███    ███ ██    ██  ██████   ██████  ███████ ]],
-- 	    [[ ████  ████ ██    ██ ██       ██       ██      ]],
-- 	    [[ ██ ████ ██ ██    ██ ██   ███ ██   ███ █████   ]],
-- 	    [[ ██  ██  ██ ██    ██ ██    ██ ██    ██ ██      ]],
-- 	    [[ ██      ██  ██████   ██████   ██████  ███████ ]],
-- 	    [[                                             ]],
-- 	    [[           Welcome to mvgs's Neovim          ]]
-- 	}

-- 	alpha.setup(dashboard.opts)
--     end,
-- }
--
return{
		'goolord/alpha-nvim',
		dependencies = {
			'echasnovski/mini.icons',
			'nvim-lua/plenary.nvim'
		},
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			local session_manager = require("session_manager")


			dashboard.section.buttons.val = {
			dashboard.button("r", "recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "Last Session", ":SessionManager load_last_session<CR>"),
				dashboard.button("l", "Load Session", ":SessionManager load_session<CR>"),
				dashboard.button("q", "Quit Neovim", ":qa<CR>")
			}

			alpha.setup(dashboard.opts)
		end
	}
