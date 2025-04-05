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

local function toggle_loclist()
    local windows = vim.fn.getwininfo()
    for _, win in pairs(windows) do
        if win["loclist"] == 1 then
            vim.cmd.cclose()
            return
        end
    end
    vim.cmd.copen()
end

vim.keymap.set('n', '&', toggle_quickfix, { desc = "Toggle Quickfix Window" })
vim.keymap.set('n', 'é', toggle_loclist, { desc = "Toggle Loclist Window" })
