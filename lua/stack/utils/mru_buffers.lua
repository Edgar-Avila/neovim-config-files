local mru_buffers = {}

local function remove(buf)
  for i, b in ipairs(mru_buffers) do
    if b == buf then
      table.remove(mru_buffers, i)
      return
    end
  end
end

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()

    -- Ignore special buffers (optional)
    if vim.bo[buf].buftype ~= "" then
      return
    end

    remove(buf)
    table.insert(mru_buffers, 1, buf)
  end,
})

local function prev_buffer()
  if #mru_buffers < 2 then
    return
  end

  local current = vim.api.nvim_get_current_buf()

  for i, b in ipairs(mru_buffers) do
    if b ~= current and vim.api.nvim_buf_is_valid(b) then
      vim.api.nvim_set_current_buf(b)
      return
    end
  end
end

local function next_buffer()
  if #mru_buffers < 2 then
    return
  end

  local current = vim.api.nvim_get_current_buf()
  local found = false

  for i = #mru_buffers, 1, -1 do
    local b = mru_buffers[i]
    if found and vim.api.nvim_buf_is_valid(b) then
      vim.api.nvim_set_current_buf(b)
      return
    end
    if b == current then
      found = true
    end
  end
end

return {
    prev_buffer = prev_buffer,
    next_buffer = next_buffer,
}
