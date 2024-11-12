local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/neodev.nvim"
    }
}

M.opts = { inlay_hints = { enabled = true }, }

M.config = function()
    local lspconfig = require("lspconfig")

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- This callback is called when the LSP is attached/enabled for this buffer
            -- we could set keymaps related to LSP, etc here.
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            local keymap_opts = { buffer = ev.buf }

            -- Code navigation and shortcuts
            vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
            vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
            vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
            vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
            vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, keymap_opts)
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, keymap_opts)

            -- Set updatetime for CursorHold
            -- 300ms of no cursor movement to trigger CursorHold
            vim.opt.updatetime = 100

            -- Show diagnostic popup on cursor hover
            local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
            vim.api.nvim_create_autocmd("CursorHold", {
                callback = function()
                    vim.diagnostic.open_float(nil, { focusable = false })
                end,
                group = diag_float_grp,
            })

            -- Goto previous/next diagnostic warning/error
            vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
            vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)

            -- have a fixed column for the diagnostics to appear in
            -- this removes the jitter when warnings/errors flow in
            vim.wo.signcolumn = "yes"

            -- format on write
            local format_sync_grp = vim.api.nvim_create_augroup("Format", { clear = false })

            vim.api.nvim_create_autocmd("BufWritePre", {
                vim.api.nvim_clear_autocmds({ group = format_sync_grp, buffer = ev.buf }),
                callback = function()
                    vim.lsp.buf.format()
                end,
                group = format_sync_grp,
                buffer = ev.buf,
            })

            -- enable inlay hints
            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true)
            end
        end
    })

    local lua_config = {
        completion = {
            callSnippet = "Replace"
        },
        diagnostics = {
            globals = { "vim" },
        },
    }

    lspconfig.lua_ls.setup({
        settings = {
            Lua = lua_config,
        }
    })

    vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
        local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
        local bufnr = vim.api.nvim_get_current_buf()
        vim.diagnostic.reset(ns, bufnr)
        return true
    end
end

return M
