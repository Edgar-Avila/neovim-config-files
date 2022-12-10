-- Load plugins
require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'
    -- File Tree
    use 'kyazdani42/nvim-tree.lua'
    -- Status line
    use 'itchyny/lightline.vim'
    -- Fuzzy finder
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    -- Marks
    use 'ThePrimeagen/harpoon'
    -- Git integration
    use 'mhinz/vim-signify'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    -- Theme
    use 'olimorris/onedarkpro.nvim'
    use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim'
    use 'artanikin/vim-synthwave84'
    -- Lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'onsails/lspkind.nvim'
    -- Snippets
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    -- Surround behavior
    use 'tpope/vim-surround'
    -- Better highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- Dashboard
    use 'glepnir/dashboard-nvim'
    -- Multiple Cursors
    use 'mg979/vim-visual-multi'
    -- Neoclip
    use 'AckslD/nvim-neoclip.lua'
    -- Leap
    use 'tpope/vim-repeat'
    use 'ggandor/leap.nvim'
    -- Terminal
    use 'akinsho/toggleterm.nvim'
    -- File Icons
    use 'kyazdani42/nvim-web-devicons'
end)

-- Plugins configuration
require 'user.plugins.nvimtree'
require 'user.plugins.signify'
require 'user.plugins.dashboard-nvim'
require 'user.plugins.telescope'
require 'user.plugins.cmp'
require 'user.plugins.lsp'
require 'user.plugins.treesitter'
require 'user.plugins.leap'
require 'user.plugins.toggleterm'

-- Colorsheme
vim.cmd [[ colorscheme gruvbox ]]

