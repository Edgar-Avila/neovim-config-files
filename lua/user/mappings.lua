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

-- Closing brackets and quotes
vim.api.nvim_set_keymap("i", "'", "''<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "`", "``<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "\"", "\"\"<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "{", "{}<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "(", "()<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "[", "[]<left>", {noremap = true})
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<ESC>O", {noremap = true})

-- Harpoon mappings
vim.api.nvim_set_keymap("n", "<leader>ss", [[:lua require("harpoon.ui").toggle_quick_menu()<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>sa", [[:lua require("harpoon.mark").add_file()<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>su", [[:lua require("harpoon.ui").nav_file(1)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>si", [[:lua require("harpoon.ui").nav_file(2)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>so", [[:lua require("harpoon.ui").nav_file(3)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>sp", [[:lua require("harpoon.ui").nav_file(4)<CR> ]], {noremap = true})

