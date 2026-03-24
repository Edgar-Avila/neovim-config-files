local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local searchOpts = {
    { name = "YouTube",    to = "https://www.youtube.com" },
    { name = "LeetCode",   to = "https://www.leetcode.com" },
    { name = "Twitch",     to = "https://www.twitch.tv" },
    { name = "Monkeytype", to = "https://www.monkeytype.com" },
    { name = "Excalidraw", to = "https://www.excalidraw.com" },
    { name = "ChatGPT",    to = "https://chat.openai.com" },
    { name = "GitHub",     to = "https://www.github.com" },
    { name = "Wikipedia",  to = "https://www.wikipedia.org" },
    { name = "Pomofocus",  to = "https://pomofocus.io" },
}

local function bookmark_picker(opts)
    opts = opts or {}
    pickers.new(opts, {
        finder = finders.new_table({
            results = searchOpts,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.name,
                    ordinal = entry.name,
                }
            end,
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.ui.open(selection.value.to)
            end)
            return true
        end,
    }):find()
end

return bookmark_picker
