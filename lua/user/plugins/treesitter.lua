require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
      "python", 
      "cpp", 
      "typescript", 
      "javascript", 
      "go", 
      "rust", 
      "lua", 
      "vim",
      "json",
      "vue",
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
