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
    'kyazdani42/nvim-tree.lua',
    -- Status line
    'itchyny/lightline.vim',
    -- Fuzzy finder
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- Marks
    'ThePrimeagen/harpoon',
    -- require('user.plugins.harpoon'),
    -- Git integration
    'mhinz/vim-signify',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
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
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
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
                desc = "EasyAlign"
            }
        },
    },
    -- Multiple Cursors
    'mg979/vim-visual-multi',
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
     },
    -- File Icons
    'kyazdani42/nvim-web-devicons',
})

-- Plugins configuration
require 'user.plugins.telescope'
require 'user.plugins.colorscheme'
require 'user.plugins.nvimtree'
require 'user.plugins.harpoon'
require 'user.plugins.signify'
require 'user.plugins.cmp'
require 'user.plugins.lsp'
require 'user.plugins.treesitter'
-- require 'user.plugins.leap'
require 'user.plugins.floaterm'
