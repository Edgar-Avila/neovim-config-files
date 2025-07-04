local lspconfig = require('lspconfig')
local config = require('stack.lsp.config')
--
-- Configure servers by default
lspconfig.omnisharp.setup(config())
lspconfig.marksman.setup(config({}, true))
lspconfig.pyright.setup(config())
lspconfig.prismals.setup(config())
lspconfig.elixirls.setup(config())
lspconfig.solargraph.setup(config())
lspconfig.jsonls.setup(config())
lspconfig.clangd.setup(config({
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--fallback-style=webkit"
    }
}))
lspconfig.tailwindcss.setup(config({
    filetypes = {
        "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge",
        "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html",
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
-- lspconfig.angularls.setup(config())

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
