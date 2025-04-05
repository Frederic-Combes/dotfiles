return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-python",
    },
    config = function()
        local test = require("neotest")
        local python = require("neotest-python")

        test.setup({
            adapters = {
                python({
                    dap = { justMyCode = false },
                    args = { "--log-level", "DEBUG" },
                    runner = "pytest",
                    pytest_discover_instances = true,
                }),
            },
        })

        local run_test = function()
            test.run.run()
        end
        local run_tests_in_file = function()
            test.run.run(vim.fn.expand("%"))
        end
        local debug_test = function()
            test.run.run({ strategy = "dap" })
        end
        local debug_last_test = function()
            test.run.run_last({ strategy = "dap" })
        end
        local stop_test = function()
            test.run.stop()
        end
        local show_test_output = function()
            test.output.open({ enter = true })
        end
        local toggle_test_output_pane = function()
            test.output_panel.toggle()
        end
        local goto_prev_failed_test = function()
            test.jump.prev({ status = "failed" })
        end
        local goto_next_failed_test = function()
            test.jump.next({ status = "failed" })
        end

        vim.keymap.set("n", "<leader>tt", run_test, {})
        vim.keymap.set("n", "<leader>ta", run_tests_in_file, {})
        vim.keymap.set("n", "<leader>tb", debug_test, {})
        vim.keymap.set("n", "<leader>tB", debug_last_test, {})
        vim.keymap.set("n", "<leader>ts", stop_test, {})
        vim.keymap.set("n", "<leader>th", show_test_output, {})
        vim.keymap.set("n", "<leader>to", toggle_test_output_pane, {})
        vim.keymap.set("n", "<leader>tj", goto_prev_failed_test, {})
        vim.keymap.set("n", "<leader>tl", goto_next_failed_test, {})
    end,
}
