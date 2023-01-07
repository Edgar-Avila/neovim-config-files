-- Mappings
vim.api.nvim_set_keymap("n", "<leader>ss", [[:lua require("harpoon.ui").toggle_quick_menu()<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>sa", [[:lua require("harpoon.mark").add_file()<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>su", [[:lua require("harpoon.ui").nav_file(1)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>si", [[:lua require("harpoon.ui").nav_file(2)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>so", [[:lua require("harpoon.ui").nav_file(3)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>sp", [[:lua require("harpoon.ui").nav_file(4)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>sq", [[:lua require("harpoon.ui").nav_file(5)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>sw", [[:lua require("harpoon.ui").nav_file(6)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>se", [[:lua require("harpoon.ui").nav_file(7)<CR> ]], {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>sr", [[:lua require("harpoon.ui").nav_file(8)<CR> ]], {noremap = true})

