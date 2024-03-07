vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set number")
vim.g.mapleader = ";"

vim.keymap.set('i', '{', "{}<Esc>ha", {})
vim.keymap.set('i', '(', "()<Esc>ha", {})
vim.keymap.set('i', '[', "[]<Esc>ha", {})
vim.keymap.set('i', '"', '""<Esc>ha', {})
vim.keymap.set('i', "'", "''<Esc>ha", {})
vim.keymap.set('i', '`', "``<Esc>ha", {})
