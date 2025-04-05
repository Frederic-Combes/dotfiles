return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal left<CR>")
        vim.keymap.set("n", "<leader>eq", ":Neotree filesystem close left<CR>")
        require("neo-tree").setup({
            window = {
                mappings = {
                    ["q"] = "add",
                    ["Q"] = "add_directory",
                    ["f"] = "add",
                    ["F"] = "add_directory",
                    ["e"] = "copy_to_clipboard",
                    ["z"] = "cut_to_clipboard",
                    ["a"] = "paste_from_clipboard",
                    ["s"] = "delete",
                    ["l"] = "open",
                    ["j"] = "close_node",
                    ["J"] = "close_all_subnodes",
                    ["i"] = "noop",
                    ["k"] = "noop",
                    ["y"] = "noop",
                    ["w"] = "noop",
                    ["h"] = "toggle_hidden",
                },
            },
        })
    end,
}
