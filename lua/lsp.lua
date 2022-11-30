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
        buffer = nil,
        silent = t,
        noremap = true,
        nowait = false
    }
    local n_mappings = {
        l = {
            name = "LSP Functions",
            r = { function() vim.diagnostic.open_float ({ buffer = bufnr}) end, "Diagnostic floating" },
            t = { function() vim.diagnostic.show       ({ buffer = bufnr}) end, "Diagnostic show"     },
            h = { function() vim.lsp.buf.hover         ({ buffer = bufnr}) end, "Hover"               },
            d = { function() vim.lsp.buf.definition    ({ buffer = bufnr}) end, "Definition"          },
            e = { function() vim.lsp.buf.declaration   ({ buffer = bufnr}) end, "Declaration"         },
            a = { function() vim.lsp.buf.code_action   ({ buffer = bufnr}) end, "Code Action"         },
            p = { function() vim.diagnostic.goto_next  ({ buffer = bufnr}) end, "Goto Next"           },
            p = { function() vim.diagnostic.goto_prev  ({ buffer = bufnr}) end, "Goto Previous"       },
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

    lspconfig.ccls.setup{on_attach = on_attach}
    lspconfig.gopls.setup{on_attach = on_attach}
    lspconfig.rust_analyzer.setup{on_attach = on_attach}
    lspconfig.tsserver.setup{on_attach = on_attach}
    lspconfig.svelte.setup{on_attach = on_attach}
    lspconfig.haxe_language_server.setup{on_attach = on_attach}
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
