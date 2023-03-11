-- Paste without losing what is on buffer
vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", {noremap = true})

-- Remap Esc
vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap = true})

-- Better window navigation
vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", {noremap = true})

-- Fast edit init.lua "cd init.lua"
vim.api.nvim_set_keymap("n", "<leader>cdi", ":e $MYVIMRC<CR>:cd %:p:h<CR>", {noremap = true})

-- Change current working directory "cd file"
vim.api.nvim_set_keymap("n", "<leader>cdf", ":cd %:p:h<CR>", {noremap = true})

-- Make background transparent
vim.api.nvim_set_keymap("n", "<leader>bg", ":lua SetBgTransparent()<CR>", {noremap = true})

-- Create tab
vim.api.nvim_set_keymap("n", "<leader>mt", ":tabnew<CR>", {noremap = true})

-- Easier start/end of line
vim.api.nvim_set_keymap("n", "gh", "^", {noremap = true})
vim.api.nvim_set_keymap("n", "gl", "$", {noremap = true})

-- Closing brackets and quotes
vim.api.nvim_set_keymap("i", "'", "''<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "`", "``<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "\"", "\"\"<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "{", "{}<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "(", "()<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "[", "[]<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<ESC>O", {noremap = true})

-- Easy align mappings
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {noremap = true})
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {noremap = true})
