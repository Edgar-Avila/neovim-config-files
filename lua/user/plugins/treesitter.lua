return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    opts = {
        auto_install = true,
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
    config = function (_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
    event = { 'BufReadPre', 'BufNewFile' },
}
