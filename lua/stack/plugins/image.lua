return {
    "3rd/image.nvim",
    ft = { "markdown", "html", "css" },
    cond = false,
    opts = {
        backend = "kitty",
        integrations = {
            markdown = {
                enabled = true,
                only_render_image_at_cursor = true,
                only_render_image_at_cursor_mode = "inline",
                filetypes = { "markdown" },
            },
            html = {
                enabled = true,
            },
            css = {
                enabled = true,
            },
        },
    },
}
