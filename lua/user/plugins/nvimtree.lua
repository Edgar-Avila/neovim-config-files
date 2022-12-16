require('nvim-tree').setup()

-- Mappings
vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFocus<CR>", {noremap=true})
