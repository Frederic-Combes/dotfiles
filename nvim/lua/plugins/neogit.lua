return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local neogit = require("neogit")

        neogit.setup({
            mappings = {
                status = {
                    ["j"] = false,
                    ["l"] = false,
                    ["i"] = false,
                    ["k"] = false,
                    ["<leader>eg"] = "Close",
                },
                popup = {
                    ["l"] = false,
                    ["i"] = false,
                    ["w"] = false,
                }
            }
        })

        vim.keymap.set("n", "<leader>eg", "<cmd>Neogit<cr>", { desc = "Op(e)n neo(g)it status window" })
    end
}
