return {
    'tpope/vim-fugitive',
    dependencies = {
        'tpope/vim-rhubarb',
    },
    keys = {
        { "<leader>gd", "<cmd>Gvdiffsplit<cr>" }, -- Git diff
        { "<leader>gs", "<cmd>Ge :<cr>" },        -- Git status
        { "<leader>gB", "<cmd>Git blame<cr>" },   -- Git blame
        { "<leader>gl", "<cmd>Git log<cr>" },     -- Git log
        { "<leader>gC", "<cmd>Git commit<cr>" },  -- Git commit
        { "<leader>gx", "<cmd>GBrowse<cr>" },     -- Git Explore
    },
    cmd = {
        "G",
        "Ge",
        "Git",
        "GBrowse",
        "Gvdiffsplit",
        "Gvdiffsplit",
        "Gwrite",
    },
}
