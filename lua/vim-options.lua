vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
-- vim.cmd("set foldmethod=expr")

vim.keymap.set("i", "<C-a>", "<Esc>", {})
vim.keymap.set({"n", "v"}, "h", "", {})
vim.keymap.set({"n", "v"}, "i", "<Up>", {})
vim.keymap.set({"n", "v"}, "k", "<Down>", {})
vim.keymap.set({"n", "v"}, "j", "<Left>", {})
vim.keymap.set({"n", "v"}, "<C-i>", "<C-w><C-k>", {})
vim.keymap.set({"n", "v"}, "<C-k>", "<C-w><C-j>", {})
vim.keymap.set({"n", "v"}, "<C-j>", "<C-w><C-h>", {})
vim.keymap.set({"n", "v"}, "<C-l>", "<C-w><C-l>", {})
vim.keymap.set({"n", "v"}, ",", "i", {})
vim.keymap.set({"n", "v"}, "m", "I", {})
vim.keymap.set({"n", "v"}, "I", "", {})
vim.keymap.set({"t"}, "<C-a>", "<C-\\><C-n>", {})

vim.diagnostic.config{underline=false}

vim.cmd("set relativenumber")
vim.cmd("set number")
