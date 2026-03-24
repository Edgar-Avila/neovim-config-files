local function exists_in_cwd(nameToCheck)
    local cwDir = vim.fn.getcwd()

    -- Get all files and directories in CWD
    local cwdContent = vim.split(vim.fn.glob(cwDir .. "/*"), '\n', { trimempty = true })

    -- Check if specified file or directory exists
    local fullNameToCheck = cwDir .. "/" .. nameToCheck
    for _, cwdItem in pairs(cwdContent) do
        if cwdItem == fullNameToCheck then
            return true
        end
    end
    return false
end

local function create_empty_file_cwd(filename)
    local cwDir = vim.fn.getcwd()
    local fullPath = cwDir .. "/" .. filename
    local success, err = pcall(function()
        vim.fn.writefile({}, fullPath)
    end)
    if not success then
        vim.notify("Error creating file: " .. err, vim.log.levels.ERROR)
        return false
    end
    vim.notify("Created file: " .. fullPath, vim.log.levels.INFO)
    return true
end

local function delete_empty_file_cwd(filename)
    local cwDir = vim.fn.getcwd()
    local fullPath = cwDir .. "/" .. filename
    if vim.fn.filereadable(fullPath) ~= 1 then
        vim.notify("File does not exist: " .. fullPath, vim.log.levels.WARN)
        return false
    end
    local contents = vim.fn.readfile(fullPath)
    if #contents > 0 then
        vim.notify("File is not empty, cannot delete: " .. fullPath, vim.log.levels.WARN)
        return false
    end

    local success, err = pcall(function()
        os.remove(fullPath)
    end)
    if not success then
        vim.notify("Error deleting file: " .. err, vim.log.levels.ERROR)
        return false
    end
    vim.notify("Deleted file: " .. fullPath, vim.log.levels.INFO)
    return true
end

local function add_to_git_exclude(filename)
    local cwDir = vim.fn.getcwd()
    local gitInfoPath = cwDir .. "/.git/info/exclude"
    if vim.fn.filereadable(gitInfoPath) ~= 1 then
        vim.notify(".git/info/exclude does not exist, skipping: " .. gitInfoPath, vim.log.levels.WARN)
        return false
    end

    local content = vim.fn.readfile(gitInfoPath)
    if vim.tbl_contains(content, filename) then
        return true
    end

    table.insert(content, filename)
    local success, err = pcall(function()
        vim.fn.writefile(content, gitInfoPath)
    end)
    if not success then
        vim.notify("Error updating .git/info/exclude: " .. err, vim.log.levels.ERROR)
        return false
    end
    vim.notify("Added to .git/info/exclude: " .. filename, vim.log.levels.INFO)
    return true
end

return {
    exists_in_cwd = exists_in_cwd,
    create_empty_file_cwd = create_empty_file_cwd,
    delete_empty_file_cwd = delete_empty_file_cwd,
    add_to_git_exclude = add_to_git_exclude,
}
