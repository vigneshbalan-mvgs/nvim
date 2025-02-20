-- Move current line up or down in Normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move selected lines in Visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- choosing next intent
vim.keymap.set("i", "<A-j>", "<C-n>", { desc = "Next Completion Item" })
vim.keymap.set("i", "<A-k>", "<C-p>", { desc = "Previous Completion Item" })


-- Toggle File Explorer (Neo-tree)
-- vim.keymap.set("n", "<leader>e", ":Neotree reveal_force_cwd toggle<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>e", ":Neotree reveal_force_cwd toggle<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>gg", ":Neotree git_status float  toggle<CR>", { desc = "Toggle Git Status" })

-- Buffer Navigation (Using Bufferline)
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close Buffer" })

-- Telescope Keymaps
vim.keymap.set("n", "<leader><leader>", ":Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find Help" })
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", { desc = "Find References" })
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", { desc = "Find Definition" })
vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", { desc = "Find Implementations" })
vim.keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", { desc = "Find Type Definition" })
vim.keymap.set("n", "ga", ":Telescope lsp_code_actions<CR>", { desc = "Code Actions" })
vim.keymap.set("n", "gs", ":Telescope lsp_document_symbols<CR>", { desc = "Document Symbols" })
vim.keymap.set("n", "gS", ":Telescope lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })
vim.keymap.set("n", "td", ":Telescope diagnostics<CR>", { desc = "Workspace Symbols" })

-- Commenting (Using vim-commentary)
vim.keymap.set("n", "<A-/>", ":Commentary<CR>", { desc = "Toggle Comment" })
vim.keymap.set("v", "<A-/>", ":Commentary<CR>", { desc = "Toggle Comment (Visual)" })

-- Better Navigation
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines Without Moving Cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center screen after page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center screen after page up" })

-- Git Signs Keymaps
-- vim.keymap.set("n", "<leader>gs", ":Gitsigns toggle_signs<CR>", { desc = "Toggle Git Signs" })
-- vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
-- vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git Blame Line" })

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
vim.keymap.set("n", "<A-K>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-J>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-H>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-L>", ":vertical resize +2<CR>", { desc = "Increase window width" })

--lsp formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format File" })


--Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })


--toggle relativenumber
vim.keymap.set("n", "<leader>rn", ":set relativenumber!<CR>", { desc = "Toggle Relative Number" })


--terminal
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=float size=10<CR>", { desc = "ToggleTerm" })
