return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'kyazdani42/nvim-web-devicons' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
        local ignored = { "node_modules/", "env/", "__pycache__/", "target/", "build/", "dist/", "vendor/",
            "bin/", "obj/", "deps/", "_build/" }

        if vim.loop.os_uname().sysname == "Windows_NT" then
            for i = 1, #ignored do
                ignored[i] = string.gsub(ignored[i], "/", "\\")
            end
        end

        require("telescope").setup({
            defaults = {
                file_ignore_patterns = ignored,
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        })
        require('stack.utils.format_picker');
        require('stack.utils.compiler_picker');
        pcall(require('telescope').load_extension, 'ui-select')
    end,
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", },              -- Files
        { "<leader>f.", "<cmd>Telescope find_files hidden=true<cr>", },  -- Tracked by git
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", },               -- Grep
        { "<leader>fb", "<cmd>Telescope buffers<cr>", },                 -- Buffers
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", },               -- Help tags
        { "<leader>fc", "<cmd>Telescope colorscheme<cr>", },             -- Colorscheme
        { "<leader>fC", "<cmd>lua CompilerPicker()<cr>", },              -- Colorscheme
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", },                -- Recent
        { "<leader>ft", "<cmd>Telescope builtin<cr>", },                 -- Telescope options
        { "<leader>fn", "<cmd>lua Snacks.notifier.show_history()<cr>", },-- Notify history
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", },                 -- Keymaps
        { "<leader>fu", "<cmd>Telescope spell_suggest<cr>", },           -- Spell suggestions
        { "<leader>fq", "<cmd>Telescope quickfix<cr>", },                -- Quickfix list

        -- Lsp mappings
        { "<leader>fR", "<cmd>Telescope lsp_references<cr>", },
        { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", },
        { "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", },
        { "<leader>fm", "<cmd>lua FormatterPicker()<cr>", },

        -- Git mappings
        { "<leader>gc", "<cmd>Telescope git_commits<cr>", },   -- Git commits
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", },  -- Git branches
        { "<leader>gf", "<cmd>Telescope git_files<cr>", },     -- Git files
        { "<leader>gS", "<cmd>Telescope git_status<cr>", },    -- Git status
    },
    cmd = { "Telescope" },
    event = "VeryLazy",
}
