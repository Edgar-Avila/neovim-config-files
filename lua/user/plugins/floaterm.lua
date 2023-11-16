return {
    'voldikss/vim-floaterm',
    cmd = { 'FloatermNew', 'FloatermToggle', 'FloatermNext', 'FloatermPrev' },
    lazy = true,
    init = function()
        vim.g.floaterm_gitcommit = 'floaterm'
        vim.g.floaterm_autoinsert = 1
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_wintitle = 0
        vim.g.floaterm_autoclose = 1

        if vim.loop.os_uname().sysname == "Windows_NT" then
            vim.g.floaterm_shell = 'pwsh.exe'
        end
    end,
    keys = {
        { "<leader>tt", ":FloatermToggle<CR>" },
        { "<leader>t;", ":FloatermNew<CR>" },
        { "<leader>tg", ":FloatermNew lazygit<CR>" },
        { "<F1>",       ":FloatermToggle<CR>" },
        { "<F2>",       ":FloatermPrev<CR>" },
        { "<F3>",       ":FloatermNext<CR>" },
        { "<F4>",       ":FloatermNew<CR>" },
        { "<F1>",       "<C-\\><C-n>:FloatermToggle<CR>", mode = "t" },
        { "<F2>",       "<C-\\><C-n>:FloatermPrev<CR>",   mode = "t" },
        { "<F3>",       "<C-\\><C-n>:FloatermNext<CR>",   mode = "t" },
        { "<F4>",       "<C-\\><C-n>:FloatermNew<CR>",    mode = "t" },
    }
}
