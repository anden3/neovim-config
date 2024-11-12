local M = {
    "simrat39/rust-tools.nvim",
}

local codelldb_path = "/usr/bin/codelldb"
local liblldb_path = "/usr/lib/codelldb/lldb/lib/liblldb.so"

M.config = function()
    local rust_tools = require("rust-tools")
    local lspconfig = require("lspconfig")

    local tools = {
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
        },
        dap = {
            adapter = require("rust-tools.dap").get_codelldb_adapter(
                codelldb_path, liblldb_path)
        },
    }

    local ra_settings = {
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

    local capabilities = vim.tbl_deep_extend("force", lspconfig.util.default_config.capabilities,
        require("cmp_nvim_lsp").default_capabilities())

    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

    local server = {
        settings = {
            ["rust-analyzer"] = ra_settings,
        },
        capabilities = capabilities,
        root_dir = function(path)
            local workspace = lspconfig.util.root_pattern("Cargo.toml")(vim.fn.getcwd())

            if vim.startswith(path, workspace) then
                return workspace
            end

            return nil
        end
    }

    rust_tools.setup({
        tools = tools,
        server = server,
    })
end

return M
