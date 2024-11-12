local M = {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
}

M.config = function()
    local copilot = require("copilot")

    copilot.setup({
        panel = {
            enabled = true,
            auto_refresh = true,
        },
        suggestion = {
            enabled = true,
            auto_trigger = true,
            accept = false,
        },
    })
end

return M
