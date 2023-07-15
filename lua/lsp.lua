local M = {}
local whichkey = require'which-key'

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') -- Enables NeoVim Autocompletion
    local conf = {
        window = {
            border = "single",
            position = "bottom",
        },
    }
    local i_opts = {
        mode = "i",
        prefix = "<C-A>",
        buffer = nil,
        silent = t,
        noremap = true,
        nowait = true
    }
    local i_mappings = {
        d = { function() vim.lsp.buf.definition({buffer = bufnr}) end, "Definition" }
    }
    local n_opts = {
        mode = "n",
        prefix = "<leader>",
        buffer = bufnr,
        silent = t,
        noremap = true,
        nowait = false
    }
    local n_mappings = {
        l = {
            name = "LSP",
            D = {
                name = "Diagnostics",
                s = { function() vim.diagnostic.show       () end, "Show"           },
                o = { function() vim.diagnostic.open_float () end, "Open Floating"  },
                n = { function() vim.diagnostic.goto_next  () end, "Next Issue"     },
                p = { function() vim.diagnostic.goto_prev  () end, "Previous Issue" },
                a = { function() vim.diagnostic.setloc_list() end, "Add to LocList" },
            },
            h = { function() vim.lsp.buf.hover              ({ buffer = bufnr }) end, "Hover"           },
            R = { function() vim.lsp.buf.rename             ({ buffer = bufnr }) end, "Rename"          },
            d = { function() vim.lsp.buf.definition         ({ buffer = bufnr }) end, "Definition"      },
            r = { function() vim.lsp.buf.references         ({ buffer = bufnr }) end, "References"      },
            e = { function() vim.lsp.buf.declaration        ({ buffer = bufnr }) end, "Declaration"     },
            a = { function() vim.lsp.buf.code_action        ({ buffer = bufnr }) end, "Code Action"     },
            i = { function() vim.lsp.buf.implementation     ({ buffer = bufnr }) end, "Implementation"  },
            K = { function() vim.lsp.buf.signature_help     ({ buffer = bufnr }) end, "Signature Help"  },
            t = { function() vim.lsp.buf.type_definition    ({ buffer = bufnr }) end, "Type Definition" },
            -- SPECIAL FORMAT --
            f = { function() vim.lsp.buf.format             ({ async  = true }) end, "Format"          },
        }
    }
    whichkey.register(i_mappings, i_opts) -- Insert mode mappings
    whichkey.register(n_mappings, n_opts) -- Normal mode mappings
end

function M.setup()
    local lspconfig = require'lspconfig'
    local configs = require'lspconfig/configs'
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.ols.setup{on_attach = on_attach}
    lspconfig.ccls.setup{on_attach = on_attach}
    lspconfig.gopls.setup{on_attach = on_attach}
    lspconfig.rust_analyzer.setup{
        on_attach = on_attach,
        cmd = { "rustup", "run", "stable", "rust-analyzer" }
    }
    lspconfig.tsserver.setup{on_attach = on_attach}
    lspconfig.svelte.setup{on_attach = on_attach}

    local haxe_server_path = "/home/xenobas/Desktop/Projects/libs/haxe-language-server/bin/server.js"
    lspconfig.haxe_language_server.setup{
        on_attach = on_attach,
        cmd = {"node", haxe_server_path} 
    }

    lspconfig.jsonls.setup{
        on_attach = on_attach,
        capabilities = capabilities,
    }
    lspconfig.cssls.setup{
        on_attach = on_attach,
        capabilities = capabilities,
    }
    lspconfig.emmet_ls.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
        init_options = {
            html = {
                options = {
                    ["bem.enabled"] = true,
                }
            }
        }
    }
end

return M
