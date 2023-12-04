require("bootstrap")

-- map leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable nvim providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- options
vim.opt.termguicolors = true
vim.opt.mouse = 'a'

vim.opt.modelines = 0
vim.opt.number = true
vim.opt.visualbell = true
vim.opt.encoding = "utf-8"

vim.opt.wrap = true
vim.opt.textwidth = 79
vim.opt.formatoptions = "tcqrn1"
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.breakindent = true

vim.opt.confirm = true
vim.opt.undofile = true

vim.opt.matchpairs:append("<:>")

vim.opt.cmdheight = 2
vim.opt.showmode = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 200
vim.opt.pastetoggle = "<F11>"

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

require("lazy").setup("plugins", {})

vim.cmd.colorscheme "catppuccin-macchiato"
vim.opt.foldlevel = 999
