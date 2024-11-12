local M = {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    run = "make install_jsregexp",
}

M.config = function()
    local ls = require("luasnip")
    require("luasnip.loaders.from_lua").lazy_load({
        paths = vim.fn.stdpath('config') .. '/LuaSnip'
    })

    ls.setup({})
end

return M
