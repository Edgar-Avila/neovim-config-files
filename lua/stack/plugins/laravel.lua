return {
    "adalessa/laravel.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "tpope/vim-dotenv",
        "MunifTanjim/nui.nvim",
        "nvimtools/none-ls.nvim",
        "kevinhwang91/promise-async",
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
        { "<leader>lf", "<cmd>Telescope find_files search_dirs=database/factories<cr>"},
        { "<leader>ls", "<cmd>Telescope find_files search_dirs=database/seeders<cr>"},
        { "<leader>lj", "<cmd>Telescope find_files search_dirs=app/Http/Resources<cr>"},
        { "<leader>li", "<cmd>Telescope find_files search_dirs=resources/js<cr>"},
        { "<leader>lp", "<cmd>Telescope find_files search_dirs=resources/js/pages<cr>"},
        { "<leader>lt", "<cmd>Telescope find_files search_dirs=tests<cr>"},
        { "<leader>lw", "<cmd>e routes/web.php<cr>"},
        { "<leader>le", "<cmd>e routes/api.php<cr>"},
    },
    cond = function()
        -- return true
        return ExistsInCwd("artisan")
    end,
    event = { "VeryLazy" },
    config = function ()
        require('laravel').setup({
            lsp_server = "intelephense",
        })
    end,
}
