local bufname = "*temp*"
local buf = vim.fn.bufnr(bufname)
if buf == -1 then
 buf = vim.api.nvim_create_buf(true, true)
end
vim.api.nvim_buf_set_name(buf, bufname)

local timer = vim.loop.new_timer()
local text = "hello world"

timer:start(
  0,      -- start immediately
  1000,   -- repeat every 1000 ms
  vim.schedule_wrap(function()
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
        text,
    })
    text = text .. "!"
  end)
)
