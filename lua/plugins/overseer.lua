local M = {
    "stevearc/overseer.nvim",
    dependencies = {
        "mfussenegger/nvim-dap"
    }
}

M.config = function()
    require("dap.ext.vscode").json_decode = require("overseer.json").decode
    require("overseer").setup({})
end

return M
