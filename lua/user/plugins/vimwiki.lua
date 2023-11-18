return {
  "vimwiki/vimwiki",
  keys = {
      { "<leader>ww" }
  },
  init = function()
    vim.g.vimwiki_global_ext = 0
  end,
}
