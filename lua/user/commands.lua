-- Run Python code
vim.api.nvim_command("autocmd filetype python map <buffer> <f5> :w<cr>:exec \"!python\" shellescape(@%, 1)<cr>")
vim.api.nvim_command("autocmd filetype python imap <buffer> <f5> <esc>:w<cr>:exec \"!python\" shellescape(@%, 1)<cr>")

-- Run Go code
vim.api.nvim_command("autocmd filetype go map <buffer> <f5> :w<cr>:exec \"!go run .\"<CR>")
vim.api.nvim_command("autocmd fileType go imap <buffer> <F5> <esc>:w<cr>:exec \"go run .\"<CR>")

-- Run Rust code
vim.api.nvim_command("autocmd filetype rust map <buffer> <f5> :w<cr>:exec \"!cargo run\"<CR>")
vim.api.nvim_command("autocmd fileType rust imap <buffer> <F5> <esc>:w<cr>:exec \"!cargo run\"<CR>")

-- Run cpp code
vim.api.nvim_command("autocmd filetype cpp map <buffer> <f5> :w<cr>:exec \"!cmake .\"<CR>")
vim.api.nvim_command("autocmd fileType cpp imap <buffer> <F5> <esc>:w<cr>:exec \"!cmake .\"<CR>")

-- Run js code
vim.api.nvim_command("autocmd filetype javascript map <buffer> <f5> :w<cr>:!node \"%\"<CR>")
vim.api.nvim_command("autocmd fileType javascript imap <buffer> <F5> <esc>:w<cr>:!node \"%\"<CR>")

-- Run ts code
vim.api.nvim_command("autocmd filetype typescript map <buffer> <f5> :w<cr>:!ts-node \"%\"<CR>")
vim.api.nvim_command("autocmd fileType typescript imap <buffer> <F5> <esc>:w<cr>:!ts-node \"%\"<CR>")

-- Set tab size for specific filetypes
vim.api.nvim_command("autocmd Filetype typescriptreact setlocal ts=2 sw=2 expandtab")
vim.api.nvim_command("autocmd Filetype javascriptreact setlocal ts=2 sw=2 expandtab")
vim.api.nvim_command("autocmd Filetype cpp setlocal ts=2 sw=2 expandtab")
