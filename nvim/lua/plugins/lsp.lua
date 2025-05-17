local on_attach = function(client, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    local buf = "<Cmd>lua vim.lsp.buf."
    local diag = "<Cmd>lua vim.diagnostic."
    local telescope = "<Cmd>lua require('telescope.builtin')."

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }

    local function bind(mode, shortcut, action)
        vim.api.nvim_buf_set_keymap(bufnr, mode, shortcut, action, opts)
    end

    bind("n", "gi", buf .. "declaration()<CR>")
    bind("n", "gi", buf .. "definition()<CR>")
    bind("n", "gk", telescope .. "lsp_references()<CR>")
    bind("n", "gj", diag .. "goto_prev()<CR>")
    bind("n", "gl", diag .. "goto_next()<CR>")

    bind("n", "<leader>gf", buf .. "format()<CR>")
    bind("n", "<leader>rr", buf .. "rename()<CR>")
    bind("n", "<leader>ra", buf .. "code_action()<CR>")
    bind("n", "<leader>rk", diag .. "open_float()<CR>")

    bind("n", "S", buf .. "hover()<CR>")
end

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pyright",
                    "ruff",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
      dependencies = { 'saghen/blink.cmp' },
        config = function()
            local config = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities({})

            local base_setup = {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            config.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true)
                        },
                        telemetry = { enable = false }
                    }

                }
            })
            config.clangd.setup(base_setup)
            config.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off",
                            exclude = { "build/", "**/__pycache__", ".git" },
                        },
                    },
                },
            })
            config.ruff.setup(base_setup)
            config.glsl_analyzer.setup(base_setup)
        end,
    },
}
