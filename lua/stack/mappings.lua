-- Paste without losing what is on buffer
vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", { noremap = true })

-- Remap Esc
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Better window navigation
vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { noremap = true })

-- Fast edit init.lua "cd init.lua"
vim.api.nvim_set_keymap("n", "<leader>cdi", ":exe 'cd ' . fnamemodify($MYVIMRC, ':p:h')<CR>:e $MYVIMRC<CR>", { noremap = true })

-- Change current working directory "cd file"
vim.api.nvim_set_keymap("n", "<leader>cdf", ":cd %:p:h<CR>", { noremap = true })

-- Make background transparent
vim.api.nvim_set_keymap("n", "<leader>bg", ":lua SetBgTransparent()<CR>", { noremap = true })

-- Create tab
vim.api.nvim_set_keymap("n", "<leader>mt", ":tabnew<CR>", { noremap = true })

-- Select around quotes without leading whitespaces
vim.api.nvim_set_keymap("v", "a'", "2i'", { noremap = true })
vim.api.nvim_set_keymap("v", "a\"", "2i\"", { noremap = true })
vim.api.nvim_set_keymap("v", "a`", "2i`", { noremap = true })

-- Easier selection without leading and trailing whitespaces ("vil", "yil", "dil", etc)
vim.api.nvim_set_keymap("x", "il", "g_o^", { noremap = true })
vim.api.nvim_set_keymap("o", "il", ":<C-u>normal vil<CR>", { noremap = true })

-- Easier start/end of line
vim.api.nvim_set_keymap("n", "gh", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true })

-- Closing brackets and quotes
vim.api.nvim_set_keymap("i", "'",     "''<left>",     { noremap = true })
vim.api.nvim_set_keymap("i", "`",     "``<left>",     { noremap = true })
vim.api.nvim_set_keymap("i", "\"",    "\"\"<left>",   { noremap = true })
vim.api.nvim_set_keymap("i", "{",     "{}<left>",     { noremap = true })
vim.api.nvim_set_keymap("i", "(",     "()<left>",     { noremap = true })
vim.api.nvim_set_keymap("i", "[",     "[]<left>",     { noremap = true })
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<ESC>O", { noremap = true })

-- Resize windows
vim.api.nvim_set_keymap("n", "<S-right>", "<cmd>vertical resize +2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-left>", "<cmd>vertical resize -2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-up>", "<cmd>horizontal resize +2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-down>", "<cmd>horizontal resize -2<CR>", { noremap = true })

-- Close quickfix
vim.api.nvim_set_keymap("n", "<leader>q", ":cclose<CR>", { noremap = true })

-- Eval expression selected
vim.api.nvim_set_keymap("x", "<leader>me", ":s/.*/\\=eval(submatch(0))<CR>", { noremap = true })

-- Make ctrl + c the same as escape
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", { noremap = true })
