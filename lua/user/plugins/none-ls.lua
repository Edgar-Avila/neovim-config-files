return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local null_ls = require("null-ls")
        local sources = {
            null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.formatting.prettier,
        }
        null_ls.setup({
            sources = sources,
        })
    end
}