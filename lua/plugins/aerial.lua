local M = {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons" 
    },
}

M.config = function()
    local aerial = require("aerial")

    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

    aerial.setup({
        keymaps = {
            ["z"] = "actions.prev",
            ["x"] = "actions.next",
        }
    })
end

return M
