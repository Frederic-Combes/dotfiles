return {
  "sindrets/diffview.nvim",
  config = function()
    local actions = require("diffview.actions")
    local nav = {
      { "n", "i", actions.prev_entry,   { desc = "Previous entry" } },
      { "n", "k", actions.next_entry,   { desc = "Next entry" } },
      { "n", "j", actions.close_fold,   { desc = "Collapse directory" } },
      { "n", "l", actions.select_entry, { desc = "Expand/open entry" } },
    }
    require("diffview").setup({
      keymaps = {
        file_panel = nav,
        file_history_panel = nav,
        view = {
          { "n", "xi", actions.open_fold,  { desc = "Expand fold" } },
          { "n", "xk", actions.close_fold, { desc = "Collapse fold" } },
        },
      }
    })
  end
}
