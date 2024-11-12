local M = {
    "voldikss/vim-floaterm",
}

M.init = function()
    -- FloaTerm configuration
    vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 nu <CR> ")
    vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>")
    vim.keymap.set('t', "<Esc><Esc>", "<C-\\><C-n>:q<CR>")
end

return M
