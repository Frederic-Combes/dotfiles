local wezterm = require("wezterm")

local config = wezterm.config_builder()

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.font = wezterm.font("0xProto Nerd Font Mono")
config.audible_bell = "Disabled"
config.color_scheme = "catppuccin-mocha"

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true

local a = wezterm.action

config.leader = { key = "s", mods = "ALT", timeout_miliseconds = 1000 }
config.keys = {
    { key = "o",  mods = "ALT",      action = a.SplitHorizontal },
    { key = "u",  mods = "ALT",      action = a.SplitVertical },
    { key = "g",  mods = "LEADER",   action = a.PaneSelect },
    { key = "i",  mods = "ALT",      action = a.ActivatePaneDirection("Up") },
    { key = "k",  mods = "ALT",      action = a.ActivatePaneDirection("Down") },
    { key = "j",  mods = "ALT",      action = a.ActivatePaneDirection("Left") },
    { key = "l",  mods = "ALT",      action = a.ActivatePaneDirection("Right") },
    { key = "p",  mods = "ALT|CTRL", action = a.ShowTabNavigator },
    { key = "f",  mods = "ALT",      action = a.SpawnTab("CurrentPaneDomain") },
    { key = "q",  mods = "ALT",      action = a.SpawnTab("CurrentPaneDomain") },
    { key = "&",  mods = "ALT",      action = a.ActivateTab(0) },
    { key = "2",  mods = "ALT",      action = a.ActivateTab(1) },
    { key = "\"", mods = "ALT",      action = a.ActivateTab(2) },
    { key = "'",  mods = "ALT",      action = a.ActivateTab(3) },
    { key = "e",  mods = "ALT",      action = a.ActivateCopyMode },
    { key = "a",  mods = "ALT",      action = a.PasteFrom("Clipboard") },
}

config.key_tables = {
    copy_mode = {
        { key = 'Escape', mods = 'NONE',  action = a.CopyMode("Close") },
        { key = "i",      mods = "NONE",  action = a.CopyMode("MoveUp") },
        { key = "I",      mods = "SHIFT", action = a.CopyMode { MoveByPage = -0.5 } },
        { key = "k",      mods = "NONE",  action = a.CopyMode("MoveDown") },
        { key = "K",      mods = "SHIFT", action = a.CopyMode { MoveByPage = 0.5 } },
        { key = "j",      mods = "NONE",  action = a.CopyMode("MoveLeft") },
        { key = "l",      mods = "NONE",  action = a.CopyMode("MoveRight") },
        { key = "u",      mods = "NONE",  action = a.CopyMode("MoveBackwardWord") },
        { key = "U",      mods = "SHIFT", action = a.CopyMode("MoveToStartOfLineContent") },
        { key = "o",      mods = "NONE",  action = a.CopyMode("MoveForwardWord") },
        { key = "O",      mods = "SHIFT", action = a.CopyMode("MoveToEndOfLineContent") },
        { key = "v",      mods = "NONE",  action = a.CopyMode { SetSelectionMode = "Cell" } },
        { key = "V",      mods = "SHIFT", action = a.CopyMode { SetSelectionMode = "Line" } },
        {
            key = "e",
            mods = "NONE",
            action = a.Multiple {
                { CopyTo = "ClipboardAndPrimarySelection" },
                { CopyMode = "Close" } }
        },
        {
            -- Copies the current line
            key = "z",
            mods = "NONE",
            action = wezterm.action_callback(function(window, pane)
                window:perform_action(a.CopyMode("MoveToStartOfLineContent"), pane)
                window:perform_action(a.CopyMode { SetSelectionMode = "Cell" }, pane)
                window:perform_action(a.CopyMode("MoveToEndOfLineContent"), pane)
                window:copy_to_clipboard(window:get_selection_text_for_pane(pane))
                window:perform_action(a.ClearSelection, pane)
                window:perform_action(a.CopyMode("Close"), pane)
            end)
        },
        {
            -- Copies the current line and paste it
            key = "Z",
            mods = "SHIFT",
            action = wezterm.action_callback(function(window, pane)
                window:perform_action(a.CopyMode("MoveToStartOfLineContent"), pane)
                window:perform_action(a.CopyMode { SetSelectionMode = "Cell" }, pane)
                window:perform_action(a.CopyMode("MoveToEndOfLineContent"), pane)
                window:copy_to_clipboard(window:get_selection_text_for_pane(pane))
                window:perform_action(a.ClearSelection, pane)
                window:perform_action(a.CopyMode("Close"), pane)
                window:perform_action(a.PasteFrom("Clipboard"), pane)
            end)
        },
    }
}

return config
