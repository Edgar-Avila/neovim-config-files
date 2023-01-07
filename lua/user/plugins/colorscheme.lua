-- Set default colorsheme
vim.cmd [[ colorscheme gruvbox ]]

-- Make background transparent
function SetBgTransparent()
    vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
end
