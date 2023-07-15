local M = {}
function M.setup()
    require"mason".setup{}
    require"Comment".setup{}
    require"toggleterm".setup{}
    require"todo-comments".setup{}
    require"whichkey".setup{}
    require"colorizer".setup{} 

    require"formatter".setup  {
        filetype = {
            css = {
                require"formatter.filetypes.css".prettier,
            },
            c = {
                require"formatter.filetypes.c".clangformat,
            }
        },
    }
    require"nvim-tree".setup {
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            number = true,
            relativenumber = true,
        },
        filters = {
            custom = { ".git" },
        },
    }
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "rust" },
        sync_install = false,
        highlight = {
            enable = true,
            addition_vim_regex_highlighting = true,
        },
    }
    local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
    parser_config.odin = {
        install_info = {
            url = "$PROJECTS_LIBS/tree-sitter-odin",
            files = {"src/parser.c"}
        },
        filetype = "odin",
    }
--[[
    parser_config.haxe = {
        install_info = {
            url = "$PROJECTS_LIBS/tree-sitter-haxe",
            files = {"src/parser.c"},
            generate_requires_npm = false,
            requires_generate_from_grammar = false
        },
        filetype = "hx",
    }
--]]
    require"alpha".setup(require'alpha.themes.dashboard'.config)
end

return M
