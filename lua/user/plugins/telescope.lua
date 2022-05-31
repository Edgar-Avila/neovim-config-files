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
        file_ignore_patterns = {"node_modules/.*", "env/.*", "__pycache__/*", "target/.*"}
    }
}

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", {noremap = true})

-- Lsp mappings
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>Telescope lsp_references<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", {noremap = true})

-- Git mappings
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", {noremap = true})
