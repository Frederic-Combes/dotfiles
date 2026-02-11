return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "append",
                ui = {
                    keymaps = {
                        toggle_package_expand = "<tab>",
                        install_package = "f",
                        toggle_help = "?",
                    }
                }
            })
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
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

            local base = { capabilities = capabilities }

            local lua_ls = {
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
            }

            local pyright = {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off",
                            exclude = { "build/", "**/__pycache__", ".git" },
                        },
                    },
                },
            }

            vim.lsp.config["luals"] = vim.tbl_extend('force', base, lua_ls)
            vim.lsp.config["clangd"] = base
            vim.lsp.config["pyright"] = vim.tbl_extend('force', base, pyright)
            vim.lsp.config["ruff"] = base
            vim.lsp.config["glsl_analyzer"] = base

            vim.lsp.enable("luals")
            vim.lsp.enable("clangd")
            vim.lsp.enable("pyright")
            vim.lsp.enable("ruff")
            vim.lsp.enable("glsl_analyzer")
        end,
    },
    {
        "tpope/vim-commentary"
    }
}
