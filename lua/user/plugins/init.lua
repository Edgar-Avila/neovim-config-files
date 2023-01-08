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
        'folke/tokyonight.nvim',
        lazy = false,
        priority=1000,
        config = function ()
            vim.cmd [[ colorscheme tokyonight-night ]]
        end
    },
    'morhetz/gruvbox',
    'artanikin/vim-synthwave84',
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
    -- Surround behavior
    'tpope/vim-surround',
    -- Better highlighting
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    -- Dashboard
    'glepnir/dashboard-nvim',
    -- Multiple Cursors
    'mg979/vim-visual-multi',
    -- Neoclip
    'AckslD/nvim-neoclip.lua',
    -- Leap
    'tpope/vim-repeat',
    'ggandor/leap.nvim',
    -- Terminal
    'voldikss/vim-floaterm',
    -- File Icons
    'kyazdani42/nvim-web-devicons',
})

-- Plugins configuration
require 'user.plugins.colorscheme'
require 'user.plugins.nvimtree'
require 'user.plugins.harpoon'
require 'user.plugins.signify'
require 'user.plugins.dashboard-nvim'
require 'user.plugins.telescope'
require 'user.plugins.cmp'
require 'user.plugins.lsp'
require 'user.plugins.treesitter'
require 'user.plugins.leap'
require 'user.plugins.floaterm'

