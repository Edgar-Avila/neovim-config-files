-- Simple HTTP client using curl and vim.system
-- Supports GET, POST, PUT, DELETE methods with headers and query parameters
-- Pure experimentation for fun, lacking a lot of stuff

local function system_cmd_call(command, ok_cb, err_cb)
    vim.system(
        command,
        { text = true },
        function(obj)
            if obj.code == 0 then
                ok_cb(obj.stdout)
            elseif err_cb then
                err_cb(obj.stderr)
            end
        end
    )
end

local function curl_from_opts(opts)
    local command = { "curl", "-sL", opts.url }
    local headers = opts.headers or {}
    local query = opts.query or {}

    for k, v in pairs(headers) do
        table.insert(command, "-H")
        table.insert(command, k .. ": " .. v)
    end

    for k, v in pairs(query) do
        table.insert(command, "--data-urlencode")
        table.insert(command, k .. "=" .. v)
    end

    if opts.method then
        table.insert(command, "-X")
        table.insert(command, opts.method)
    end

    return command
end

local function wrap_ok_cb(ok_cb, json_decode)
    return function(response)
        if json_decode then
            local decoded = vim.json.decode(response)
            ok_cb(decoded)
        else
            ok_cb(response)
        end
    end
end

local function http_req(opts)
    assert(type(opts) == "table", "opts must be a string or a table")
    local command = curl_from_opts(opts)
    local ok_wrapper = wrap_ok_cb(opts.ok, opts.json_decode)
    system_cmd_call(command, ok_wrapper, opts.err)
end

local function http_get(opts)
    opts.method = "GET"
    http_req(opts)
end

local function http_post(opts)
    opts.method = "POST"
    http_req(opts)
end

local function http_put(opts)
    opts.method = "PUT"
    http_req(opts)
end

local function http_delete(opts)
    opts.method = "DELETE"
    http_req(opts)
end

return {
    get = http_get,
    post = http_post,
    put = http_put,
    delete = http_delete,
}
