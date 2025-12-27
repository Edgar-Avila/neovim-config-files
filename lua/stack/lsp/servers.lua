local lspconfig = require('lspconfig')
local config = require('stack.lsp.config')

-------------------------------------------------------------------------------
-- Configure servers by default
-------------------------------------------------------------------------------
lspconfig.gdscript.setup(config())
lspconfig.ltex.setup(config({
    settings = {
        ltex = {
            language = "es",
        },
    },
    on_attach = function(client, bufnr)
        config().on_attach(client, bufnr)
        require("ltex_extra").setup({
            load_langs = { "es" },
            init_check = true,
            path = vim.fn.expand('~') .. '/.local/share/ltex',
        })
    end,
    
}))
lspconfig.jqls.setup(config())
lspconfig.java_language_server.setup(config({
    cmd = { "/home/stack/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_linux.sh" },
}))
-- vim.g.Omnisharp_server_use_net8 = 1
-- vim.g.OmniSharp_highlighting = 0
lspconfig.csharp_ls.setup(config())
lspconfig.marksman.setup(config({}, true))
lspconfig.pyright.setup(config())
lspconfig.prismals.setup(config())
lspconfig.elixirls.setup(config({
    cmd = { "/home/stack/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" }
}))
lspconfig.solargraph.setup(config())
lspconfig.jsonls.setup(config())
lspconfig.clangd.setup(config({
    cmd = {
        "clangd",
        "--background-index",
        "--offset-encoding=utf-16",
        "--fallback-style=webkit"
    }
}))
lspconfig.tailwindcss.setup(config({
    filetypes = {
        "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge",
        "eelixir", "elixir", "elm", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html",
        "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php",
        "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss",
        "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ",
        "angular"
    },
    init_options = {
        userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
        },
    },
}))

lspconfig.astro.setup(config())
lspconfig.texlab.setup(config())
lspconfig.ts_ls.setup(config())
lspconfig.cssls.setup(config())
lspconfig.html.setup(config())
lspconfig.gopls.setup(config())
lspconfig.rust_analyzer.setup(config())
lspconfig.svelte.setup(config())
lspconfig.bashls.setup(config())
lspconfig.intelephense.setup(config({
    filetypes = { "php", "blade" },
}))
lspconfig.elmls.setup(config())
lspconfig.dockerls.setup(config())
local project_library_path = "/home/stack/.asdf/installs/nodejs/22.14.0/bin/ngserver"
local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}
-- lspconfig.angularls.setup(config({
--     cmd = cmd,
-- }))

-------------------------------------------------------------------------------
-- Configure servers with custom configuration
-------------------------------------------------------------------------------

-- Emmet
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.emmet_language_server.setup(config({
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'php', 'heex', 'angular', 'vue', 'astro', 'blade', 'svelte', 'templ', "elixir", "eelixir", "html-eex", }
}))

-- Lua
lspconfig.lua_ls.setup(config({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        }
    }
}))
