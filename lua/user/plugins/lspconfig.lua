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
                automatic_installation = true,
            },
            main = "mason-lspconfig",
            config = true,
        },
    },
    config = function()
        require('user.lsp')
    end
}
