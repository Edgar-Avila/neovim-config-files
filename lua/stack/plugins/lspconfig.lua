return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        {
            'williamboman/mason.nvim',
            main = "mason",
            config = true,
        },
        {
            'williamboman/mason-lspconfig.nvim',
            opts = {
                ensure_installed = {
                    'lua_ls',
                }

            },
            main = "mason-lspconfig",
            config = true,
        },
    },
    config = function()
        require('stack.lsp')
    end,
    event = "VeryLazy",
}
