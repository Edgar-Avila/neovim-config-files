local tnconfig = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = vim.g.bgtransparent,
        styles = {
            sidebars = vim.g.bgtransparent and "transparent" or nil,
            floats = vim.g.bgtransparent and "transparent" or nil,
        },
    },
}

return tnconfig
