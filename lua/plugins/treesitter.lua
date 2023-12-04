local M = {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
}

M.build = function()
    require("nvim-treesitter.install").update({
        with_sync = true,
    })
end

M.config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
        ensure_installed = { "lua", "vim", "toml", "rust" },
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true, },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },
    })
end

M.init = function()
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
end

return M
