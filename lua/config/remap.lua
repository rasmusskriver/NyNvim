--Set leader button
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--Istedet for at trykke :Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--Markere og flyttet tekst op og ned
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--Hurtigere op og ned i et dokument
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Show which line your cursor is on
-- vim.opt.cursorline = true
-- Netrw settings
vim.g.netrw_banner = 0
