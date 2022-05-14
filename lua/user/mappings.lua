-- Remap Esc
vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap = true})

-- Better window navigation
vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", {noremap = true})

-- Closing brackets and quotes
vim.api.nvim_set_keymap("i", "'", "''<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "\"", "\"\"<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "{", "{}<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "(", "()<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "[", "[]<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<ESC>O", {noremap = true})
