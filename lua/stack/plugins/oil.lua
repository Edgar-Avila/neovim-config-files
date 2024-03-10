return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        { "<leader>od", "<CMD>Oil --float<CR>" },
        { "<leader>oc", "<CMD>lua require('oil').open_float(vim.loop.cwd())<CR>" },
    },
}
