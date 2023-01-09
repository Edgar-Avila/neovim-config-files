-- Make background transparent
function SetBgTransparent()
    vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
    vim.cmd [[ hi NormalFloat guibg=NONE ctermbg=NONE ]]
    vim.cmd [[ hi TelescopeNormal guibg=NONE ctermbg=NONE ]]
end
