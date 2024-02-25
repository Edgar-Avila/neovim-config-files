local workspaces_env = vim.env.NVIM_NOTE_WORKSPACES
local dirman_workspaces = {}

if workspaces_env ~= nil then
    local workspaces = vim.split(workspaces_env, ";")
    local sep = "/"
    if vim.loop.os_uname().sysname == "Windows_NT" then
        sep = "\\"
    end
    for _, workspace in ipairs(workspaces) do
        local parts = vim.split(workspace, sep)
        local name = parts[#parts]
        dirman_workspaces[name] = workspace
    end
end

return {
    "nvim-neorg/neorg",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    build = ":Neorg sync-parsers",
    lazy = true,
    ft = "norg",
    cmd = "Neorg",
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.summary"] = {},
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    }
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = dirman_workspaces,
                    },
                },
            },
        }
    end,
}
