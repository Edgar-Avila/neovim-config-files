local function toggle_copilot()
  if vim.g.copilot_enabled == 1 then
    vim.cmd("Copilot disable")
    print("Copilot disabled")
  else
    vim.cmd("Copilot enable")
    print("Copilot enabled")
  end
end

return {
    'github/copilot.vim',
    event = "InsertEnter",
    init = function ()
        -- Setting manually because for some reason it was left as 0
        vim.g.copilot_enabled = 1
    end,
    keys = {
        { '<leader>cp', ':Copilot panel<CR>', desc = 'Open Copilot Panel' },
        { '<leader>ct', toggle_copilot, desc = 'Toggle Copilot' },
    },
}
