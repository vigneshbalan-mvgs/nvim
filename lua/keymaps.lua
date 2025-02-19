-- Move current line up or down in Normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move selected lines in Visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- For Insert mode you can map the key sequences if needed (optional)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down (insert mode)" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up (insert mode)" })

-- Toggle File Explorer (Neo-tree)
vim.keymap.set("n", "<leader>e", ":Neotree  filesystem toggle<CR>", { desc = "Toggle File Explorer" })

-- Buffer Navigation (Using Bufferline)
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close Buffer" })

-- Telescope Keymaps
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find Help" })

-- Commenting (Using vim-commentary)
vim.keymap.set("n", "<leader>/", ":Commentary<CR>", { desc = "Toggle Comment" })
vim.keymap.set("v", "<leader>/", ":Commentary<CR>", { desc = "Toggle Comment (Visual)" })

-- Better Navigation
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines Without Moving Cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center screen after page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center screen after page up" })

-- Git Signs Keymaps
vim.keymap.set("n", "<leader>gs", ":Gitsigns toggle_signs<CR>", { desc = "Toggle Git Signs" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git Blame Line" })

-- Save & Quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save File" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save & Quit" })

-- Navigate to the window below
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
-- Navigate to the window above
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
-- Navigate to the left window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
-- Navigate to the right window
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-----------------------------------------------------------
-- Optionally, if you want to add additional keymaps for moving around:
-- Example: Resize splits with Ctrl + Arrow keys
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })
