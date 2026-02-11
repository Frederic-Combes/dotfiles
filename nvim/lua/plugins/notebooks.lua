-- TODO: Smart kernel initialization with uv:
-- 1. VIRTUAL_ENV defined
--      1. Try to activate the kernel with the same name
--      2. If it fails, use uv to see if ipykernel is installed
--      3. If ipykernel is installed, create a kernel for that venv
--      4. Activate that kernel
-- 2. VIRTUAL_ENV not defined
--      1. User picks from the list
-- local function init_kernel_matching_virtual_environment()
--     vim.print("Grabbing the active virtual environment...")
--     local venv = os.getenv("VIRTUAL_ENV")
--     if venv ~= nil then
--         -- in the form of /home/.../VENV_NAME
--         venv = string.match(venv, "/.+/(.+)")
--         vim.cmd(("MoltenInit %s"):format(venv))
--     else
--         vim.print("There are no active virtual environment")
--         -- vim.cmd("MoltenInit python3")
--     end
-- end

return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        dependencies = { "3rd/image.nvim", },
        build = ":UpdateRemotePlugins",
        init = function()
            vim.g.python3_host_prog = vim.fn.expand("~/.venv/molten-nvim/bin/python")
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20

            vim.g.molten_auto_open_output = false
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = true

            vim.keymap.set("n", "<leader>jo", ":noautocmd MoltenEnterOutput<CR>",
                { desc = "Open output window", silent = true })
            vim.keymap.set("n", "<leader>ju", ":MoltenHideOutput<CR>",
                { desc = "Close output window", silent = true })
            vim.keymap.set("n", "<leader>ji", ":MoltenOpenInBrowser<CR>",
                { desc = "Open output in browser", silent = true })
            vim.keymap.set("n", "<leader>jp", ":MoltenInit<CR>",
                { desc = "Initialize Molten", silent = true })
        end,
    },
    -- {
    --     "3rd/image.nvim",
    --     opts = {
    --         backend = "kitty",
    --         processor = "magick_rock",
    --         integrations = {},                        -- do whatever you want with image.nvim's integrations
    --         max_width = 100,                          -- tweak to preference
    --         max_height = 12,                          -- ^
    --         max_height_window_percentage = math.huge, -- this is necessary for a good experience
    --         max_width_window_percentage = math.huge,
    --         window_overlap_clear_enabled = true,
    --         window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    --     }
    -- },
    -- {
    --     'willothy/wezterm.nvim',
    --     config = true
    -- },
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "quarto", "markdown" },
        config = function()
            opts = {
                lspFeatures = {
                    enabled = true,
                    languages = { "python" },
                    chunks = "all",
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
                codeRunner = {
                    enabled = true,
                    -- default runner
                    default_method = "molten",
                    -- filetype runners (takes precedence over the default method)
                    ft_runners = {},
                    -- filetype never send to runners
                    never_run = { 'yaml' },
                },
            }
            require("quarto").setup(opts)

            local runner = require("quarto.runner")
            vim.keymap.set("n", "<leader>jr", runner.run_cell, { desc = "Run cell", silent = true })
            vim.keymap.set("n", "<leader>ja", runner.run_above, { desc = "Run cell and above", silent = true })
            vim.keymap.set("n", "<leader>jA", runner.run_all, { desc = "Run all cells", silent = true })
            vim.keymap.set("v", "<leader>jr", runner.run_range, { desc = "Run visual range", silent = true })
        end
    },
    {
        "goerz/jupytext.nvim",
    }
}
