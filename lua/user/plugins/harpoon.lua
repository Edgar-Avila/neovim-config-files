local keys = {}
local terms = 3
local termKeys = { "q", "w", "e" }
local binds = 4
local bindKeys = { "u", "i", "o", "p" }

table.insert(keys, {
  "<leader>ss",
  function()
    require("harpoon.ui").toggle_quick_menu()
  end,
  desc = "Harpoon Menu",
})

table.insert(keys, {
  "<leader>sa",
  function()
    require("harpoon.mark").add_file()
  end,
  desc = "Harpoon Add file",
})

for i = 1, terms do
table.insert(keys, {
  string.format("<leader>s", termKeys[i]),
  function()
    require("harpoon.term").gotoTerminal(i)
    vim.api.nvim_command [[startinsert]]
  end,
  desc = "Harpoon quick split Terminal",
})
end

for i = 1, binds do
  table.insert(keys, {
    string.format("<leader>s%s", bindKeys[i]),
    function()
      require("harpoon.ui").nav_file(i)
    end,
    desc = "Harpoon go to file " .. i,
  })
end

return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  },
  keys = keys,
}

