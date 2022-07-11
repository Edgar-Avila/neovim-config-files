local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup{
    defaults = {
        file_ignore_patterns = {"node_modules/.*", "env/.*", "__pycache__/*", "target/.*", "build/*", "dist/*"}
    }
}
telescope.load_extension('neoclip')

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true}) -- Files
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {noremap = true}) -- Grep
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {noremap = true}) -- Buffers
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {noremap = true}) -- Help tags
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", {noremap = true}) -- Colorscheme
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {noremap = true}) -- Recent
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope builtin<cr>", {noremap = true}) -- Telescope options
vim.api.nvim_set_keymap("n", "<leader>fy", "<cmd>Telescope neoclip plus<cr>", {noremap = true}) -- Tracked by git

-- Lsp mappings
vim.api.nvim_set_keymap("n", "<leader>fR", "<cmd>Telescope lsp_references<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", {noremap = true})

-- Git mappings
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Telescope git_files<cr>", {noremap = true}) -- Tracked by git
