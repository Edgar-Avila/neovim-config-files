return {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            term_colors = true,
            transparent_background = vim.g.bgtransparent,
            integrations = {
                mason = true,
                leap = true,
                nvimtree = true,
                cmp = true,
                harpoon = true,
                telescope = true,
                treesitter = true,
            }
        })
        vim.g.lightline = { colorscheme = "catppuccin" }
        -- vim.cmd.colorscheme("catppuccin")
    end
}
