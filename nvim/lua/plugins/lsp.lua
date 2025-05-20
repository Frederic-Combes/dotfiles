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
            local config = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities({})

            local base = { settings = { capabilities = capabilities } }

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

            config.lua_ls.setup(vim.tbl_extend('force', base, lua_ls))
            config.clangd.setup(base)
            config.pyright.setup(vim.tbl_extend('force', base, pyright))
            config.ruff.setup(base)
            config.glsl_analyzer.setup(base)
        end,
    },
    {
        "tpope/vim-commentary"
    }
}
