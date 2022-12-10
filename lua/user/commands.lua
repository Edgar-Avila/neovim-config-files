-- Run Python code
vim.api.nvim_command("autocmd filetype python map <buffer> <f5> :w<cr>:exec \"!python\" shellescape(@%, 1)<cr>")
vim.api.nvim_command("autocmd filetype python imap <buffer> <f5> <esc>:w<cr>:exec \"!python\" shellescape(@%, 1)<cr>")

-- run Go code
vim.api.nvim_command("autocmd filetype go map <buffer> <f5> :w<cr>:exec \"!go run .\"<CR>")
vim.api.nvim_command("autocmd fileType go imap <buffer> <F5> <esc>:w<cr>:exec \"go run .\"<CR>")

-- run Rust code
vim.api.nvim_command("autocmd filetype rust map <buffer> <f5> :w<cr>:exec \"!cargo run\"<CR>")
vim.api.nvim_command("autocmd fileType rust imap <buffer> <F5> <esc>:w<cr>:exec \"!cargo run\"<CR>")

-- run cpp code
vim.api.nvim_command("autocmd filetype cpp map <buffer> <f5> :w<cr>:exec \"!cmake .\"<CR>")
vim.api.nvim_command("autocmd fileType cpp imap <buffer> <F5> <esc>:w<cr>:exec \"!cmake .\"<CR>")

-- run js code
vim.api.nvim_command("autocmd filetype javascript map <buffer> <f5> :w<cr>:exec \"!node .\"<CR>")
vim.api.nvim_command("autocmd fileType javascript imap <buffer> <F5> <esc>:w<cr>:exec \"!node .\"<CR>")

-- Set background transparent
-- vim.cmd [[
--     hi Normal guibg=NONE ctermbg=NONE
-- ]]


