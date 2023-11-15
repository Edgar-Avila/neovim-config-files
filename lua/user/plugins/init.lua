vim.g.mapleader = ' '
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
    -- Theme
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                term_colors = true,
                transparent_background = true,
                integrations = {
                    mason = true,
                    leap = true,
                    nvimtree = true,
                    cmp = true,
                    harpoon = true,
                    telescope = true,
                    treesitter = true,
                }
            })
            vim.g.lightline = { colorscheme = "catppuccin" }
            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        'dracula/vim',
        lazy = true,
    },
    {
        'morhetz/gruvbox',
        lazy = true,
    },
    -- File Tree
    {
        'kyazdani42/nvim-tree.lua',
        keys = {
            {
                "<leader>n",
                ":NvimTreeToggle<CR>",
            }
        },
        main = 'nvim-tree',
        config = function ()
            require('nvim-tree').setup()
        end
    },
    -- Status line
    'itchyny/lightline.vim',
    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-lua/popup.nvim'},
            {'kyazdani42/nvim-web-devicons'},
        },
        config = function ()
            local ignored = {"node_modules/.*", "env/.*", "__pycache__/*", "target/.*", "build/*", "dist/*", "vendor\\*", "bin\\*", "obj\\*"}

            if vim.loop.os_uname().sysname == "Windows_NT" then
                for i = 1, #ignored do
                    ignored[i] = string.gsub(ignored[i], "/", "\\")
                end
            end

            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = ignored
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true,
                    },
                },
            })
        end,
        keys = {
            { "<leader>ff",  "<cmd>Telescope find_files<cr>",             }, -- Files
            { "<leader>f.",  "<cmd>Telescope find_files hidden=true<cr>", }, -- Tracked by git
            { "<leader>fg",  "<cmd>Telescope live_grep<cr>",              }, -- Grep
            { "<leader>fb",  "<cmd>Telescope buffers<cr>",                }, -- Buffers
            { "<leader>fh",  "<cmd>Telescope help_tags<cr>",              }, -- Help tags
            { "<leader>fc",  "<cmd>Telescope colorscheme<cr>",            }, -- Colorscheme
            { "<leader>fr",  "<cmd>Telescope oldfiles<cr>",               }, -- Recent
            { "<leader>ft",  "<cmd>Telescope builtin<cr>",                }, -- Telescope options
            { "<leader>fy",  "<cmd>Telescope neoclip plus<cr>",           }, -- Tracked by git
            { "<leader>fpa", "<cmd>Artisan<cr>",                          }, -- Artisan

            -- Lsp mappings
            { "<leader>fR", "<cmd>Telescope lsp_references<cr>",        },
            { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>",  },
            { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", },
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>",           },

            -- Git mappings
            { "<leader>gc", "<cmd>Telescope git_commits<cr>",  },
            { "<leader>gs", "<cmd>Telescope git_status<cr>",   },
            { "<leader>gb", "<cmd>Telescope git_branches<cr>", },
            { "<leader>gf", "<cmd>Telescope git_files<cr>",    }, -- Tracked by git
        }
    },
    -- Marks
    require('user.plugins.harpoon'),
    -- Git integration
    {
        'mhinz/vim-signify',
        init = function ()
            vim.opt.updatetime=100
        end
    },
    {
        'tpope/vim-fugitive',
        keys = { {"<leader>gd", "<cmd>Gvdiffsplit<cr>"} },
        cmd = { "G", "Git", "GBrowse" },
        lazy = true,
    },
    {
        'tpope/vim-rhubarb',
        cmd = { "GBrowse" },
        lazy = true,
    },
    -- Lsp
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'onsails/lspkind.nvim',
    'ray-x/lsp_signature.nvim',
    -- Snippets
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    -- Completion
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
    {
        "adalessa/laravel.nvim",
        lazy = true,
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        cmd = { "Sail", "Artisan", "Composer" },
        config = function()
            require("laravel").setup()
            require("telescope").load_extension("laravel")
        end
    },
    -- Surround behavior
    'tpope/vim-surround',
    -- Better highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' ,
        opts = {
            ensure_installed = {
                "python",
                "typescript",
                "javascript",
                "go",
                "lua",
                "json",
            },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    },
    -- Comment stuff
    {
        'tpope/vim-commentary',
        keys = {
            { "gcc", desc = "Comment current line" },
            { "gc", mode = "v", desc = "Comment selected text" }
        },
        config = true,
    },
    -- Easy align
    {
        "junegunn/vim-easy-align",
        keys = {
            {
                "ga",
                "<Plug>(EasyAlign)",
                mode = { "n", "v" },
            }
        },
    },
    -- Multiple Cursors
    {
        'mg979/vim-visual-multi',
        keys = { 
            { "<C-n>" },
            { "<C-Up>" },
            { "<C-Down>" },
        },
    },
    'tpope/vim-repeat',
    -- Neoclip
    {
        'AckslD/nvim-neoclip.lua',
        lazy = true,
        config = function()
            require('neoclip').setup()
            require("telescope").load_extension('neoclip')
        end
    },
    -- Terminal
     {
        'voldikss/vim-floaterm',
        cmd = { 'FloatermNew', 'FloatermToggle', 'FloatermNext', 'FloatermPrev' },
        lazy = true,
        init = function ()
            vim.g.floaterm_gitcommit='floaterm'
            vim.g.floaterm_autoinsert=1
            vim.g.floaterm_width=0.8
            vim.g.floaterm_height=0.8
            vim.g.floaterm_wintitle=0
            vim.g.floaterm_autoclose=1

            if vim.loop.os_uname().sysname == "Windows_NT" then
                vim.g.floaterm_shell='pwsh.exe'
            end
        end,
        keys = {
            { "<leader>tt", ":FloatermToggle<CR>" },
            { "<leader>t;", ":FloatermNew<CR>" },
            { "<leader>tg", ":FloatermNew lazygit<CR>" },
            { "<F1>", ":FloatermToggle<CR>" },
            { "<F2>", ":FloatermPrev<CR>" },
            { "<F3>", ":FloatermNext<CR>" },
            { "<F4>", ":FloatermNew<CR>" },
            { "<F1>", "<C-\\><C-n>:FloatermToggle<CR>", mode = "t" },
            { "<F2>", "<C-\\><C-n>:FloatermPrev<CR>", mode = "t" },
            { "<F3>", "<C-\\><C-n>:FloatermNext<CR>", mode = "t" },
            { "<F4>", "<C-\\><C-n>:FloatermNew<CR>", mode = "t" },
        }
     },
})

-- Plugins configuration
-- require 'user.plugins.telescope'
-- require 'user.plugins.colorscheme'
-- require 'user.plugins.nvimtree'
-- require 'user.plugins.harpoon'
-- require 'user.plugins.signify'
require 'user.plugins.cmp'
require 'user.plugins.lsp'
-- require 'user.plugins.treesitter'
-- require 'user.plugins.leap'
-- require 'user.plugins.floaterm'
