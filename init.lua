vim.g.mapleader = " "

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.number =false 
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = false -- Highlight the current line
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.termguicolors = true -- Enable 24-bit color
vim.opt.scrolloff = 8 -- Keep cursor 8 lines away from screen edge
vim.opt.updatetime = 250 -- Faster updates
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Smart case sensitivity
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Incremental search

require("keymaps")

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
