return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup({
            theme = 'doom',
            config = {
                header = {
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
                    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
                    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
                    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
                    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
                    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
                    '',
                    '',
                    '',
                },
                center = {
                    {
                        icon = ' ',
                        desc = 'Find File           ',
                        key = 'f',
                        keymap = 'SPC f f',
                        key_format = ' %s',
                        action = 'Telescope find_files'
                    },
                    {
                        icon = ' ',
                        desc = 'Find Projects',
                        key = 'p',
                        keymap = 'SPC f p',
                        key_format = ' %s',
                        action = 'Telescope project'
                    },
                    {
                        icon = ' ',
                        desc = 'Find Recent Files',
                        key = 'r',
                        keymap = 'SPC f r',
                        key_format = ' %s',
                        action = 'Telescope oldfiles'
                    },
                    {
                        icon = ' ',
                        desc = 'Find Colorscheme',
                        key = 'c',
                        keymap = 'SPC f c',
                        key_format = ' %s',
                        action = 'Telescope colorscheme'
                    },
                },
                -- footer = {}
            }
        })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
