local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function url_encode(url)
    return (string.gsub(url, "([^%w%.%- ])", function(c)
        return string.format("%%%02X", string.byte(c))
    end):gsub(" ", "+"))
end

local searchOpts = {
    { name = "DuckDuckGo",      keymap = "<C-d>",                                          url = "https://duckduckgo.com/?q=" },
    { name = "Wikipedia",       keymap = "<C-w>",                                          url = "https://en.wikipedia.org/wiki/Special:Search?search=" },
    { name = "YouTube",         keymap = "<C-y>",                                          url = "https://www.youtube.com/results?search_query=" },
    { name = "Google",          url = "https://www.google.com/search?q=" },
    { name = "ChatGPT",         url = "https://chat.openai.com/?prompt=" },
    { name = "Stack Overflow",  url = "https://stackoverflow.com/search?q=" },
    { name = "CPP Reference",   url = "https://duckduckgo.com/?q=site:cppreference.com%20" },
    { name = "Translate-EN",    url = "https://translate.google.com/?sl=auto&tl=en&text=" },
    { name = "Translate-ES",    url = "https://translate.google.com/?sl=auto&tl=es&text=" },
    { name = "Merriam-Webster", url = "https://www.merriam-webster.com/dictionary/" },
}

local function with_prompt(searchOpt, prompt)
    return {
        name = searchOpt.name .. ": '" .. prompt .. "'",
        url = searchOpt.url .. url_encode(prompt),
        keymap = searchOpt.keymap,
    }
end

local function web_picker(opts)
    opts = opts or {}
    pickers.new(opts, {
        finder = finders.new_dynamic({
            fn = function(prompt)
                local filtered = {}
                for _, searchOpt in ipairs(searchOpts) do
                    table.insert(filtered, with_prompt(searchOpt, prompt))
                end
                return filtered
            end,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.name,
                    ordinal = entry.name,
                }
            end,
        }),
        sorter = sorters.empty(),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.ui.open(selection.value.url)
            end)

            local function select_n(n)
                print(n)
                actions.move_to_bottom(prompt_bufnr)
                for _ = 1, n - 1 do
                    actions.move_selection_previous(prompt_bufnr)
                end
                actions.select_default(prompt_bufnr)
            end

            for i, searchOpt in ipairs(searchOpts) do
                if searchOpt.keymap ~= nil then
                    map("i", searchOpt.keymap, function() select_n(i) end, { desc = searchOpt.name })
                end
            end

            return true
        end,
    }):find()
end

return web_picker
