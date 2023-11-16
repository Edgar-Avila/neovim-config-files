return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        { 'onsails/lspkind.nvim' },
        -- Snippets
        { 'hrsh7th/cmp-vsnip' },
        { 'hrsh7th/vim-vsnip' },
        -- Sources
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/cmp-path' },
    },
    event = "VeryLazy",
    config = function()
        local cmp = require 'cmp'
        local lspkind = require 'lspkind'
        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    symbol_map = {
                        Text = "",
                        Method = "",
                        Function = "",
                        Constructor = "",
                        Field = "ﰠ",
                        Variable = "",
                        Class = "ﴯ",
                        Interface = "",
                        Module = "",
                        Property = "ﰠ",
                        Unit = "塞",
                        Value = "",
                        Enum = "",
                        Keyword = "",
                        Snippet = "",
                        Color = "",
                        File = "",
                        Reference = "",
                        Folder = "",
                        EnumMember = "",
                        Constant = "",
                        Struct = "פּ",
                        Event = "",
                        Operator = "",
                        TypeParameter = ""
                    },
                    menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        vsnip = "[VSnip]",
                        path = "[Path]",
                    })
                }),
            },
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                -- ['<C-k>'] = cmp.mapping.select_prev_item(),
                -- ['<C-j>'] = cmp.mapping.select_next_item(),
                -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                -- ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-1),
                ['<C-d>'] = cmp.mapping.scroll_docs(1),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' },
                { name = 'path' },
                { name = 'buffer' }
            })
        })

        -- Use buffer source for `/`
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':'
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'cmdline'},
            }, {
                { name = 'path' },
            }),
        })

        -- Remap tab in command mode
        vim.keymap.set('c', '<tab>', '<C-z>', { silent = false })
    end
}
