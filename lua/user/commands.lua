-- Run python code
vim.api.nvim_command("autocmd FileType python map <buffer> <F5> :w<CR>:exec \"!python3\" shellescape(@%, 1)<CR>")
vim.api.nvim_command("autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec \"!python3\" shellescape(@%, 1)<CR>")

-- Set background transparent
vim.cmd [[
    hi Normal guibg=NONE ctermbg=NONE
]]


