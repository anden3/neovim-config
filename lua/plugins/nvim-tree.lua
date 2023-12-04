local M = {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}

M.config = function()
    local tree = require("nvim-tree")

    tree.setup({
        disable_netrw = false,
        hijack_netrw = true,
    })
end

return M
