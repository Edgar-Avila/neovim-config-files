-- Configurations
vim.g.floaterm_gitcommit='floaterm'
vim.g.floaterm_autoinsert=1
vim.g.floaterm_width=0.8
vim.g.floaterm_height=0.8
vim.g.floaterm_wintitle=0
vim.g.floaterm_autoclose=1

if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.g.floaterm_shell='pwsh.exe'
end

-- Mappings
vim.api.nvim_set_keymap("n", "<leader>tt", ":FloatermToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>t;", ":FloatermNew<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>tg", ":FloatermNew lazygit<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<F1>", ":FloatermToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<F2>", ":FloatermPrev<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<F3>", ":FloatermNext<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<F4>", ":FloatermNew<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<F1>", "<C-\\><C-n>:FloatermToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<F2>", "<C-\\><C-n>:FloatermPrev<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<F3>", "<C-\\><C-n>:FloatermNext<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<F4>", "<C-\\><C-n>:FloatermNew<CR>", {noremap=true})
