vim.opt.runtimepath:prepend(vim.fn.stdpath('config') .. '/vim')
vim.opt.runtimepath:append(vim.fn.stdpath('data') .. '/vim')
vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/vim/after')
vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/nvim')

vim.opt.viminfofile = vim.fn.stdpath('state') .. '/vim/viminfo'

vim.loader.enable()

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
