return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
        },
        config = function()
            local telescope = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", telescope.find_files)
            vim.keymap.set("n", "<C-a>", telescope.commands)
            vim.keymap.set("n", "<leader>fg", telescope.live_grep)
            vim.keymap.set("n", "<leader>fb", telescope.buffers)
            vim.keymap.set("n", "<leader>fp", telescope.pickers)
            vim.keymap.set("n", "<leader>fh", telescope.help_tags)
            vim.keymap.set("n", "gk", telescope.lsp_references)
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        n = {
                            ["k"] = actions.move_selection_next,
                            ["i"] = actions.move_selection_previous,
                            ["j"] = actions.toggle_selection,
                            ["h"] = actions.toggle_selection,
                            ["<s-i>"] = actions.preview_scrolling_up,
                            ["<s-k>"] = actions.preview_scrolling_down,
                            ["<c-j>"] = false, --actions.preview_scrolling_left,
                            ["<c-l>"] = false, --actions.preview_scrolling_right,
                            ["o"] = actions.select_default,
                            ["O"] = actions.select_vertical,
                            ["u"] = actions.toggle_selection,
                            ["U"] = actions.send_selected_to_qflist,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}


