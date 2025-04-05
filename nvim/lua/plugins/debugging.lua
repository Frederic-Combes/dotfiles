return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local widgets = require("dap.ui.widgets")

        dapui.setup()

        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>do", dap.continue, {})
        vim.keymap.set("n", "<leader>dl", dap.step_into, {})
        vim.keymap.set("n", "<leader>dk", dap.step_over, {})
        vim.keymap.set("n", "<leader>dj", dap.step_out, {})
        vim.keymap.set("n", "<leader>dd", dap.repl.open, {})

        vim.keymap.set("n", "<leader>dh", widgets.hover, {})

        dap.listeners.before.attach.dapui_config = dapui.open
        dap.listeners.before.launch.dapui_config = dapui.open
        dap.listeners.before.event_terminated.dapui_config = dapui.close
        dap.listeners.before.event_exited.dapui_config = dapui.close
    end,
}
