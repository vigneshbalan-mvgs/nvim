return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>hl", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-1>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-2>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-3>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-4>", function()
			harpoon:list():select(4)
		end)
-- 		--
-- 		-- -- Toggle previous & next buffers stored within Harpoon list
-- 		-- vim.keymap.set("n", "<C-S-j>", function()
-- 		-- 	harpoon:list():prev()
-- 		-- end)
-- 		-- vim.keymap.set("n", "<C-S-k>", function()
-- 		-- 	harpoon:list():next()
-- 		-- end)
	end,
}
