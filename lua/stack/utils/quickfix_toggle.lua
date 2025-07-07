function QuickfixToggle()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        vim.cmd("cclose")
        return
    end
    if vim.tbl_isempty(vim.fn.getqflist()) then
        vim.notify("Quickfix list is empty", vim.log.levels.OFF, { title = "Quickfix Toggle" })
        return
    end
    vim.cmd("copen")
end
