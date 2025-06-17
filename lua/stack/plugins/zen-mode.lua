return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            options = {
                signcolumn = "no",
                colorcolumn = "0",
            }
        },
    },
    init = function()
        -- vim.cmd [[highlight ZenBg guibg=black ctermbg=black]]
    end,
    keys = {
        { "<leader>z", "<cmd>ZenMode<CR>" },
    },
}
