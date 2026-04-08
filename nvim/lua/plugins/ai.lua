return {
  "gutsavgupta/nvim-gemini-companion",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("gemini").setup({
      cmds = { "GOOGLE_CLOUD_PROJECT=duet-assistant npx @google/gemini-cli" },
      win = { preset = "right-fixed" },
    })
  end,
  keys = {
    { "<leader>ea", "<cmd>GeminiToggle<cr>",      desc = "Toggle Gemini sidebar" },
    { "<leader>ao", "<cmd>GeminiSwitchToCli<cr>", desc = "Spawn or switch to AI session" },
    { "<leader>al", "<cmd>GeminiSend<cr>",        mode = { "x" },                        desc = "Send selection to Gemini" },
  },
}
