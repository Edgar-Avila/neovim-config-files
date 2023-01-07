local dashboard = require('dashboard')
dashboard.custom_header = {
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

dashboard.custom_center = {
    recent =       { icon=' ', icon_hl={fg='#FF8246'}, desc = 'Recent files                  ', shortcut='SPC fr', action = 'Telescope oldfiles' },
    live_grep =    { icon=' ', icon_hl={fg='#FF8246'}, desc = 'Live Grep                     ', shortcut='SPC fg', action = 'Telescope live_grep' },
    buffers =      { icon='﬘ ', icon_hl={fg='#FF8246'}, desc = 'Buffers                       ', shortcut='SPC fb', action = 'Telescope buffers' },
    builtins =     { icon=' ', icon_hl={fg='#FF8246'}, desc = 'Telescope picker              ', shortcut='SPC ft', action = 'Telescope builtins' },
    colorscheme =  { icon=' ', icon_hl={fg='#FF8246'}, desc = 'Change colorscheme            ', shortcut='SPC fc', action = 'Telescope colorscheme' },
    git_status =   { icon=' ', icon_hl={fg='#FF8246'}, desc = 'Git status                    ', shortcut='SPC gs', action = 'Telescope git_status' },
    git_commits =  { icon=' ', icon_hl={fg='#FF8246'}, desc = 'Git commits                   ', shortcut='SPC gc', action = 'Telescope git_commits' },
}

vim.cmd [[ highlight DashboardHeader guifg=#F0A500 ]]
vim.cmd [[ highlight DashboardCenter guifg=#E8E8E8 ]]
vim.cmd [[ highlight DashboardShortCut guifg=#FFD36E ]]
vim.cmd [[ highlight DashboardFooter guifg=#F05454 ]]
