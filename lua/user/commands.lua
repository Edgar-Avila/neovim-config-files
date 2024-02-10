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
end

-- Run js code
vim.api.nvim_command("autocmd filetype javascript map <buffer> <F5> :w<cr>:!node \"%\"<CR>")
vim.api.nvim_command("autocmd fileType javascript imap <buffer> <F5> <esc>:w<cr>:!node \"%\"<CR>")

-- Run ts code
vim.api.nvim_command("autocmd filetype typescript map <buffer> <F5> :w<cr>:!ts-node \"%\"<CR>")
vim.api.nvim_command("autocmd fileType typescript imap <buffer> <F5> <esc>:w<cr>:!ts-node \"%\"<CR>")

-- Set tab size for specific filetypes
vim.api.nvim_command("autocmd Filetype typescriptreact setlocal ts=2 sw=2 expandtab")
vim.api.nvim_command("autocmd Filetype javascriptreact setlocal ts=2 sw=2 expandtab")
vim.api.nvim_command("autocmd Filetype cpp setlocal ts=2 sw=2 expandtab")

-- Run bash code
if vim.loop.os_uname().sysname == "Linux" then
    vim.api.nvim_command("autocmd filetype sh map <buffer> <F5> :w<cr>:exec \"!bash\" shellescape(@%, 1)<cr>")
    vim.api.nvim_command("autocmd fileType sh imap <buffer> <F5> <esc>:w<cr>:exec \"!bash\" shellescape(@%, 1)<cr>")
end

-- Set angular filetypes
vim.api.nvim_command("autocmd BufRead,BufEnter *.component.html set filetype=angular")
