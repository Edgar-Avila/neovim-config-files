vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.encoding = 'utf-8'
vim.opt.clipboard = 'unnamedplus'
vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.wo.wrap = false
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.conceallevel = 2
vim.opt.foldenable = false
vim.g.mapleader = ' '

local projectfile = vim.fn.getcwd() .. '/project.godot'

if vim.fn.filereadable(projectfile) == 1 then
  local server_name = './godothost'
  local servers = vim.fn.serverlist()

  if not vim.tbl_contains(servers, server_name) then
    pcall(vim.fn.serverstart, server_name)
    print("Started Neovim server:", server_name)
  else
    print("Server already running:", server_name)
  end
end

