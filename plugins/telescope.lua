-- nnoremap <leader>ff <cmd>Telescope find_files<cr>
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup{
    defaults = {
        file_ignore_patterns = {"node_modules/.*", "env/.*", "__pycache__/*" }
    }
}

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {noremap = true})
