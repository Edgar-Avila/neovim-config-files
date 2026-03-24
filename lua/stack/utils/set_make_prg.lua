function SetMakePrg()
  vim.ui.input({ prompt = "Set makeprg: " }, function(input)
    if input and input ~= "" then
      vim.opt.makeprg = input
      print("makeprg set to: " .. input)
    else
      print("makeprg unchanged")
    end
  end)
end

return SetMakePrg
