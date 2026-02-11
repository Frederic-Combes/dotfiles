local function current_selection()
    -- Return nothing if not in (character or line) visual mode
    local mode = vim.api.nvim_get_mode().mode
    if mode ~= 'v' and mode ~= 'V' then return end

    local cursor_start = vim.fn.getpos('v')
    local cursor_finish = vim.fn.getpos('.')

    -- Cursor lines are 1 indexed, while the buffer lines are 0 indexed, so offset by 1
    local start_row = cursor_start[2] - 1
    local finish_row = cursor_finish[2] - 1

    local lines = vim.api.nvim_buf_get_lines(0, start_row, finish_row + 1, false)

    if mode == "v" then
        -- Cursor columns are 1 indexed, while the buffer columns are 0 indexed, so offset by 1
        local start_col = cursor_start[3] - 1 + cursor_start[4]
        local finish_col = cursor_finish[3] - 1 + cursor_finish[4]

        -- NOTE: must clip the last line to length first, then the first line for cases where the
        -- start line is the finish line
        lines[#lines] = vim.fn.strpart(lines[#lines], 0, finish_col + 1)
        lines[1] = vim.fn.strpart(lines[1], start_col, #lines[1])
    end

    return table.concat(lines, '\n')
end

local function repl_execute_current_selection(dap)
    local function exec()
        local selection = current_selection()

        if selection == nil then return end

        dap.repl.execute(selection)
    end

    return exec
end

local function repl_execute_current_word(dap)
    local function exec()
        dap.repl.execute(vim.fn.expand("<cword>"))
    end

    return exec
end

local function eval_current_selection(dap)
    local function eval()
        local selection = current_selection()

        if selection == nil then return end

        dap.eval(selection, { enter = true })
    end

    return eval
end


local function eval_current_word(dap)
    local function eval()
        return dap.eval(vim.fn.expand('<cword>'), { enter = true })
    end

    return eval
end


return { {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")
        local widgets = require("dap.ui.widgets")

        ui.setup({
            layouts = { {
                size = 15,
                position = "bottom",
                elements = {
                    { id = "watches", size = 0.75 },
                    { id = "stacks",  size = 0.25 },
                },
            } },
            mappings = {
                edit = "d",
                remove = "s",
                expand = "<Tab>",
                open = "<CR>",
                repl = "r",
                toggle = "t"
            },
        })

        local prefix = "<leader>b"
        vim.keymap.set("n", prefix .. "t", dap.toggle_breakpoint, {})
        vim.keymap.set("n", prefix .. "l", dap.continue, {})
        vim.keymap.set("n", prefix .. "i", dap.step_into, {})
        vim.keymap.set("n", prefix .. "k", dap.step_out, {})
        vim.keymap.set("n", prefix .. "o", dap.step_over, {})
        vim.keymap.set("n", prefix .. "j", dap.terminate, {})
        vim.keymap.set("n", prefix .. "b", eval_current_word(ui), {})
        vim.keymap.set("v", prefix .. "b", eval_current_selection(ui), {})

        -- Open breakpoints list
        local function list_breakpoints()
            ui.float_element("breakpoints", { enter = true, position = "center" })
        end
        vim.keymap.set("n", "<leader>fb", list_breakpoints)

        -- Open repl
        local function open_repl()
            ui.float_element("repl", { enter = true, position = "center" })
        end
        vim.keymap.set("n", prefix .. "f", open_repl)
        vim.keymap.set("n", prefix .. "q", open_repl)

        vim.keymap.set("n", "<leader>ec", ui.toggle, {})

        dap.listeners.before.attach.dapui_config = ui.open
        dap.listeners.before.launch.dapui_config = ui.open
        dap.listeners.before.event_terminated.dapui_config = ui.close
        dap.listeners.before.event_exited.dapui_config = ui.close

        vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
    end,
}, {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    config = function()
        local debugger = require("dap-python")

        debugger.setup("uv")
    end,
}
}
