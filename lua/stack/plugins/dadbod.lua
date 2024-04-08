return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod',                     lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    keys = {
        { '<leader>db', ':DBUIToggle<CR>' },
    },
    init = function()
        vim.api.nvim_command(
        "autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })")
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_use_nvim_notify = 1
    end
}
