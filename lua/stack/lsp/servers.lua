local lspconfig = require('lspconfig')
local config = require('stack.lsp.config')
local fs_utils = require("stack.utils.filesystem")

vim.g.Omnisharp_server_use_net8 = 1
vim.g.OmniSharp_highlighting = 0

local emmet_capabilities = require('cmp_nvim_lsp').default_capabilities()
emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
    gdscript = {},
    jqls = {},
    hls = {},
    java_language_server = {
        cmd = { "/home/stack/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_linux.sh" },
    },
    csharp_ls = {},
    marksman = { nvim_no_formatexpr = true },
    pyright = {},
    prismals = {},
    elixirls = {
        cmd = { "/home/stack/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" }
    },
    solargraph = {},
    jsonls = {},
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--offset-encoding=utf-16",
            "--fallback-style=webkit"
        }
    },
    tailwindcss = {
        filetypes = {
            "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge",
            "eelixir", "elixir", "elm", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs",
            "html",
            "html-eex", "heex", "jade", "leaf", "liquid", "mdx", "mustache", "njk", "nunjucks", "php",
            "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss",
            "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte",
            "templ",
            "angular"
        },
        init_options = {
            userLanguages = {
                elixir = "html-eex",
                eelixir = "html-eex",
                heex = "html-eex",
            },
        },
    },
    astro = {},
    texlab = {},
    ts_ls = {},
    cssls = {},
    html = {},
    gopls = {},
    rust_analyzer = {},
    svelte = {},
    bashls = {},
    intelephense = {
        filetypes = { "php", "blade" },
    },
    elmls = {},
    dockerls = {},
    angularls = {
        cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations", "/home/stack/.asdf/installs/nodejs/22.14.0/bin/ngserver",
            "--ngProbeLocations", "/home/stack/.asdf/installs/nodejs/22.14.0/bin/ngserver"
        }
    },
    emmet_language_server = {
        capabilities = emmet_capabilities,
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'php', 'heex', 'angular', 'vue', 'astro', 'blade', 'svelte', 'templ', "elixir", "eelixir", "html-eex", }
    },
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    userThirdParty = { os.getenv("HOME") .. ".local/share/LuaAddons" },
                    checkThirdParty = "Apply",
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    },
                },
            }
        }
    },
    ltex = {
        nvim_disable = true,
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
    }
}

for server_name, server_config in pairs(servers) do
    local disable_file = "nvim-" .. server_name .. "-disable"
    local disable_exists = fs_utils.exists_in_cwd(disable_file)
    local enabled = not server_config.nvim_disable
    local should_setup = enabled and not disable_exists

    if should_setup then
        lspconfig[server_name].setup(config(server_config))
    end
end
