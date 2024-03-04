return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        current_line_blame = true,
    },
    keys = {
        { '<leader>ghp', ':Gitsigns preview_hunk_inline<CR>' }, -- Git hunk preview
        { '<leader>ghs', ':Gitsigns stage_hunk<CR>' },          -- Git hunk stage
        { '<leader>ghu', ':Gitsigns undo_stage_hunk<CR>' },     -- Git hunk unstage
        { '<leader>ghv', ':Gitsigns select_hunk<CR>' },         -- Git hunk visual
        { '<leader>ghr', ':Gitsigns reset_hunk<CR>' },          -- Git hunk reset
    },
    config = true,
}
