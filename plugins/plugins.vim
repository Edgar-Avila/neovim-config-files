call plug#begin('~/.config/nvim/autoload/plugged')
    " File Tree
    Plug 'scrooloose/nerdtree'
    " Status line
    Plug 'itchyny/lightline.vim'
    " Fuzzy finder
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Git integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    " Theme
    Plug 'joshdick/onedark.vim'
    " Lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    " Snippets
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    " Completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'
    " Better highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/signify.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/treesitter.vim

" Colorsheme
colorscheme onedark
