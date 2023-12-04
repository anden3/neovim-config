local M = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}

M.config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
    vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
    vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, {})

    telescope.setup()
    telescope.load_extension('fzf')
end

return M
