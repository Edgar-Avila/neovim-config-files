return {
    'dracula/vim',
    event = "VeryLazy",
    config = function()
        vim.g.dracula_colorterm = vim.g.bgtransparent and 0 or 1
    end,
}
