return {
    "nvimtools/none-ls.nvim",
    dependencies = { "davidmh/cspell.nvim" },
    config = function()
        local lsp = require("null-ls")
        local spell = require("cspell")

        lsp.setup({
            sources = {
                lsp.builtins.diagnostics.mypy,
                spell.diagnostics.with({
                    diagnostics_postprocess = function(diagnostic)
                        diagnostic.severity = vim.diagnostic.severity.HINT
                    end,
                }),
                spell.code_actions,
            },
        })
    end,
}
