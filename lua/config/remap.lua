vim.keymap.set("n", ".", "<Nop>")
-- Set leader button SKAL VÆRE ØVERST !!!
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- NOTE til mig selv lav kun nye kommandoer med leader under den der DEFINERE LEADER KNAPPEN
vim.keymap.set(
  "n",
  "<leader>gd",
  "<cmd>split<CR><cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.signcolumn = "yes"

vim.opt.inccommand = "split"

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Fejlen er her
-- vim.g.netrw_banner = 0
-- Fejlen er her

-- Til at teste hurtigt
-- vim.keymap.set("n", "<leader>t", ":!python test.py<CR>")

-- vim.keymap.set("n", "<leader>t", function()
--   local output = vim.fn.system("python test.py")
--   print(output)
-- end)
--
-- vim.keymap.set("n", "<leader>t", function()
--   local output = vim.fn.system("uv run 2025/1/Day1.py")
--   print(output)
-- end)
