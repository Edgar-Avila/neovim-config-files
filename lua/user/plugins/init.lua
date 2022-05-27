-- Load plugins
require('packer').startup(function(use)
    -- File Tree
    use 'scrooloose/nerdtree'
    -- Status line
    use 'itchyny/lightline.vim'
    -- Fuzzy finder
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    -- Git integration
    use 'mhinz/vim-signify'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    -- Theme
    use 'joshdick/onedark.vim'
    -- Lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    -- Snippets
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    -- Better highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- Dashboard
    use 'glepnir/dashboard-nvim'
end)

-- Plugins configuration
require 'user.plugins.nerdtree'
require 'user.plugins.signify'
require 'user.plugins.dashboard-nvim'
require 'user.plugins.telescope'
require 'user.plugins.lsp'
require 'user.plugins.treesitter'

-- Colorsheme
vim.cmd [[ colorscheme onedark ]]

