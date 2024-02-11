return {
    'kyazdani42/nvim-tree.lua',
    keys = {
        {
            "<leader>e",
            ":NvimTreeToggle<CR>",
        }
    },
    main = 'nvim-tree',
    config = true,
    init = function()
        vim.api.nvim_create_autocmd('BufEnter', {
            command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
            nested = true,
        })
    end,
}
