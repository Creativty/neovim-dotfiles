local opt = vim.opt -- Lua `opt.var=content` <==> VimScript `set var=content` (equivalence)

-- Vim Configuration
    -- Tab
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
    --Term gui colors.
    vim.o.termguicolors = true
    -- Folding
    opt.foldmethod = "indent"
    -- Line numbers
    opt.number = true
    opt.relativenumber = true
    -- Leader Key
    vim.g.mapleader = " "

require'plugins'
require'keymaps'
require'setup'.setup{}
require'lsp'.setup{}
require'filetypes'.setup{}

-- Theme
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_contrast_light = "hard"
    vim.cmd([[silent! colorscheme gruvbox]])
