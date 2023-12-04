local M = {
    "j-hui/fidget.nvim",
    tag = "legacy",
    dependencies = { "neovim/nvim-lspconfig" }
}

M.config = function()
    local fidget = require("fidget")

    fidget.setup({
        window = { blend = 0 },
    })
end

return M
