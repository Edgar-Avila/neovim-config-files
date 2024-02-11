local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

FormatterPicker = function(opts)
    opts = {}

    local buf_clients = vim.lsp.buf_get_clients()

    if vim.tbl_isempty(buf_clients) then
        vim.notify("No LSP clients available to format", vim.log.levels.WARN)
        return
    end

    local clients = {}
    for _, client in pairs(buf_clients) do
        if client.server_capabilities and client.server_capabilities.documentFormattingProvider then
            clients[#clients + 1] = client.name
        end
    end

    pickers.new(opts, {
        prompt_title = 'LSP Format',
        sorter = conf.generic_sorter(opts),
        finder = finders.new_table {
            results = clients,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry,
                    ordinal = entry,
                }
            end,
        },
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.print(selection)
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == selection.value
                    end
                })
            end)
            return true
        end,
    }):find()
end
