return {
    "adalessa/laravel.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "tpope/vim-dotenv",
        "MunifTanjim/nui.nvim",
        "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
        { "<leader>la", "<cmd>Laravel artisan<cr>" },
        { "<leader>lr", "<cmd>Laravel routes<cr>" },
        { "<leader>lM", "<cmd>Laravel related<cr>" },
        { "<leader>lv", "<cmd>Telescope find_files search_dirs=resources/views<cr>" },
        { "<leader>lc", "<cmd>Telescope find_files search_dirs=app/Http/Controllers<cr>"},
        { "<leader>lm", "<cmd>Telescope find_files search_dirs=app/Models<cr>"},
        { "<leader>ld", "<cmd>Telescope find_files search_dirs=database/migrations<cr>"},
        { "<leader>lw", "<cmd>e routes/web.php<cr>"},
    },
    cond = function()
        return ExistsInCwd("artisan")
    end,
    event = { "VeryLazy" },
    config = true,
}
