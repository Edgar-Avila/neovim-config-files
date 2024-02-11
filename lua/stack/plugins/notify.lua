return {
    "rcarriga/nvim-notify",
    keys = {
        {
            "<leader>nd",
            ":lua require('notify').dismiss()<CR>",
        }
    },
    config = function()
        local notify = require "notify"
        notify.setup({ background_colour = "#000000" })
        vim.notify = notify.notify
    end,
    event = "VeryLazy",
}
