local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
    source = {
        null_ls.builtins.diagnostics.fish
    }
})
