return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- NOTE: Stylua formatting must be configured
                --null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.mypy,
                -- NOTE: Do not use spell completion, as it provides Text completion
                -- that are mostly always a nuissance
                --null_ls.builtins.completion.spell,
            },
        })
    end,
}
