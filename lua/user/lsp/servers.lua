local lspconfig = require('lspconfig')
local config = require('user.lsp.config')

-- Configure servers by default
lspconfig.pyright.setup(config())
lspconfig.prismals.setup(config())
lspconfig.elixirls.setup(config())
lspconfig.solargraph.setup(config())
lspconfig.jsonls.setup(config())
lspconfig.clangd.setup(config({
    cmd = {
        "clangd",
        "--offset-encoding=utf-16"
    }
}))
lspconfig.tailwindcss.setup(config())
lspconfig.texlab.setup(config())
lspconfig.tsserver.setup(config())
lspconfig.cssls.setup(config())
lspconfig.html.setup(config())
lspconfig.gopls.setup(config())
lspconfig.rust_analyzer.setup(config())
lspconfig.svelte.setup(config())

-------------------------------------------------------------------------------
-- Configure servers with custom configuration
-------------------------------------------------------------------------------

-- Emmet
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.emmet_language_server.setup(config({
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'php', 'heex' }
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

