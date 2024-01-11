local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "zbirenbaum/copilot.lua"
    },
}

M.config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local copilot = require("copilot.suggestion")

    vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
    vim.opt.shortmess = vim.opt.shortmess + "c"

    local mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Add tab support
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i" }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
                fallback()
            end
        end, { "i" }),
        ["<S-CR>"] = cmp.mapping(function(fallback)
            if copilot.is_visible() then
                copilot.accept()
            else
                fallback()
            end
        end, { "i", "s", "c" }),
    }

    local sources = {
        { name = "nvim_lsp_signature_help", priority = 10 },
        { name = "nvim_lsp",                priority = 9 },
        { name = "luasnip",                 priority = 7, keyword_length = 3 },
        { name = "buffer",                  priority = 6, keyword_length = 8 },
        { name = "path",                    priority = 4 },
    }

    local sorting = {
        priority_weight = 1.0,
        comparators = {
            cmp.config.compare.locality,
            cmp.config.compare.recently_used,
            cmp.config.compare.score,
            cmp.config.compare.offset,
            cmp.config.compare.order,
        },
    }

    local snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    }

    cmp.setup({
        preselect = cmp.PreselectMode.None,
        mapping = mapping,
        sources = sources,
        sorting = sorting,
        snippet = snippet,
    })

    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        window = { completion = cmp.config.window.bordered({ col_offset = 0 }) },
        formatting = { fields = { "abbr" } },
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        window = { completion = cmp.config.window.bordered({ col_offset = 0 }) },
        formatting = { fields = { "abbr" } },
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })
end

return M
