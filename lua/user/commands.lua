-- Run Python code
vim.api.nvim_command("autocmd filetype python map <buffer> <f5> :w<cr>:exec \"!python3\" shellescape(@%, 1)<cr>")
vim.api.nvim_command("autocmd filetype python imap <buffer> <f5> <esc>:w<cr>:exec \"!python3\" shellescape(@%, 1)<cr>")

-- run Go code
vim.api.nvim_command("autocmd filetype go map <buffer> <f5> :w<cr>:exec \"!go run .\"<CR>")
vim.api.nvim_command("autocmd fileType go imap <buffer> <F5> <esc>:w<cr>:exec \"go run .\"<CR>")

-- run Rust code
vim.api.nvim_command("autocmd filetype rust map <buffer> <f5> :w<cr>:exec \"!cargo run\"<CR>")
vim.api.nvim_command("autocmd fileType rust imap <buffer> <F5> <esc>:w<cr>:exec \"!cargo run\"<CR>")

-- Set background transparent
vim.cmd [[
    hi Normal guibg=NONE ctermbg=NONE
]]


