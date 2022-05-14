vim.api.nvim_set_keymap("n", "<leader>t", ":NERDTreeToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>n", ":NERDTreeFocus<CR>", {noremap=true})

-- Exit Vim if NERDTree is the only window remaining in the only tab.

vim.api.nvim_command("autocmd BufEnter * if tabpagenr(\"$\") == 1 && winnr(\"$\") == 1 && exists(\"b:NERDTree\") && b:NERDTree.isTabTree() | quit | endif")


-- Close the tab if NERDTree is the only window remaining in it.
vim.api.nvim_command("autocmd BufEnter * if winnr(\"$\") == 1 && exists(\"b:NERDTree\") && b:NERDTree.isTabTree() | quit | endif")

-- Start NERDTree and put the cursor back in the other window.
-- vim.api.nvim_command("autocmd VimEnter * NERDTree | wincmd p")
