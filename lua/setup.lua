local M = {}
function M.setup()
    require"mason".setup{}
    require"Comment".setup{}
    require"toggleterm".setup{}
    require"todo-comments".setup{}
    require"config.whichkey".setup{}

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
    require"alpha".setup(require'alpha.themes.dashboard'.config)
end

return M
