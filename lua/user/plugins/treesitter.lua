return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    opts = {
        ensure_installed = {
            "python",
            "typescript",
            "javascript",
            "go",
            "lua",
            "json",
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
    config = function (_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
