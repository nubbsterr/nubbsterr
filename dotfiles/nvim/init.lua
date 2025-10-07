-- Core settings
vim.opt.tabstop = 4           
vim.opt.shiftwidth = 4        
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true     
vim.opt.termguicolors = true  -- Enable true color support (required for many themes and transparency)
vim.cmd('colorscheme habamax')

-- Transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

-- Spellchecking
vim.cmd(':setlocal spell spelllang=en_us')

-- Keybinds
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and exit current buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save current buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Exit current buffer" })
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", { desc = "Open netrw file explorer" })
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Open Lazy.nvim menu" })

-- Telescope 
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in current directory" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep (search text) across files" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List and switch open buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Search Neovim help tags" })

-- Load plugins 
require("plugins")
