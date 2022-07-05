-- vim.g.dashboard_custom_header = {
--     '          ▀████▀▄▄              ▄█ ',
--     '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
--     '    ▄        █          ▀▀▀▀▄  ▄▀  ',
--     '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
--     '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
--     '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
--     '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
--     '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
--     '   █   █  █      ▄▄           ▄▀   ',
-- }

vim.g.dashboard_custom_header = {
    '                                                       ',
    '                                                       ',
    '                                                       ',
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

vim.g.dashboard_custom_section = {
    recent =       { description = {'Recent files                  SPC fr'}, command = 'Telescope oldfiles' },
    live_grep =    { description = {'Live Grep                     SPC fg'}, command = 'Telescope live_grep' },
    buffers =      { description = {'Buffers                       SPC fb'}, command = 'Telescope buffers' },
    builtins =     { description = {'Telescope pickers             SPC ft'}, command = 'Telescope builtins' },
    colorscheme =  { description = {'Change colorscheme            SPC fc'}, command = 'Telescope colorscheme' },
    git_status =   { description = {'Git status                    SPC gs'}, command = 'Telescope git_status' },
    git_commits =  { description = {'Git commits                   SPC gc'}, command = 'Telescope git_commits' },
}
vim.g.dashboard_default_exclusive = 'telescope'
