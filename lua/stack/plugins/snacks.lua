return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        notifier = {},
        scratch = {},
        bigfile = {},
        dashboard = {},
        zen = {
            toggles = {
                dim = false,
            }
        },
        styles = {
            zen = {
                width = 100,
            }
        }
    },
    keys = {
        { "<leader>..", function() Snacks.scratch() end,        desc = "Toggle Scratch Buffer" },
        { "<leader>.f", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        { "<leader>z",  function() Snacks.zen() end,            desc = "Toggle zen mode" },
        { "<leader>nd", function() Snacks.notifier.hide() end,  desc = "Dismiss notifications" },
    }
}
