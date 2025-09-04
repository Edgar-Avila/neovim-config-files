-------------------------------------------------------------------------------
--- My global vars (Not built-in, not coming from plugins)
-------------------------------------------------------------------------------
vim.g.bgtransparent = os.getenv("NVIM_TRANSPARENT") == "1"
vim.g.plantumlJar = vim.fn.expand("$HOME") .. "/apps/plantuml/plantuml.jar"
vim.g.plantumlCompileOnSave = true
