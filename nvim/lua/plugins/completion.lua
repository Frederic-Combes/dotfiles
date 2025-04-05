return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-i>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ["<C-k>"] = cmp.mapping(
                        cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                        { "i", "c" }
                    ),
                    ["<Up>"] = cmp.mapping(
                        cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                        { "i", "c" }
                    ),
                    ["<Down>"] = cmp.mapping(
                        cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                        { "i", "c" }
                    ),
                    -- NOTE: Caution: In some terminals, C-i indistinguishable from Tab
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-l>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }),
            })
        end,
    },
}
