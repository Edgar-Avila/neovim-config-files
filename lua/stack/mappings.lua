-- Paste without losing what is on buffer
vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", { noremap = true })

-- Remap Esc
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Better window navigation
vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { noremap = true })

-- Fast edit init.lua "cd init.lua"
vim.api.nvim_set_keymap("n", "<leader>cdi", ":exe 'cd ' . fnamemodify($MYVIMRC, ':p:h')<CR>:e $MYVIMRC<CR>", { noremap = true })

-- Change current working directory "cd file"
vim.api.nvim_set_keymap("n", "<leader>cdf", ":cd %:p:h<CR>", { noremap = true })

-- Make background transparent
vim.keymap.set("n", "<leader>bg", require("stack.utils.transparent_bg"))

-- Browse the web
vim.keymap.set("n", "<leader>bo", require("stack.utils.web_picker"))

-- Bookmarks
vim.keymap.set("n", "<leader>bm", require("stack.utils.bookmark_picker"))

-- Media files
vim.keymap.set("n", "<leader>me", require("stack.utils.media_picker"))

-- Create tab
vim.api.nvim_set_keymap("n", "<leader>mt", ":tabnew<CR>", { noremap = true })

-- Select around quotes without leading whitespaces
vim.api.nvim_set_keymap("v", "a'", "2i'", { noremap = true })
vim.api.nvim_set_keymap("v", "a\"", "2i\"", { noremap = true })
vim.api.nvim_set_keymap("v", "a`", "2i`", { noremap = true })

-- Easier selection without leading and trailing whitespaces ("vil", "yil", "dil", etc)
vim.api.nvim_set_keymap("x", "il", "g_o^", { noremap = true })
vim.api.nvim_set_keymap("o", "il", ":<C-u>normal vil<CR>", { noremap = true })

-- Easier start/end of line
vim.api.nvim_set_keymap("n", "gh", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true })

-- -- Closing brackets and quotes
-- vim.api.nvim_set_keymap("i", "'",     "''<left>",     { noremap = true })
-- vim.api.nvim_set_keymap("i", "`",     "``<left>",     { noremap = true })
-- vim.api.nvim_set_keymap("i", "\"",    "\"\"<left>",   { noremap = true })
-- vim.api.nvim_set_keymap("i", "{",     "{}<left>",     { noremap = true })
-- vim.api.nvim_set_keymap("i", "(",     "()<left>",     { noremap = true })
-- vim.api.nvim_set_keymap("i", "[",     "[]<left>",     { noremap = true })
-- vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<ESC>O", { noremap = true })

-- Resize windows
vim.keymap.set("n", "<S-right>", "<cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<S-left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<S-up>", "<cmd>horizontal resize +2<CR>")
vim.keymap.set("n", "<S-down>", "<cmd>horizontal resize -2<CR>")

-- Quickfix stuff
-- vim.api.nvim_set_keymap("n", "<leader>qr", "<cmd>lua QuickfixToggle()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>qr", require("stack.utils.quickfix_toggle"))
vim.api.nvim_set_keymap("n", "<leader>qn", "<cmd>cnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>qp", "<cmd>cprev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>qf", "<cmd>cfirst<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ql", "<cmd>clast<CR>", { noremap = true })

-- Build stuff
vim.keymap.set("n", "<leader>bu", "<cmd>make<CR>")
vim.keymap.set("n", "<leader>bp", require("stack.utils.set_make_prg"))

-- Eval expression selected
vim.api.nvim_set_keymap("x", "<leader>ma", ":s/.*/\\=eval(submatch(0))<CR>", { noremap = true })

-- Make ctrl + c the same as escape
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", { noremap = true })

-- Tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Source luafile
-- vim.keymap.set("n", "<leader>ls", "<cmd>luafile %<CR>")

-- -- Buffer navigation
-- vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>bp", ":bprevious<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>l", ":bnext<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>h", ":bprevious<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>h", "<cmd>bprevious<CR>")
-- vim.keymap.set("n", "<leader>l", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>uu", "<cmd>read ! uuidgen<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ut", "<cmd>read ! uuidgen -t<CR>", { noremap = true })

-- vim.keymap.set("n", "<leader><tab>", require("stack.utils.mru_buffers").prev_buffer)
-- vim.keymap.set("n", "<leader><S-tab>", require("stack.utils.mru_buffers").next_buffer)
vim.keymap.set("n", "<leader>h", require("stack.utils.mru_buffers").prev_buffer)
vim.keymap.set("n", "<leader>l", require("stack.utils.mru_buffers").next_buffer)
