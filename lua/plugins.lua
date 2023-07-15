local call = vim.call
-- Vim Plug
local Plug = vim.fn["plug#"]
call('plug#begin', '~/AppData/Local/nvim/plugged')

    Plug('neovim/nvim-lspconfig') -- LSP Configuration
    Plug('williamboman/mason.nvim') -- LSP Dependency Management
    Plug('mhartington/formatter.nvim') -- Formatter
    Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'}) -- Text Schematics

    -- Themes
    Plug('tomasr/molokai')
    Plug('morhetz/gruvbox')
    Plug('ayu-theme/ayu-vim')
    Plug('joshdick/onedark.vim')
    Plug('iCyMind/NeoSolarized')

    -- Status & Tabline
    Plug('vim-airline/vim-airline')
    Plug('vim-airline/vim-airline-themes')

    -- General Shared Plugins
    Plug('kyazdani42/nvim-web-devicons')
    Plug('kyazdani42/nvim-tree.lua')
    Plug('nvim-lua/plenary.nvim')

    Plug('mattn/emmet-vim') -- HTML & CSS emmet abbreviations
    Plug('jdonaldson/vaxe') -- Haxe identation, syntax highlighting
    -- Plug('ap/vim-css-color') -- Preview colors in css supported formats (Obsolete due to conflict with TreeSitter)
    Plug('norcalli/nvim-colorizer.lua') -- Preview colors in css supported formats
    Plug('tpope/vim-vinegar') -- Better file explorer on the side
    Plug('akinsho/toggleterm.nvim') -- A better terminal tab
    Plug('goolord/alpha-nvim') -- Greetings dashboard
    Plug('tpope/vim-surround') -- Quick surround
    Plug('folke/which-key.nvim') -- Preview path to hotkey
    Plug('numToStr/Comment.nvim') -- Quick code comments
    Plug('junegunn/vim-easy-align') -- :EasyAlign / Align by symbol
    Plug('folke/todo-comments.nvim') -- TODO & SYMBOLS Highlighter
    Plug('lukas-reineke/indent-blankline.nvim') -- Better symbols for indents
    Plug('mg979/vim-visual-multi', {branch= 'master'}) -- Multiple cursors
    Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' }) -- Fuzzy finding

call('plug#end')
