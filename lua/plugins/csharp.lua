local M = {
    "jmederosalvarado/roslyn.nvim",
    dependencies = { "neovim/nvim-lspconfig" }
}

M.config = function()
    local roslyn = require("roslyn")

    roslyn.setup({
        dotnet_cmd = "dotnet",
        on_attach = nil,
        capabilities = nil,
    })
end

return M
