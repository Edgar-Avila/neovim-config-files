local fs_utils = require("stack.utils.filesystem")

return {
    "adalessa/laravel.nvim",
    dependencies = {
        -- Previous dependencies
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "tpope/vim-dotenv",
        "MunifTanjim/nui.nvim",
        "nvimtools/none-ls.nvim",

        -- Current dependencies
        "kevinhwang91/promise-async",
        "nvim-lua/plenary.nvim",
        "nvim-neotest/nvim-nio",
    },
    keys = {
        { "<leader>ll", function() Laravel.pickers.laravel() end,       desc = "Laravel: Open Laravel Picker" },
        { "<leader>la", function() Laravel.pickers.artisan() end,       desc = "Laravel: Open Artisan Picker" },
        { "<leader>lt", function() Laravel.commands.run("actions") end, desc = "Laravel: Open Actions Picker" },
        { "<leader>lr", function() Laravel.pickers.routes() end,        desc = "Laravel: Open Routes Picker" },
        { "<leader>lm", function() Laravel.pickers.make() end,          desc = "Laravel: Open Make Picker" },
        { "<leader>lc", function() Laravel.pickers.commands() end,      desc = "Laravel: Open Commands Picker" },
        { "<leader>lo", function() Laravel.pickers.resources() end,     desc = "Laravel: Open Resources Picker" },
        { "<leader>lC", function() Laravel.commands.run("env:configure") end, desc = "Laravel: Open Environment Configuration" },
        { "<leader>lw", "<cmd>e routes/web.php<cr>" },
        { "<leader>le", "<cmd>e routes/api.php<cr>" },

        -- { "<c-g>",      function() Laravel.commands.run("view:finder") end,    desc = "Laravel: Open View Finder" },
        -- { "<leader>lh", function() Laravel.run("artisan docs") end,            desc = "Laravel: Open Documentation" },
        -- { "<leader>lp", function() Laravel.commands.run("command_center") end, desc = "Laravel: Open Command Center" },
        -- { "<leader>lu", function() Laravel.commands.run("hub") end,            desc = "Laravel Artisan hub" },

        -- Previous
        --      { "<leader>lv", "<cmd>Telescope find_files search_dirs=resources/views<cr>" },
        --      { "<leader>lc", "<cmd>Telescope find_files search_dirs=app/Http/Controllers<cr>" },
        --      { "<leader>lm", "<cmd>Telescope find_files search_dirs=app/Models<cr>" },
        --      { "<leader>ld", "<cmd>Telescope find_files search_dirs=database/migrations<cr>" },
        --      { "<leader>lf", "<cmd>Telescope find_files search_dirs=database/factories<cr>" },
        --      { "<leader>ls", "<cmd>Telescope find_files search_dirs=database/seeders<cr>" },
        --      { "<leader>lj", "<cmd>Telescope find_files search_dirs=app/Http/Resources<cr>" },
        --      { "<leader>li", "<cmd>Telescope find_files search_dirs=resources/js<cr>" },
        --      { "<leader>lp", "<cmd>Telescope find_files search_dirs=resources/js/pages<cr>" },
        --      { "<leader>lt", "<cmd>Telescope find_files search_dirs=tests<cr>" },
    },
    cond = function()
        return false
        -- return fs_utils.exists_in_cwd("artisan")
    end,
    event = { "VeryLazy" },
    opts = {
        lsp_server = "intelephense",
    },
}
