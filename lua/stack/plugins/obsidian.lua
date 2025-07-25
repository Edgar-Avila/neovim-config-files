return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/notes/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/notes/**.md",
    },
    keys = {
        { "<leader>ow", "<cmd>ObsidianWorkspace<cr>" },
        { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>" },
        { "<leader>ot", "<cmd>ObsidianTags<cr>" },
        { "<leader>on", "<cmd>ObsidianNew<cr>" },
        { "<leader>oo", "<cmd>ObsidianOpen<cr>" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "uni",
                path = "~/notes/uni",
            },
            {
                name = "dev",
                path = "~/notes/dev",
            },
            {
                name = "personal",
                path = "~/notes/personal",
            },
        },
        notes_subdir = "zettelkasten",
        preferred_link_style = "markdown",
        ui = { enable = false },
        templates = {
            subdir = "templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function
            substitutions = {},
        },
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,
    },
}
