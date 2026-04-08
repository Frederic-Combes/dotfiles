return {
  "coder/claudecode.nvim",
  config = function()
    require("claudecode").setup({
      terminal = {
        split_side = "right",
        split_width_percentage = 0.40,
        provider = "native",
      },
      diff_opts = {
        open_in_new_tab = true,
        hide_terminal_in_new_tab = true,
      },
    })

    vim.keymap.set("n", "<leader>ea", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude terminal" })

    vim.keymap.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude terminal" })
    vim.keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude conversation" })
    vim.keymap.set("n", "<leader>aR", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue last Claude conversation" })
    vim.keymap.set("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
    vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer to Claude" })
    vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send selection to Claude" })
  end,
}
