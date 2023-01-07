-- Make background transparent
function SetBgTransparent()
    vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
end
