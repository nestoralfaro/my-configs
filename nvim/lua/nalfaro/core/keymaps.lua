vim.g.mapleader = " "

local keymap = vim.keymap

------------------------
-- General Keymaps
------------------------

-- Yanking keymap
keymap.set("n", "Y", "yy")

-- navigation
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move visual line downwards
keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- move visual line upwards
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace selected word

keymap.set("n", "J", "mzJ`z") -- J appends next line while keeping cursor in place
keymap.set("n", "<C-u>", "<C-u>zz") -- half page jumping without moving cursor
keymap.set("n", "<C-d>", "<C-d>zz") -- half page jumping without moving cursor
keymap.set("n", "n", "nzzzv") -- next search without moving cursor
keymap.set("n", "N", "Nzzzv") -- previous search without moving cursor

-- loading to void register
keymap.set("x", "<leader>p", "\"_dP")
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

------------------------
-- Plugins Keymaps
------------------------
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
-- nvim-tree (file explorer)
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- git
keymap.set("n", "<leader>gs", vim.cmd.Git)
