local M = {
    "petertriho/nvim-scrollbar",
    dependencies = {
        { "kevinhwang91/nvim-hlslens", 
            config = function() require("scrollbar.handlers.search").setup({}) end, },
        { "lewis6991/gitsigns.nvim",
            config = function()
                require('gitsigns').setup()
                require("scrollbar.handlers.gitsigns").setup()
            end,
        },
    },
}

M.config = function()
    require("scrollbar").setup()
end

return M
