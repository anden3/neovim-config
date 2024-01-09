local M = {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    }
}

M.config = function()
    local nls = require("null-ls")
    local b = nls.builtins

    local sources = {
        b.code_actions.shellcheck,
        b.diagnostics.shellcheck,
        b.diagnostics.zsh,
        --b.formatting.shellharden,
        b.formatting.shfmt.with {
            extra_args = { "-i", "4", "-sr", "-ci", "-s" }
        }
    }

    nls.setup({
        sources = sources
    })
end

return M
