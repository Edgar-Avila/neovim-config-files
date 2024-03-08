return {
    "rest-nvim/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    ft = 'http',
    config = function()
        local rest_nvim = require "rest-nvim"
        rest_nvim.setup()

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "http",
            callback = function()
                local buff = tonumber(vim.fn.expand "<abuf>", 10)
                vim.keymap.set(
                    "n",
                    "<leader>hr",
                    rest_nvim.run,
                    { noremap = true, buffer = buff, desc = "Run near http request" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>hl",
                    rest_nvim.last,
                    { noremap = true, buffer = buff, desc = "Run last http resquest" }
                )
                vim.keymap.set("n", "<leader>hc", function()
                    rest_nvim.run(true)
                end, { noremap = true, buffer = buff, desc = "Preview http curl" })
            end,
        })
    end
}
