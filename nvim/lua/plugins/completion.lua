local function show_and_select_prev(cmp)
    local function execute()
        if cmp.show({ initial_selected_item_idx = 1 }) then
            return cmp.select_prev()
        end
    end
    return execute
end

return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',
        config = function(plugin, opts)
            local cmp = require("blink.cmp")

            cmp.setup(opts)

            -- NOTE: Cannot map <c-i> here because in insert more, it's the same as <tab>
            vim.keymap.set("i", "<c-k>", show_and_select_prev(cmp), {})
        end,
        opts = {
            keymap = {
                preset = 'none',
                ["<c-space>"] = { "show", "fallback" },
                ["<c-i>"] = { "select_next", "fallback" },
                ["<c-k>"] = { "select_prev", "fallback" },
                ["<c-l>"] = {
                    "scroll_documentation_down",
                    "snippet_forward",
                    "fallback"
                },
                ["<c-j>"] = {
                    "scroll_documentation_up",
                    "snippet_backward",
                    "fallback"
                },
                ["<tab>"] = { "select_and_accept", "fallback" },
                ["<c-s>"] = {
                    -- When the menu is open, show the documentation
                    "show_documentation",
                    "hide_documentation",
                    -- When the menu is closed, show the signature
                    "show_signature",
                    "hide_signature",
                },
            },
            appearance = { nerd_font_variant = 'mono' },
            completion = {
                documentation = { auto_show = false, window = { border = "rounded" } },
                list = { selection = { auto_insert = false } },
                accept = { auto_brackets = { enabled = false } },
            },
            signature = {
                enabled = true,
                window = { border = "rounded" },
            },
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            cmdline = {
                keymap = { preset = 'inherit' },
                completion = {
                    menu = { auto_show = true },
                    list = { selection = { auto_insert = false } },
                },
            },

        },
        opts_extend = { "sources.default" }
    }
}
