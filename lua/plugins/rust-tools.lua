local M = {
    "mrcjkb/rustaceanvim",
}

M.opts = {
    tools = {
        runnables = {
            use_telescope = true,
        },
    },
    server = {
        default_settings = {
            ["rust-analyzer"] = {
                assist = {
                    emitMustUse = true,
                },
                checkOnSave = true,
                check = {
                    command = "clippy",
                },
                diagnostics = {
                    disabled = { "inactive-code" }
                },
                hover = {
                    actions = {
                        run = { enable = false },
                    },
                },
                inlayHints = {},
                lens = {
                    run = { enable = false },
                },
            }
        },
        root_dir = function(path)
            local workspace = require("lspconfig").util.root_pattern("Cargo.toml")(vim.fn.getcwd())

            if vim.startswith(path, workspace) then
                return workspace
            end

            return nil
        end
    }
}

M.config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
end

return M
