local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local servers = require("stack.lsp.servers")
local action_state = require("telescope.actions.state")
local fs_utils = require("stack.utils.filesystem")

local function lsp_picker(opts)
    opts = opts or {}
    local server_names = vim.tbl_keys(servers)

    pickers.new(opts, {
        prompt_title = 'Create or remove lsp disable file',
        finder = finders.new_table {
            results = server_names,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry,
                    ordinal = entry,
                }
            end,
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local server_name = selection.value
                local filename = 'nvim-' .. server_name .. '-disable'
                local fileexists = fs_utils.exists_in_cwd(filename)

                if fileexists then
                    fs_utils.delete_empty_file_cwd(filename)
                else
                    fs_utils.create_empty_file_cwd(filename)
                end

                fs_utils.add_to_git_exclude(filename)
            end)
            return true
        end,
    }):find()
end

return lsp_picker
