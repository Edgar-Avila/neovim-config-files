local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

CompilerPicker = function(opts)
    opts = {}

    local builtInFiles = vim.split(
        vim.fn.glob(vim.env.VIMRUNTIME .. "/compiler/*.vim"),
        '\n',
        { trimempty = true }
    )

    local userFiles = vim.split(
        vim.fn.glob(vim.fn.stdpath("config") .. "/compiler/*.(vim|lua)"),
        '\n',
        { trimempty = true }
    )

    local compilers = {}

    for _, item in pairs(builtInFiles) do
        local compilerName = item:match("([^/]+)%.vim$")
        if compilerName then
            table.insert(compilers, compilerName)
        end
    end

    for _, item in pairs(userFiles) do
        local compilerName = item:match("([^/]+)%.(vim|lua)$")
        if compilerName then
            table.insert(compilers, compilerName)
        end
    end

    pickers.new(opts, {
        prompt_title = 'Compilers',
        sorter = conf.generic_sorter(opts),
        finder = finders.new_table {
            results = compilers,
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
                vim.cmd("compiler " .. selection.value)
                vim.notify("Compiler set to: " .. selection.value, vim.log.levels.INFO)
            end)
            return true
        end,
    }):find()
end
