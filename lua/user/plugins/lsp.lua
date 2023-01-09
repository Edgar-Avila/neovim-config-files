local lspconfig = require('lspconfig')
require('lsp_signature').setup()

-- Helper function to configure servers
local function config(_config)
    local opts = { noremap = true, silent = true }
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g?', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fo', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ge', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ga', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
        end,
        root_dir = function (fname)
            return vim.loop.cwd()
        end
    }, _config or {})
end

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true
})

-- Configure servers by default
lspconfig.pyright.setup(config())
lspconfig.tsserver.setup(config())
lspconfig.clangd.setup(config())
lspconfig.volar.setup(config())
lspconfig.cssls.setup(config())
lspconfig.html.setup(config())
lspconfig.emmet_ls.setup(config())
lspconfig.gopls.setup(config())
lspconfig.svelte.setup(config())
lspconfig.rust_analyzer.setup(config())
lspconfig.intelephense.setup(config())
-- if vim.loop.os_uname().sysname ~= "Windows_NT" then
    -- Lsp installer can not install rust_analyzer on windows for some reason
    -- lspconfig.rust_analyzer.setup(config())
-- end

-- Configure servers with custom configuration
lspconfig.sumneko_lua.setup(config({
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

