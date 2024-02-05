return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        auto_install = true,
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@conditional.outer",
                    ["ic"] = "@conditional.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@comment",
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@comment",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@comment",
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@comment",
                },
            }
        },
    },
    config = function (_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
    event = { 'BufReadPre', 'BufNewFile' },
}
