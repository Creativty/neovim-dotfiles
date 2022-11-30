require'plugins'
require'keymaps'
require'setup'.setup{}
require'lsp'.setup{}

local opt = vim.opt -- VimScript `set var=content` equiv

-- Vim Configuration
    -- Tab
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
    -- Folding
    opt.foldmethod = "indent"
    -- Line numbers
    opt.number = true
    opt.relativenumber = true
    -- Powershell instead of CMD
    opt.shell = "powershell"
    opt.shellcmdflag = "-command"
    opt.shellquote = "\""
    opt.shellxquote= ""
    -- Leader Key
    vim.g.mapleader = " "
-- Theme
    vim.o.termguicolors = true
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_contrast_light = "hard"
    vim.cmd([[silent! colorscheme gruvbox]])
