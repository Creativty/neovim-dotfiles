local M = {}

function M.setup()
    -- ODIN
    vim.cmd([[ au BufNewFile,BufRead *.odin set syntax=odin ]])
    vim.cmd([[ au BufNewFile,BufRead *.odin set filetype=odin ]])
    --[=[
    -- HAXE
    vim.cmd([[ au BufNewFile,BufRead *.hx set syntax=haxe ]])
    vim.cmd([[ au BufNewFile,BufRead *.hx set filetype=haxe ]])
    -- HXML
    vim.cmd([[ au BufNewFile,BufRead *.hxml set syntax=haxe ]])
    vim.cmd([[ au BufNewFile,BufRead *.hxml set filetype=haxe ]])
    --]=]
end

return M
