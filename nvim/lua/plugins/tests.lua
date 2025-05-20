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
                }),
            },
            icons = {
                passed = "",
                failed = "",
            },
            summary = {
                animated = true,
                mappings = {
                    attach = "a",
                    clear_marked = "x",
                    clear_target = "X",
                    debug = "b",
                    debug_marked = "B",
                    expand = { "j", "l" },
                    expand_all = { "J", "L" },
                    jumpto = { "q", "f" },
                    mark = "<Tab>",
                    next_failed = "K",
                    output = "o",
                    previous_failed = "I",
                    run = "t",
                    run_marked = "T",
                    short = "O",
                    stop = "s",
                    target = "x",
                    watch = "h",
                },
            }

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
        local clear_test_output_pane = function()
            test.output_panel.clear()
        end
        local goto_prev_test = function()
            test.jump.prev({ status = "failed" })
        end
        local goto_prev_failed_test = function()
            test.jump.prev({ status = "failed" })
        end
        local goto_next_test = function()
            test.jump.next({ status = "failed" })
        end
        local goto_next_failed_test = function()
            test.jump.next({ status = "failed" })
        end
        local toggle_test_list_pane = function()
            test.summary.toggle()
        end

        local prefix = "<leader>t"
        vim.keymap.set("n", prefix .. "t", run_test, {})
        vim.keymap.set("n", prefix .. "a", run_tests_in_file, {})
        vim.keymap.set("n", prefix .. "b", debug_test, {})
        vim.keymap.set("n", prefix .. "B", debug_last_test, {})
        vim.keymap.set("n", prefix .. "s", stop_test, {})
        vim.keymap.set("n", prefix .. "o", show_test_output, {})
        vim.keymap.set("n", prefix .. "h", toggle_test_output_pane, {})
        vim.keymap.set("n", prefix .. "xh", clear_test_output_pane, {})
        vim.keymap.set("n", prefix .. "i", goto_prev_failed_test, {})
        vim.keymap.set("n", prefix .. "j", goto_prev_test, {})
        vim.keymap.set("n", prefix .. "k", goto_next_failed_test, {})
        vim.keymap.set("n", prefix .. "l", goto_next_test, {})
        vim.keymap.set("n", "<leader>et", toggle_test_list_pane, {})
    end,
}
