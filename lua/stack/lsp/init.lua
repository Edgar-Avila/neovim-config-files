local lspconfig = require('lspconfig')
local fs_utils = require("stack.utils.filesystem")
local servers = require("stack.lsp.servers")
local config = require("stack.lsp.config")

for server_name, server_config in pairs(servers) do
    local disable_file = "nvim-" .. server_name .. "-disable"
    local disable_exists = fs_utils.exists_in_cwd(disable_file)
    local enabled = not server_config.nvim_disable
    local should_setup = enabled and not disable_exists

    if should_setup then
        lspconfig[server_name].setup(config(server_config))
    end
end
