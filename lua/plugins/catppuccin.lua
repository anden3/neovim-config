local M = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
}

M.config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
        integrations = {
            aerial = true,
            beacon = true,
            cmp = true,
            dap = {
                enabled = true,
                enable_ui = true,
            },
            fidget = true,
            gitsigns = true,
            hop = true,
            lsp_trouble = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
            nvimtree = true,
            telescope = true,
            treesitter = true,
        }
    })
end

return M

