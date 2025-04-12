local function toggle_quickfix()
    local windows = vim.fn.getwininfo()
    for _, win in pairs(windows) do
        if win["quickfix"] == 1 then
            vim.cmd.cclose()
            return
        end
    end
    vim.cmd.copen()
end

--local quick_fix = require("qf")
--
--quick_fix.setup({
--  l = {
--    auto_close = true, -- Automatically close location/quickfix list if empty
--    auto_follow = 'prev', -- Follow current entry, possible values: prev, next, nearest, or false to disable
--    auto_follow_limit = 8, -- Do not follow if entry is further away than x lines
--    follow_slow = true, -- Only follow on CursorHold
--    auto_open = true, -- Automatically open list on QuickFixCmdPost
--    auto_resize = true, -- Auto resize and shrink location list if less than `max_height`
--    max_height = 8, -- Maximum height of location/quickfix list
--    min_height = 5, -- Minimum height of location/quickfix list
--    wide = false, -- Open list at the very bottom of the screen, stretching the whole width
--    number = false, -- Show line numbers in list
--    relativenumber = false, -- Show relative line numbers in list
--    unfocus_close = false, -- Close list when window loses focus
--    focus_open = false, -- Auto open list on window focus if it contains items
--  }
--})
--
--local function toggle_loclist()
--    local windows = vim.fn.getwininfo()
--    for _, win in pairs(windows) do
--        if win["loclist"] == 1 then
--            quick_fix.open("l")
--            return
--        end
--    end
--    quick_fix.close("l")
--end

vim.keymap.set('n', '&', toggle_quickfix, { desc = "Toggle Quickfix Window" })
--vim.keymap.set('n', 'é', toggle_loclist, { desc = "Toggle Loclist Window" })
