local M = {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    }
}

M.config = function()
    local nls = require("null-ls")

    local sources = {
        nls.builtins.code_actions.shellcheck,
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.diagnostics.zsh,
        --nls.builtins.formatting.shellharden,
        nls.builtins.formatting.shfmt.with {
            extra_args = { "-i", "4", "-sr", "-ci", "-s" }
        }
    }

    nls.setup({
        sources = sources
    })
end

return M
