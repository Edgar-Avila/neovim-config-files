function ExistsInCwd(nameToCheck)
    local cwDir = vim.fn.getcwd()

    -- Get all files and directories in CWD
    local cwdContent = vim.split(vim.fn.glob(cwDir .. "/*"), '\n', { trimempty = true })

    -- Check if specified file or directory exists
    local fullNameToCheck = cwDir .. "/" .. nameToCheck
    print("Checking for: \"" .. fullNameToCheck .. "\"")
    for _, cwdItem in pairs(cwdContent) do
        if cwdItem == fullNameToCheck then
            return true
        end
    end
    return false
end
