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
                    -- "elmls",
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


            if vim.fn.has("nvim-0.11") then
                vim.lsp.config("*", { capabilities = capabilities })
                vim.lsp.config("lua_ls", lua_ls)
                vim.lsp.config("pyright", pyright)

                vim.lsp.enable("lua_ls")
                vim.lsp.enable("clangd")
                vim.lsp.enable("pyright")
                vim.lsp.enable("ruff")
                vim.lsp.enable("glsl_analyzer")
                vim.lsp.enable("elmls")
            else
                local config = require("lspconfig")

                config.lua_ls.setup(vim.tbl_extend('force', base, lua_ls))
                config.clangd.setup(base)
                config.pyright.setup(vim.tbl_extend('force', base, pyright))
                config.ruff.setup(base)
                config.glsl_analyzer.setup(base)
                config.elmls.setup(base)
            end
        end,
    },
    {
        "tpope/vim-commentary"
    }
}
