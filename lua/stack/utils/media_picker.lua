local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local media_types = { "mp3", "mp4", "wav", "flac", "mkv", "avi", "mov", "jpg",
    "png", "gif", "webm", "jpeg", "bmp", "tiff", "pdf", "epub" }

local function bookmark_picker(opts)
    opts = opts or {}
    pickers.new(opts, {
        finder = finders.new_oneshot_job(
            { "rg", "--files", "--glob", "*.{"
                .. table.concat(media_types, ",") .. "}" },
            {
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry,
                        ordinal = entry,
                    }
                end,
            }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.ui.open(selection.value)
            end)
            return true
        end,
    }):find()
end

return bookmark_picker
