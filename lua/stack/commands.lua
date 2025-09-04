-- Run Python code
vim.api.nvim_command("autocmd filetype python map <buffer> <F5> :w<cr>:exec \"!python\" shellescape(@%, 1)<cr>")
vim.api.nvim_command("autocmd filetype python imap <buffer> <F5> <esc>:w<cr>:exec \"!python\" shellescape(@%, 1)<cr>")

-- Run Go code
vim.api.nvim_command("autocmd filetype go map <buffer> <F5> :w<cr>:exec \"!go run .\"<CR>")
vim.api.nvim_command("autocmd fileType go imap <buffer> <F5> <esc>:w<cr>:exec \"go run .\"<CR>")
vim.api.nvim_command("autocmd filetype go map <buffer> <F6> :w<cr>:exec \"!go build .\"<CR>")
vim.api.nvim_command("autocmd fileType go imap <buffer> <F6> <esc>:w<cr>:exec \"go build .\"<CR>")

-- Run Rust code
vim.api.nvim_command("autocmd filetype rust map <buffer> <F5> :w<cr>:exec \"!cargo run\"<CR>")
vim.api.nvim_command("autocmd fileType rust imap <buffer> <F5> <esc>:w<cr>:exec \"!cargo run\"<CR>")
vim.api.nvim_command("autocmd filetype rust map <buffer> <F6> :w<cr>:exec \"!cargo build\"<CR>")
vim.api.nvim_command("autocmd fileType rust imap <buffer> <F6> <esc>:w<cr>:exec \"!cargo build\"<CR>")

-- Run cpp code
-- WARNING: Quick one file debugging, use a proper build system for anything else
if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.api.nvim_command("autocmd filetype cpp map <buffer> <F5> :w<cr>:exec \"!g++ % -g -o main.exe && .\\\\main.exe\"<CR>")
    vim.api.nvim_command("autocmd fileType cpp imap <buffer> <F5> <esc>:w<cr>:exec \"!g++ % -g -o main.exe && .\\\\main.exe\"<CR>")
    vim.api.nvim_command("autocmd filetype cpp map <buffer> <F6> :w<cr>:exec \"!g++ % -g -o main.exe\"<CR>")
    vim.api.nvim_command("autocmd fileType cpp imap <buffer> <F6> <esc>:w<cr>:exec \"!g++ % -g -o main.exe\"<CR>")
else
    vim.api.nvim_command("autocmd filetype cpp map <buffer> <F5> :w<cr>:exec \"!g++ % -g -o main && ./main\"<CR>")
    vim.api.nvim_command("autocmd fileType cpp imap <buffer> <F5> <esc>:w<cr>:exec \"!g++ % -g -o main && ./main\"<CR>")
    vim.api.nvim_command("autocmd filetype cpp map <buffer> <F6> :w<cr>:exec \"!g++ % -g -o main\"<CR>")
    vim.api.nvim_command("autocmd fileType cpp imap <buffer> <F6> <esc>:w<cr>:exec \"!g++ % -g -o main\"<CR>")
    vim.api.nvim_command("autocmd filetype cpp map <buffer> <leader>br :w<cr>:exec \"!make && ./main\"<CR>")
end

vim.api.nvim_command("autocmd filetype c map <buffer> <leader>br :w<cr>:exec \"!make && ./main\"<CR>")

-- Run js code
vim.api.nvim_command("autocmd filetype javascript map <buffer> <F5> :w<cr>:!node \"%\"<CR>")
vim.api.nvim_command("autocmd fileType javascript imap <buffer> <F5> <esc>:w<cr>:!node \"%\"<CR>")

-- Run ts code
vim.api.nvim_command("autocmd filetype typescript map <buffer> <F5> :w<cr>:!ts-node \"%\"<CR>")
vim.api.nvim_command("autocmd fileType typescript imap <buffer> <F5> <esc>:w<cr>:!ts-node \"%\"<CR>")

-- Set tab size for specific filetypes
vim.api.nvim_command("autocmd Filetype typescriptreact setlocal ts=2 sw=2 expandtab")
vim.api.nvim_command("autocmd Filetype javascriptreact setlocal ts=2 sw=2 expandtab")
vim.api.nvim_command("autocmd Filetype javascript setlocal ts=2 sw=2 expandtab")
vim.api.nvim_command("autocmd Filetype typescript setlocal ts=2 sw=2 expandtab")
vim.api.nvim_command("autocmd Filetype vue setlocal ts=2 sw=2 expandtab")
-- vim.api.nvim_command("autocmd Filetype cpp setlocal ts=2 sw=2 expandtab")
-- vim.api.nvim_command("autocmd Filetype c setlocal ts=2 sw=2 expandtab")

-- Run bash code
if vim.loop.os_uname().sysname == "Linux" then
    vim.api.nvim_command("autocmd filetype sh map <buffer> <F5> :w<cr>:exec \"!bash\" shellescape(@%, 1)<cr>")
    vim.api.nvim_command("autocmd fileType sh imap <buffer> <F5> <esc>:w<cr>:exec \"!bash\" shellescape(@%, 1)<cr>")
end

-- Set filetypes
vim.api.nvim_command("autocmd BufRead,BufEnter *.component.html set filetype=angular")
vim.api.nvim_command("autocmd BufRead,BufEnter *.templ set filetype=templ")
vim.api.nvim_command("autocmd BufRead,BufEnter *.blade.php set filetype=blade")

-- Spell check spanish md files
vim.api.nvim_command("autocmd BufRead,BufNewFile *.md setlocal spell spelllang=es")
vim.api.nvim_command("autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=es")

-- Remove trailing whitespace on save
-- vim.api.nvim_command("autocmd BufWritePre * %s/\\s\\+$//e")
vim.api.nvim_command("autocmd filetype plantuml map <buffer> <F5> :w<cr>:exec \"!java -jar plantuml.jar %\"<CR>")

vim.api.nvim_command([[
  autocmd BufWritePost *.puml silent! exec "!java -jar plantuml.jar %" | redraw!
]])

vim.api.nvim_command(string.format(
  "autocmd FileType plantuml map <buffer> <F5> :w<CR>:exec \"!java -jar %s %%\"<CR>",
  vim.g.plantumlJar
))

if vim.g.plantumlCompileOnSave then
    vim.api.nvim_command(string.format(
      "autocmd BufWritePost *.puml silent! exec \"!java -jar %s %%\" | redraw!",
      vim.g.plantumlJar
    ))
end
