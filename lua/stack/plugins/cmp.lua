return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        { 'onsails/lspkind.nvim' },
        -- Snippets
        {
            'L3MON4D3/LuaSnip',
            dependencies = {
                { "rafamadriz/friendly-snippets" },
            }
        },
        { 'saadparwaiz1/cmp_luasnip' },
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
        require("luasnip.loaders.from_vscode").lazy_load()
        cmp.setup({
            preselect = cmp.PreselectMode.None,
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    maxwidth = 50,
                    ellipsis_char = '...',
                }),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-1),
                ['<C-d>'] = cmp.mapping.scroll_docs(1),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<C-h>'] = cmp.mapping(
                    function(callback)
                        local luasnip = require('luasnip')
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            callback()
                        end
                    end,
                    { 'i', 's' }
                ),
                ['<C-l>'] = cmp.mapping(
                    function(callback)
                        local luasnip = require('luasnip')
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            callback()
                        end
                    end,
                    { 'i', 's' }
                )
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer' },
                { name = 'neorg' },
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
                { name = 'cmdline' },
            }, {
                { name = 'path' },
            }),
        })

        -- Remap tab in command mode
        vim.keymap.set('c', '<tab>', '<C-z>', { silent = false })
    end
}
