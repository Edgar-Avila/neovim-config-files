return {
    'numToStr/Comment.nvim',
    event = "BufReadPre",
    config = function()
        require('Comment').setup()
        local ft = require('Comment.ft')
        -- ft.javascriptreact = { '{/*%s*/}' }
        -- ft.typescriptreact = { '{/*%s*/}' }
        ft.angular = ft.get('html')
        ft.heex = ft.get('html')
    end,
}
