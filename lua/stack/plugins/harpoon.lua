local keys = {}
local bindKeys = { "u", "i", "o", "p", "j", "k", "l", ";" }

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

for i = 1, #bindKeys do
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

