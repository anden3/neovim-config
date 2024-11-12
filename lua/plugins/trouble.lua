local M = {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
    vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)

    require("trouble").setup({
        auto_open = true,
    })
end

return M
