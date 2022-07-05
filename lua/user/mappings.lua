-- Remap Esc
vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap = true})

-- Better window navigation
vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", {noremap = true})

-- Fast edit init.lua "cd init.lua"
vim.api.nvim_set_keymap("n", "<leader>cdi", ":e $MYVIMRC<CR>:cd %:p:h<CR>", {noremap = true})

-- Change current working directory "cd file"
vim.api.nvim_set_keymap("n", "<leader>cdf", ":cd %:p:h<CR>", {noremap = true})

-- Closing brackets and quotes
vim.api.nvim_set_keymap("i", "'", "''<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "\"", "\"\"<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "{", "{}<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "(", "()<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "[", "[]<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<ESC>O", {noremap = true})
