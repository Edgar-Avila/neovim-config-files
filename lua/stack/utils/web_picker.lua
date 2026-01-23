local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local action_set = require("telescope.actions.set")

local function url_encode(url)
    return (string.gsub(url, "([^%w%.%- ])", function(c)
        return string.format("%%%02X", string.byte(c))
    end):gsub(" ", "+"))
end

local searchOpts = {
    { name = "DuckDuckGo", keymap = "<C-d>", url = "https://duckduckgo.com/?q=" },
    { name = "Wikipedia",  keymap = "<C-w>", url = "https://en.wikipedia.org/wiki/Special:Search?search=" },
    { name = "YouTube",    keymap = "<C-y>", url = "https://www.youtube.com/results?search_query=" },
    { name = "Google",     keymap = "<C-g>", url = "https://www.google.com/search?q=" },
    { name = "ChatGPT",    keymap = "<C-h>", url = "https://chat.openai.com/?prompt=" },
    { name = "Stack Overflow", keymap = "<C-s>", url = "https://stackoverflow.com/search?q=" },
    { name = "CPP Reference", keymap = "<C-r>", url = "https://duckduckgo.com/?q=site:cppreference.com%20" },
    { name = "Translate-EN",  keymap = "<C-t>", url = "https://translate.google.com/?sl=auto&tl=en&text=" },
    { name = "Translate-ES",  keymap = "<C-e>", url = "https://translate.google.com/?sl=auto&tl=es&text=" },
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
                vim.cmd("Open " .. vim.fn.fnameescape(selection.value.url))
            end)

            local function select_n(n)
                -- -- Should be the correct way, doesn't work ¯\_(ツ)_/¯
                -- action_state.get_current_picker(prompt_bufnr)
                -- picker:set_selection(n)
                actions.move_to_bottom(prompt_bufnr)
                action_set.shift_selection(prompt_bufnr, -n + 1)
                actions.select_default(prompt_bufnr)
            end

            for i, searchOpt in ipairs(searchOpts) do
                map("i", searchOpt.keymap, function() select_n(i) end, { desc = searchOpt.name })
            end

            return true
        end,
    }):find()
end

return web_picker
