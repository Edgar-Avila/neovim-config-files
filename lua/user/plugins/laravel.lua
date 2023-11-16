return {
    "adalessa/laravel.nvim",
    lazy = true,
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer" },
    config = function()
        require("laravel").setup()
        require("telescope").load_extension("laravel")
    end
}
